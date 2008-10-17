<?php
/**
 * Objeto ActividadController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ActividadController extends ActividadModel {

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
        ActividadView::showAll($this->Find('1=?', array('1')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        ActividadView::editar($this);
    }

    /**
     * Enter description here...
     *
     */
    public function guardar() {
        $this->DB()->StartTrans();

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        $modificado = $_POST['codigo'] ? true : false;
        unset($_POST['codigo']);
        $this->LoadFromPOST( $_POST );
        $this->actividad_resultado = 0;
        //$this->Load('codigo=?', array($_POST['codigo']));
        //$this->LoadFromPOST( $_POST );

        // Validacion del Programa asociado
        $Programa = new ProgramaModel;
        $Programa->Load('nombre=?', array($_POST['programa']));
        if (!$Programa->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El programa no existe</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }
        else {
            $this->programa = $Programa->codigo;
        }

        // Validacion del tipo asociado
        $ActividadTipo = new ActividadTipoModel;
        $ActividadTipo->Load('nombre=?', array($_POST['actividad_tipo']));
        if (!$ActividadTipo->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El tipo no existe</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }
        else {
            $this->actividad_tipo = $ActividadTipo->codigo;
        }
        // Validacion del estado Actividad
        $ActividadEstado = new ActividadEstadoModel;
        $ActividadEstado->Load('nombre=?', array('Nueva'));
        if (!$ActividadEstado->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El estado no existe</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }
        else {
            $this->estado = $ActividadEstado->codigo;
        }

        // Validacion del usuario asociado
        $Usuario = new UsuarioModel;
        $Usuario->Load("(trim(nombres) || ' ' || trim(apellido_paterno) || ' ' || trim(apellido_materno))=?", array(trim($_POST['usuario'])));
        if (!$Usuario->usuario) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El responsable no existe.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }
        else {
            $this->usuario = $Usuario->usuario;
        }

        $this->actividad_resultado = 1;

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
			element.innerHTML = '<p>Actividad " . ($modificado ? "modificada" : "grabada") . " con éxito</p>';
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

        if ( ! $this->Delete() ) {
            $this->DB()->RollbackTrans();
            echo "<script>alert('{$this->ErrorMsg()}');</script>";
        } else {
            $this->DB()->CompleteTrans();
            echo "<script>alert('Actividad eliminada con éxito.');</script>";
        }
    }


    public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY nombre";
        } else {
            $whereOrderBy = "lower(nombre) like '%".strtolower($value)."%' ORDER BY nombre";
        }
        ActividadView::liveSearch($this->Find($whereOrderBy));
    }

}

?>