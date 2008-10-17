<?php
/**
 * Objeto PlanificacionActividadController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class PlanificacionActividadController extends PlanificacionActividadModel {

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
        PlanificacionActividadView::showAll( $this->Find('1=?', array('1')) );
    }


    public function updateList( $params ) {

        $sql = '1=1';
        $args = array();

        if (isset($_POST['proyecto']) ? $_POST['proyecto'] : false) {
            $sql = 'programa in(select pp.codigo
                                from proyecto p
                                join programa pp on (p.codigo = pp.proyecto)
                                where p.codigo = ?)';
            $args[] = $_POST['proyecto'];
        }

        if (isset($_POST['programa']) ? $_POST['programa'] : false) {
            $sql .= ' AND programa=?';
            $args[] = $_POST['programa'];
        }

        if (isset($_POST['estado']) ? $_POST['estado'] : false) {
            $sql .= ' AND estado=?';
            $args[] = $_POST['estado'];
        }

        echo PlanificacionActividadView::getList( $this->Find($sql, $args) );
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        PlanificacionActividadView::editar($this);
    }

    /**
     * Enter description here...
     *
     */
    public function guardar() {
        $this->DB()->StartTrans();

        $this->LoadFromPOST( $_POST );

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));

        $this->LoadFromPOST( $_POST );

        $modificado = $_POST['codigo'] ? true : false;
        unset($_POST['codigo']);

        // Nombre unico para la actividad
        //$this->Load('nombre=? AND programa=? AND actividad_formato=?', array($this->nombre, $this->programa, $this->actividad_formato));
        if ($this->codigo && !$this->_saved) {
            $this->DB()->debug = true;
            print_r($this);
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>Ya existe una actividad con este nombre.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        // Validacion del Formato asociado
        $ActividadFormato = new ActividadFormatoModel;
        $ActividadFormato->Load('nombre=?', array(trim($_POST['actividad_formato'])));
        if (!$ActividadFormato->codigo) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El formato no existe</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }
        else {
            $this->actividad_formato = $ActividadFormato->codigo;
        }

        // Validacion del usuario asociado
        $Monitor = new MonitorModel;
        $Monitor->Load("(trim(nombres) || ' ' || trim(apellido_paterno) || ' ' || trim(apellido_materno))=?", array(trim($_POST['monitor'])));
        if (!$Monitor->usuario) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>El monitor a cargo no existe.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }
        else {
            $this->usuario = $Monitor->usuario;
        }


        // Validacion de las fechas
        if ( ((getMKTime(trim($this->fecha_inicio)) < mktime()) or (getMKTime(trim($this->fecha_inicio)) > getMKTime(trim($this->fecha_termino)))) and (!$this->codigo) ) {
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>Verifique que la fecha de inicio se mayor que la actual.<br />Verifique que la fecha de inicio sea mayor a la fecha de término.</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        }

        /*
        if (trim($_POST['descripcion'])) {
        $this->descripcion = "\n(".date("d/m/Y H:i, ").$Monitor->getNombreCompleto().")\n".$_POST['descripcion']."\n==========\n".$this->descripcion;
        }
        */

        unset($_POST['descripcion']);

        $this->programa = $_POST['programa'];
        $this->cantidad_sesiones_programadas = $_POST['cantidad_sesiones_programadas'];

        $this->estado = $this->estado ? $this->estado : 10;
        $this->actividad_resultado = $this->_saved ? $this->actividad_resultado : 0;
        $this->activo = 't';
        $this->usuario_modificacion = $_SESSION['usuario'];

        if ( ! $this->Save() ) {
            $this->DB()->RollbackTrans();
            die( "<script>
				var element = $('transparent_ajax_error');
				element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        } else {
            $this->DB()->CompleteTrans();

            $actividad = $modificado ? $this->codigo : 0;

            if (isset($_SESSION['planificacion'][$actividad]['personas'])) {
                foreach ($_SESSION['planificacion'][$actividad]['personas'] as $k => $v) {
                    if ($k === 0) { continue; }
                    for ($i=1; $i<=$this->cantidad_sesiones_programadas; $i++) {
                        $Sesion = new SesionModel;
                        $Sesion->numero_sesion = $i;
                        $Sesion->actividad = $this->codigo;
                        $Sesion->rut_persona = $v;
                        $Sesion->Save();
                    }
                }
            }

            unset($_SESSION['planificacion'][$actividad]);

            echo "<script>
			$('codigo').value = " . $this->codigo . ";
			var element = $('transparent_ajax_notice');
			element.innerHTML = '<p>Actividad " . ($modificado ? "modificada" : "grabada") . " con éxito</p>';
			TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}});";

            if (!$modificado) {
                echo "setTimeout('location.href=\"".WEB_PATH."/Thesaurus/ver/actividad_formato={$this->actividad_formato}\"', 4000);";
            } else {
                // comentar esta linea, solo para pruebas
                echo "setTimeout('location.href=\"".WEB_PATH."/Thesaurus/ver/actividad_formato={$this->actividad_formato}\"', 4000);";

                // Descomentar esta linea,, solo para pruebas
                //echo "setTimeout('parent.Windows.getFocusedWindow().close()', 4000);";
            }

            echo "</script>";
        }
    }


    /**
     * Enter description here...
     *
     */
    public function eliminar() {
        $this->DB()->StartTrans();
        $this->Load('codigo=?', array($_POST['codigo']));

        $Estado = new ActividadEstadoModel;
        $Estado->Load('codigo=?', array(10));
        if ($this->estado != 10) {
            $this->DB()->RollbackTrans();
            die("<script>FunFamilia.alert('Sólo se pueden eliminar las planificaciones en estado \"{$Estado->nombre}\" ');</script>");
        }

        if ( ! $this->Delete() ) {
            $this->DB()->RollbackTrans();
            die("<script>FunFamilia.alert('{$this->ErrorMsg()}');</script>");
        } else {
            $this->DB()->CompleteTrans();
            die("<script>FunFamilia.alert('Planificación eliminada con éxito.');</script>");
        }
    }


    public function liveSearch( $value ) {
        $whereOrderBy = "lower(nombre) like '%".strtolower($value)."%'";
        PlanificacionActividadView::liveSearch($this->Find($whereOrderBy));
    }


    public function addPersonas( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        PlanificacionActividadView::addPersonas( $this );
    }


    public function updatePersonas( $args=array() ) {
        extract($_POST);
        parse_str(implode("&", $args));

        if (!isset($_SESSION['planificacion'][$actividad])) {
            $_SESSION['planificacion'][$actividad]['personas'] = array();
        }

        if (!in_array($rut, $_SESSION['planificacion'][$actividad]['personas'])) {
            $_SESSION['planificacion'][$actividad]['personas'][] = $rut;
        }

        $Persona = new PersonaModel;
        $Obj = $Persona->Find('rut in('.implode(', ', $_SESSION['planificacion'][$actividad]['personas']).')');

        PlanificacionActividadView::updatePersonas($Obj, $actividad);

    }


    public function deletePersona( ) {
        extract($_POST);

        $key = array_search($rut, $_SESSION['planificacion'][$actividad]['personas']);
        unset($_SESSION['planificacion'][$actividad]['personas'][$key]);

        $Persona = new PersonaModel;
        $Obj = $Persona->Find('rut in('.implode(', ', $_SESSION['planificacion'][$actividad]['personas']).')');

        PlanificacionActividadView::updatePersonas($Obj, $actividad);
    }


    public function aceptarActividad() {
        $this->DB()->StartTrans();

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        $this->estado = 30;

        $Usuario = new UsuarioModel;
        $Usuario->Load('usuario=?', array($this->usuario));

        $mail = new PHPMailer ();
        $mail->CharSet = 'utf-8';
        $mail->From = "funfamilia@gmail.com";
        $mail->FromName = "Proyecto Fundación de la Familia";
        $mail->AddBCC('jgarcigo@yahoo.es');
        $mail->IsHTML (true);

        $mail->IsSMTP();
        $mail->Host = 'ssl://smtp.gmail.com';
        $mail->Port = 465;
        $mail->SMTPAuth = true;
        $mail->Username = 'funfamilia@gmail.com';
        $mail->Password = 'password2008';

        $mail->AddAddress($Usuario->mail, $Usuario->getNombreCompleto());
        $mail->Subject = "Actividad Código N°".$this->codigo." Aprobada";
        $mail->Body = "<h3>Estimad@ {$Usuario->getNombreCompleto()},<br /></h3>"
        ."<h1>Debes revisar la actividad \"{$this->nombre}\", debido a que ha sido aprobada.</h1><br />"
        ."<br /><br />Atentamente,<br />Equipo de desarrollo \"Proyecto Fundación de la Familia\"";

        // Debe ser una condicion del if
        $mail->Send();

        if (trim($_POST['descripcion'])) {
            //$this->descripcion = "\n(".date("d/m/Y H:i, ").$Usuario->getNombreCompleto().")\n".$_POST['descripcion']."\n==========\n".$this->descripcion;
            $this->descripcion = $_POST['descripcion'];
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
            var element = $('transparent_ajax_notice');
            element.innerHTML = '<p>Actividad aprobada.</p>';
            TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}});
            $('btnAceptar').hide();
            $('btnRechazar').hide();
            $('btnObservar').hide();
			</script>";
        }
    }

    public function rechazarActividad() {
        $this->DB()->StartTrans();

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        $this->estado = 40;

        $Usuario = new UsuarioModel;
        $Usuario->Load('usuario=?', array($this->usuario));

        $mail = new PHPMailer ();
        $mail->CharSet = 'utf-8';
        $mail->From = "funfamilia@gmail.com";
        $mail->FromName = "Proyecto Fundación de la Familia";
        $mail->AddBCC('jgarcigo@yahoo.es');
        $mail->IsHTML (true);

        $mail->IsSMTP();
        $mail->Host = 'ssl://smtp.gmail.com';
        $mail->Port = 465;
        $mail->SMTPAuth = true;
        $mail->Username = 'funfamilia@gmail.com';
        $mail->Password = 'password2008';

        $mail->AddAddress($Usuario->mail, $Usuario->getNombreCompleto());
        $mail->Subject = "Actividad Código N°".$this->codigo." Rechazada";
        $mail->Body = "<h3>Estimad@ {$Usuario->getNombreCompleto()},<br /></h3>"
        ."<h1>Debes revisar la actividad \"{$this->nombre}\", debido a que ha sido rechazada.</h1><br />"
        ."<br /><br />Atentamente,<br />Equipo de desarrollo \"Proyecto Fundación de la Familia\"";

        // Debe ser una condicion del if
        $mail->Send();

        if (trim($_POST['descripcion'])) {
            //$this->descripcion = "\n(".date("d/m/Y H:i, ").$Usuario->getNombreCompleto().")\n".$_POST['descripcion']."\n==========\n".$this->descripcion;
            $this->descripcion = $_POST['descripcion'];
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
            var element = $('transparent_ajax_notice');
            element.innerHTML = '<p>Actividad rechazada.</p>';
            TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}});
            $('btnAceptar').hide();
            $('btnRechazar').hide();
			</script>";
        }
    }

    public function observarActividad() {
        $this->DB()->StartTrans();

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        $this->estado = 20;

        $Usuario = new UsuarioModel;
        $Usuario->Load('usuario=?', array($this->usuario));

        $mail = new PHPMailer ();
        $mail->CharSet = 'utf-8';
        $mail->From = "funfamilia@gmail.com";
        $mail->FromName = "Proyecto Fundación de la Familia";
        $mail->AddBCC('jgarcigo@yahoo.es');
        $mail->IsHTML (true);

        $mail->IsSMTP();
        $mail->Host = 'ssl://smtp.gmail.com';
        $mail->Port = 465;
        $mail->SMTPAuth = true;
        $mail->Username = 'funfamilia@gmail.com';
        $mail->Password = 'password2008';

        $mail->AddAddress($Usuario->mail, $Usuario->getNombreCompleto());
        $mail->Subject = "Actividad Código N°".$this->codigo." Observada";
        $mail->Body = "<h3>Estimad@ {$Usuario->getNombreCompleto()},<br /></h3>"
        ."<h1>Debes revisar la actividad \"{$this->nombre}\", debido a que ha sido observada.</h1><br />"
        ."<br /><br />Atentamente,<br />Equipo de desarrollo \"Proyecto Fundación de la Familia\"";

        // Debe ser una condicion del if
        $mail->Send();

        if (trim($_POST['descripcion'])) {
            //$this->descripcion = "\n(".date("d/m/Y H:i, ").$Usuario->getNombreCompleto().")\n".$_POST['descripcion']."\n==========\n".$this->descripcion;
            $this->descripcion = $_POST['descripcion'];
        }

        if ( ! $this->Save() ) {
            $this->DB()->RollbackTrans();
            die( "<script>
            var element = $('transparent_ajax_error');
            element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        } else {
            $this->DB()->CompleteTrans();
            die("<script>
            var element = $('transparent_ajax_notice');
            element.innerHTML = '<p>Actividad observada.</p>';
            TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}});
            //$('btnAceptar').hide();
            //$('btnRechazar').hide();
			</script>");
        }
    }


    public function CalificarActividad() {
        $this->DB()->StartTrans();

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        $this->actividad_resultado = $_POST['resultado'];

        $Usuario = new UsuarioModel;
        $Usuario->Load('usuario=?', array($this->usuario));

        $mail = new PHPMailer ();
        $mail->CharSet = 'utf-8';
        $mail->From = "funfamilia@gmail.com";
        $mail->FromName = "Proyecto Fundación de la Familia";
        $mail->AddBCC('jgarcigo@yahoo.es');
        $mail->IsHTML (true);

        $mail->IsSMTP();
        $mail->Host = 'ssl://smtp.gmail.com';
        $mail->Port = 465;
        $mail->SMTPAuth = true;
        $mail->Username = 'funfamilia@gmail.com';
        $mail->Password = 'password2008';

        $mail->AddAddress($Usuario->mail, $Usuario->getNombreCompleto());
        $mail->Subject = "Actividad Código N°".$this->codigo." Calificada";
        $mail->Body = "<h3>Estimad@ {$Usuario->getNombreCompleto()},<br /></h3>"
        ."<h1>Debes revisar la actividad \"{$this->nombre}\", debido a que ha sido calificada.</h1><br />"
        ."<br /><br />Atentamente,<br />Equipo de desarrollo \"Proyecto Fundación de la Familia\"";

        // Debe ser una condicion del if
        $mail->Send();

        if (trim($_POST['descripcion'])) {
            //$this->descripcion = "\n(".date("d/m/Y H:i, ").$Usuario->getNombreCompleto().")\n".$_POST['descripcion']."\n==========\n".$this->descripcion;
            $this->descripcion = $_POST['descripcion'];
        }

        if ( ! $this->Save() ) {
            $this->DB()->RollbackTrans();
            die( "<script>
            var element = $('transparent_ajax_error');
            element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
				TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
        } else {
            $this->DB()->CompleteTrans();
            die("<script>
            var element = $('transparent_ajax_notice');
            element.innerHTML = '<p>Actividad calificada.</p>';
            TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}});
            $('btnCalificarExitosa').hide();
            $('btnCalificarNoExitosa').hide();
            $('btnCalificarMejorable').hide();
			</script>");
        }
    }


}

?>