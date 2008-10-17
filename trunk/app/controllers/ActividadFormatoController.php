<?php
/**
 * Objeto CentroFamiliarController.
 *
 * En este archivo se define la clase controladora para los usuarios.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ActividadFormatoController extends ActividadFormatoModel {

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
        ActividadFormatoView::showAll($this->Find('1=?', array('1')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        ActividadFormatoView::editar($this);
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
				element.innerHTML = '<p>Ya existe un Formato Actividad con este nombre.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        $ActividadTipo = new ActividadTipoModel();
        $ActividadTipo->Load('nombre=?', array($_POST['actividad_tipo']));
        print_r($ActividadTipo);
        if (!$ActividadTipo->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El tipo de Actividad no existe.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        //comienzo el formulario preguntando por todos los objetos del post
        $this->LoadFromPOST( $_POST );
        //del post actividad tipo, cambio el nombre por el codigo de actividad tipo
        $this->actividad_tipo = $ActividadTipo->codigo;
        
        //Si esta tildado, viene con valor true o false
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
			element.innerHTML = '<p>Formato Actividad " . ($modificado ? "modificado" : "grabado") . " con éxito</p>';
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
            echo "<script>FunFamilia.alert('Formato Actividad eliminado con éxito');</script>";
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
       ActividadFormatoView::liveSearch($this->Find($whereOrderBy));
    }
}

?>