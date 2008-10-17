<?php
/**
 * Objeto ModuloController.
 *
 * En este archivo se define la clase controladora para los usuarios.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ModuloController extends ModuloModel {

    function __construct() {
        parent::__construct();
    }


    /**
	 * Enter description here...
	 *
	 */
    public function index() {

        if (!isset($_SESSION['ACL'])) {
            echo HtmlHelper::includeJSFiles(array('prototype', 'effects', 'window', 'debug', 'utils'));
            echo HtmlHelper::includeCSSFiles(array('themes/default', 'themes/alphacube'));
            echo "<script>alert('Tu sesión ha expirado, \\nserás redireccionado al inicio.'); top.window.location.href='".WEB_PATH."'</script>";
            die();
        }


        $modulo = array();
        foreach ($_SESSION['ACL'] as $acl) {
            $modulo[] = $acl['modulo'];
        }
        if (sizeof($modulo)) {
            ModuloView::makeMenu( $this->Find('modulo IS NULL AND dock = false AND codigo IN('.implode(',', $modulo).')') );
        }
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $params
	 */
    public function makeMenu( $params ) {
        $this->Load('nombre=?', array($params[0]));
        ModuloView::makeMenu( $this->Find('modulo=?', array($this->codigo)) );
    }


    /**
	 * Enter description here...
	 *
	 */
    public function admin() {
        ModuloView::showAll( $this->Find('1=?', array('1')) );
    }


    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        ModuloView::editar();
    }


    /**
	 * Enter description here...
	 *
	 */
    public function guardar() {

        print_r($_POST);

        $this->DB()->StartTrans();

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        unset($_POST['codigo']);
        $this->LoadFromPOST( $_POST );

        $this->dock = isset($_POST['dock']) ? 't' : 'f';

        // Validacion del Modulo asociado
        /*
        $Modulo = new ModuloModel;
        $Modulo->Load('descripcion=?', array($_POST['modulo']));
        $this->modulo = $Modulo->codigo;
        */
        $this->modulo = $_POST['modulo_codigo'] ? $_POST['modulo_codigo'] : null;

        if ( ! $this->Save() ) {
            $this->DB()->RollbackTrans();
            echo "<script>
			var element = $('transparent_ajax_error');
			element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
			TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>";
        } else {
            $this->DB()->CompleteTrans();
            echo "<script>
			var element = $('transparent_ajax_notice');
			element.innerHTML = '<p>M&oacute;dulo grabado con &eacute;xito</p>';
			TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}})</script>";
        }
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $value
	 */
    public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY descripcion";
        } else {
            $whereOrderBy = "lower(descripcion) like '%".strtolower($value)."%' ORDER BY descripcion";
        }
        ModuloView::liveSearch($this->Find($whereOrderBy));
    }


    public function eliminar($args) {
        $this->DB()->StartTrans();

        $GrupoModulo = new GrupoModuloModel;

        $this->Load('codigo=?', array($_POST['codigo']));
        $sql = "DELETE FROM {$GrupoModulo->_table} WHERE modulo = {$this->codigo}";

        if ($this->DB()->Execute($sql) && $this->Delete()) {
            $this->DB()->CompleteTrans();
            echo "<script>FunFamilia.alert('Módulo eliminado con éxito');</script>";
        }
        else {
            $this->DB()->RollbackTrans();
            echo "<script>FunFamilia.alert('<div style=\"text-align: left; font-weight: bold; color: #FF0000\">"
            . str_replace("\n", "<br />", '('.$this->DB()->ErrorNo().') '.$this->DB()->ErrorMsg()) . "</div>');</script>";
        }
    }

}

?>