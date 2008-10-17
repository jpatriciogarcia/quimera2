<?php
/**
 * Objeto CentroFamiliarController.
 *
 * En este archivo se define la clase controladora para los usuarios.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ProgramaController extends ProgramaModel {

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
        ProgramaView::showAll($this->Find('1=?', array('1')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        ProgramaView::editar($this);
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
        $this->activo = isset($_POST['activo']) ? 't' : 'f';

        // Validacion del Proyecto asociado
        $Proyecto = new ProyectoModel;
        $Proyecto->Load('nombre=?', array($_POST['proyecto']));
        if (!$Proyecto->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El proyecto no existe</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }
        else {
            $this->proyecto = $Proyecto->codigo;
        }

        // Validacion del estado asociado
        $ProgramaEstado = new ProgramaEstadoModel;
        $ProgramaEstado->Load('nombre=?', array($_POST['programa_estado']));
        if (!$ProgramaEstado->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El estado no existe</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }
        else {
            $this->programa_estado = $ProgramaEstado->codigo;
        }

        // Validacion de las fechas
        $fecha_hora = split("[ ]", ereg_replace("[']", "", $this->fecha_inicio));
        $fecha = split("[-]", $fecha_hora[0]);
        $fecha_inicio = mktime(0, 0, 0, $fecha[1]*1, $fecha[2]*1, $fecha[0]*1);

        $fecha_hora = split("[ ]", ereg_replace("[']", "", $this->fecha_termino));
        $fecha = split("[-]", $fecha_hora[0]);
        $fecha_termino = mktime(0, 0, 0, $fecha[1]*1, $fecha[2]*1, $fecha[0]*1);

        if ($fecha_inicio >= $fecha_termino) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>La fecha de término debe ser mayor que la fecha de inicio.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

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
			element.innerHTML = '<p>Programa " . ($modificado ? "modificado" : "grabado") . " con éxito</p>';
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
            echo "<script>alert('Programa eliminado con éxito.');</script>";
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
        ProgramaView::liveSearch($this->Find($whereOrderBy));
    }

}

?>