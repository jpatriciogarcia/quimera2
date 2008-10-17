<?php
/**
 * Objeto GrupoModuloController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class GrupoModuloController extends GrupoModuloModel {

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
        GrupoModuloView::showAll($this->Find('1=? ORDER BY grupo, modulo', array('1')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('grupo=? AND modulo=?', array($grupo, $modulo));

        $this->lectura = ereg('r', $this->privilegio) ? 'checked' : '';
        $this->escritura = ereg('w', $this->privilegio) ? 'checked' : '';


        GrupoModuloView::editar($this);
    }

    /**
     * Enter description here...
     *
     */
    public function guardar() {

        $tmp = array();
        $this->DB()->StartTrans();

        $_POST['grupo'] = $_POST['grupo'] ? $_POST['grupo'] : 0;
        $_POST['modulo'] = $_POST['modulo'] ? $_POST['modulo'] : 0;
        $this->Load('grupo=? AND modulo=?', array($_POST['grupo'], $_POST['modulo']));
        if ($this->privilegio) {
            unset($_POST['grupo']);
            unset($_POST['modulo']);
        }
        $this->LoadFromPOST( $_POST );

        if (isset($_POST['lectura'])) {
            $tmp[] = 'r';
        }

        if (isset($_POST['escritura'])) {
            $tmp[] = 'w';
        }

        $this->privilegio = implode('', $tmp);

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
			element.innerHTML = '<p>Grupo-Modulo grabado con &eacute;xito</p>';
			TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}})</script>";
        }
    }

    /**
     * Enter description here...
     *
     */
    public function eliminar() {
        $this->DB()->StartTrans();
        $this->Load('codigo=?', array($_POST['codigo']));

        if ( ! $this->Delete() ) {
            $this->DB()->RollbackTrans();
            echo "<script>alert('{$this->ErrorMsg()}');</script>";
        } else {
            $this->DB()->CompleteTrans();
            echo "<script>alert('GrupoModulo eliminada con éxito.');</script>";
        }
    }


    public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY nombre";
        } else {
            $whereOrderBy = "lower(nombre) like '%".strtolower($value)."%' ORDER BY nombre";
        }
        GrupoModuloView::liveSearch($this->Find($whereOrderBy));
    }

}

?>