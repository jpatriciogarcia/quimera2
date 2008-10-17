<?php
/**
 * Objeto CentroFamiliarController.
 *
 * En este archivo se define la clase controladora para los usuarios.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class CentroFamiliarController extends CentroFamiliarModel {

    /**
     * Enter description here...
     *
     */
    function __construct() {
        parent::__construct();
    }

    /**
     * Enter description here...
     *
     */
    public function index() {
        CentroFamiliarView::showAll($this->Find('1=?', array('1')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        CentroFamiliarView::editar($this);
    }

    /**
     * Enter description here...
     *
     */
    public function guardar() {
        $this->DB()->StartTrans();

        $this->Load('nombre=?', array($_POST['nombre']));

        if ($this->codigo && !$this->_saved) {
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>Ya existe un centro con este nombre.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        $Comuna = new ComunaModel;
        $Comuna->Load('comuna=?', array($_POST['comuna']));
        if (!$Comuna->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>La comuna no existe.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        $modificado = $_POST['codigo'] ? true : false;
        unset($_POST['codigo']);
        $this->LoadFromPOST( $_POST );
        $this->comuna = $Comuna->codigo;
        $this->activo = isset($_POST['activo']) ? 't' : 'f';

        if ( ! $this->Save() ) {
            $this->DB()->RollbackTrans();
            echo $this->ErrorMsg();
        }
        else {
            $this->DB()->CompleteTrans();
            echo "<script>
			$('codigo').value = " . $this->codigo . "
			var element = $('transparent_ajax_notice');
			element.innerHTML = '<p>Centro " . ($modificado ? "modificado" : "grabado") . " con éxito</p>';
			TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}})
			setTimeout('parent.Windows.getFocusedWindow().close()', 4000);
			</script>";
        }

    }


    /**
     * Enter description here...
     *
     */
    public function eliminar() {
        $this->Load('codigo=?', array($_POST['codigo']));
        if ($this->Delete()) {
            echo "<script>FunFamilia.alert('Centro eliminado con éxito');</script>";
        }
        else {
            echo "<script>FunFamilia.alert('" . htmlentities($this->ErrorMsg()) . "');</script>";
        }
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $value
	 */
    public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY nombre";
        } else {
            $whereOrderBy = "lower(nombre) like '%".strtolower($value)."%' ORDER BY nombre";
        }
        CentroFamiliarView::liveSearch($this->Find($whereOrderBy));
    }
}

?>