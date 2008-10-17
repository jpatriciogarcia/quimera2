<?php
/**
 * Objeto SesionController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class SesionController extends SesionModel{

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
        return ;
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));

        $Actividad = new ActividadModel;
        $Actividad->Load('codigo=?', array($codigo));

        $list = array();
        $header = array('');
        $body = array();
        $date = array();

        for ($i = 1; $i <= $Actividad->cantidad_sesiones_programadas; $i++) {
            $header[] = "Sesión N° " . $i;
        }

        $rs = $this->DB()->Execute("select rut_persona
                                    from sesion s
                                    join persona p on (s.rut_persona = p.rut)
                                    where actividad = {$codigo}
                                    group by rut_persona, p.nombres, p.apellido_paterno, p.apellido_materno
                                    order by p.nombres, p.apellido_paterno, p.apellido_materno");

        $date = array();

        while ( ! $rs->EOF ) {
            $Persona = new PersonaModel;
            $Persona->Load('rut=?', array($rs->fields['rut_persona']));
            $row = array($Persona->getNombreCompleto());

            for ($i = 1; $i <= $Actividad->cantidad_sesiones_programadas; $i++) {
                $this->Load('actividad=? and rut_persona=? and numero_sesion=?', array($Actividad->codigo, $Persona->rut, $i));
                $row[] = $this->fecha_inicio ? true : false;

                $idx = $rs->AbsolutePosition()+1;
                //if ($this->numero_sesion == $idx) {
                @$date['fecha_'.$i] = $date['fecha_'.$i] ? $date['fecha_'.$i] : $this->fecha_inicio;
                //}
            }

            $body[$Persona->rut] = $row;
            $rs->MoveNext();
        }

        $list['obj'] = $Actividad;
        $list['header'] = $header;
        $list['body'] = $body;
        $list['date'] = $date;

        SesionView::editar( $list );
    }

    /**
     * Enter description here...
     *
     */

    public function guardar() {

        $Actividad = new ActividadModel;
        $Actividad->Load('codigo=?', array($_POST['actividad']));
        if (!$Actividad->fecha_inicio_real) {
            $Actividad->estado = 50;
            $Actividad->fecha_inicio_real = 'NOW()';
            $Actividad->Save();
        }

        foreach ($_POST as $k => $v) {
            $data = explode("_", $k);
            if ($data[0] === 'chk') {
                $this->Load('actividad=? AND numero_sesion=? AND rut_persona=?', array($_POST['actividad'], $data[2], $data[1]));
                $this->usuario = $_SESSION['usuario'];
                if (!$this->fecha_inicio) {
                    $this->fecha_inicio = reverseDate($_POST['fecha_'.$data[2]]);
                    $this->fecha_termino = $this->fecha_inicio;
                }
                $this->Save();
            }
        }

        if ($this->numero_sesion == $Actividad->cantidad_sesiones_programadas) {
            $Actividad->estado = 60;
            $Actividad->Save();
        }

        if ( ! $this->_saved ) {
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        } else {
            echo "<script>
			var element = $('transparent_ajax_notice');
			element.innerHTML = '<p>Asistencia grabada.</p>';
			TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}});
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
        SesionView::liveSearch($this->Find($whereOrderBy));
    }

}

?>