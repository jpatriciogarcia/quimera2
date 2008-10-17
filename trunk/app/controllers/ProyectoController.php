<?php
/**
 * Objeto ProyectoController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ProyectoController extends ProyectoModel{

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
        ProyectoView::showAll($this->Find('eliminado=?', array('FALSE')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        ProyectoView::editar($this);
    }

    /**
     * Enter description here...
     *
     */

    public function guardar() {
        $this->DB()->StartTrans();

        $CentroFamiliar = new CentroFamiliarModel;
        $CentroFamiliar->Load('nombre=?', array($_POST['centro_familiar']));
        if (!$CentroFamiliar->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El centro familiar no existe.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        $Usuario = new UsuarioModel;
        $Usuario->Load("(trim(nombres) || ' ' || trim(apellido_paterno) || ' ' || trim(apellido_materno))=?", array(trim($_POST['usuario'])));
        if (!$Usuario->usuario) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El responsable no existe.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        $this->Load('nombre=? AND centro_familiar=?', array($_POST['nombre'], $CentroFamiliar->codigo));
        if ($this->codigo && !$this->_saved) {
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>Ya existe un proyecto con este nombre para este centro.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        $modificado = $_POST['codigo'] ? true : false;
        unset($_POST['codigo']);
        $this->LoadFromPOST( $_POST );
        $this->centro_familiar = $CentroFamiliar->codigo;
        $this->usuario = $Usuario->usuario;
        $this->eliminado = 'FALSE';
        $this->activo = isset($_POST['activo']) ? 't' : 'f';

        if ( ! $this->Save() ) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        } else {
            $this->DB()->CompleteTrans();
            echo "<script>
			$('codigo').value = " . $this->codigo . ";
			var element = $('transparent_ajax_notice');
			element.innerHTML = '<p>Proyecto " . ($modificado ? "modificado" : "grabado") . " con éxito</p>';
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
        $this->DB()->StartTrans();
        $this->Load('codigo=?', array($_POST['codigo']));
        $this->eliminado = 'TRUE';

        if ($this->Save()) {
            $this->DB()->CompleteTrans();
            echo "<script>FunFamilia.alert('Proyecto eliminado con éxito');</script>";
        }
        else {
            $this->DB()->RollbackTrans();
            echo "<script>FunFamilia.alert('" . htmlentities($this->ErrorMsg()) . "');</script>";
        }
    }


    public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY nombre";
        } else {
            $whereOrderBy = "lower(nombre) like '%".strtolower($value)."%' ORDER BY nombre";
        }
        ProyectoView::liveSearch($this->Find($whereOrderBy));
    }

}

?>