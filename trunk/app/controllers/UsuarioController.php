<?php
/**
 * Objeto UsuarioController.
 *
 * En este archivo se define la clase controladora para los usuarios.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class UsuarioController extends UsuarioModel {

    function __construct() {
        parent::__construct();
    }


    /**
	 * Enter description here...
	 *
	 */
    public function index() {
        UsuarioView::showAll($this->Find('eliminado=?', array('FALSE')));
    }


    /**
	 * Enter description here...
	 *
	 * @return unknown
	 */
    public function isLogged() {
        return isset($_SESSION['ACL']);
    }


    /**
	 * Enter description here...
	 *
	 */
    public function login() {
        $this->Load("usuario=?", array($_POST['username']));

        if ( $this->usuario && !$this->bloqueado && ($this->clave == md5($_POST['password'])) ) {
            $this->inicio_sesion = 'NOW()';
            $this->ultimo_acceso = 'NOW()';
            $this->origen = $_SERVER['REMOTE_ADDR'];
            $this->Save();
            $_SESSION['usuario'] = $this->usuario;
            $_SESSION['nombres'] = $this->nombres;

            $sql = "SELECT u.usuario as usuario, g.codigo as grupo, m.codigo as modulo, gm.privilegio as privilegio
					FROM usuario u
					INNER JOIN grupo_login gl ON (u.usuario = gl.usuario)
					INNER JOIN grupo g ON (gl.codigo_grupo = g.codigo)
					INNER JOIN grupo_modulo gm ON (g.codigo = gm.grupo)
					INNER JOIN modulo m ON (gm.modulo = m.codigo)
					WHERE u.usuario = '{$this->usuario}'
					ORDER BY g.codigo, m.codigo";
            $rs = $this->DB()->Execute( $sql );
            $_SESSION['ACL'] = $rs->GetArray();

            $sql = "SELECT cfu.centro_familiar
                    FROM centro_familiar_usuario cfu
                    WHERE cfu.usuario = '{$this->usuario}'
                    ORDER BY cfu.centro_familiar";
            $rs = $this->DB()->Execute( $sql );
            $arr = array();
            while (!$rs->EOF) {
                $arr[] = $rs->fields['centro_familiar'];
                $rs->MoveNext();
            }
            $_SESSION['centros'] = implode(', ', $arr);

            echo "true";
        }
        else {
            if ($this->bloqueado) {
                $this->origen = $_SERVER['REMOTE_ADDR'];
                $this->ultimo_acceso = 'NOW()';
                $this->Save();
                echo "Usuario bloqueado";
            }
            else {
                if (!isset($_SESSION['intentos'])) {
                    $_SESSION['intentos'] = 1;
                }
                else {
                    $_SESSION['intentos'] += 1;
                }
                if ($_SESSION['intentos'] >= 3) {
                    $this->Load('usuario=?', array($_POST['username']));
                    $this->bloqueado = 1;
                    $this->Save();
                    session_destroy();
                }
                echo "Datos incorrectos";
            }
        }

    }


    /**
	 * Enter description here...
	 *
	 */
    public function logout() {
        $this->Load("usuario=?", array($_SESSION['usuario']));
        $this->fin_sesion = 'NOW()';
        $this->Save();
        session_destroy();
        header('Location: '.WEB_PATH);
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $args
	 */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('usuario=?', array($usuario));
        UsuarioView::edit($this);
    }


    /**
	 * Enter description here...
	 *
	 */
    public function guardar() {
        $this->DB()->StartTrans();

        $this->Load('usuario=?', array($_POST['usuario']));
        $this->LoadFromPOST( $_POST );
        $this->eliminado = 'FALSE';

        if ( ! $this->Save() ) {
            $this->DB()->RollbackTrans();
            echo "<script>
			var element = $('transparent_ajax_error');
			element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
			TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>";
        } else {
            $this->DB()->CompleteTrans();

            if (isset($_POST['centros'])) {
                $this->DB()->Execute("DELETE FROM centro_familiar_usuario WHERE usuario='".$this->usuario."'");
                foreach ($_POST['centros'] as $centro) {
                    $CentroFamiliarUsuario = new CentroFamiliarUsuarioModel;
                    $CentroFamiliarUsuario->centro_familiar = $centro;
                    $CentroFamiliarUsuario->usuario = $this->usuario;
                    $CentroFamiliarUsuario->Save();
                }
            }

            echo "<script>
			var element = $('transparent_ajax_notice');
			element.innerHTML = '<p>Usuario grabado con &eacute;xito</p>';
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
        $this->Load('usuario=?', array($_POST['usuario']));
        $this->eliminado = 'TRUE';

        if ($this->Save()) {
            $this->DB()->CompleteTrans();
            echo "<script>FunFamilia.alert('Usuario eliminado con éxito');</script>";
        }
        else {
            $this->DB()->RollbackTrans();
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
            $whereOrderBy = "1=1 ORDER BY nombres";
        } else {
            $whereOrderBy = "lower(nombres || ' ' || apellido_paterno ) like '%".strtolower($value)."%' ORDER BY nombres";
        }
        UsuarioView::liveSearch($this->Find($whereOrderBy));
    }




    public function recordarPassword() {

        if (isset($_POST['usuario'])) {
            $this->Load('usuario=? AND mail=?', array($_POST['usuario'], $_POST['mail']));

            if ( $this->usuario ) {

                $this->DB()->StartTrans();

                $envio_clave = md5($_POST['usuario'] . $_POST['mail'] . time());
                $this->envio_clave = $envio_clave;
                $this->envio_valido_hasta = $this->getTimestampTomorrow();

                if ( ! $this->Save() ) {
                    $this->DB()->RollbackTrans();
                    echo "<script>
                			var element = $('transparent_ajax_error');
                			element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
                			TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>";
                } else {
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

                    $mail->AddAddress($_POST['mail'], $this->nombres . ' ' . $this->apellido_paterno . ' ' . $this->apellido_materno);
                    $mail->Subject = "Recuperación de contraseña";
                    $mail->Body = "<h3>Estimad@ {$this->nombres},<br /></h3>"
                    ."Debes seguir el siguiente enlace para volver a crear una contraseña:<br />"
                    ."<a href='" . WEB_PATH . "/Usuario/newPassword/envio_clave=" . $envio_clave . "'>" . WEB_PATH . "/Usuario/newPassword/envio_clave=" . $envio_clave . "</a><br />"
                    ."Este enlace tiene una vigencia de 24 horas."
                    ."<br /><br />Atentamente,<br />Equipo de desarrollo \"Proyecto Fundación de la Familia\"";

                    if(!$mail->Send()) {
                        $this->DB()->RollbackTrans();
                        echo "<script>
                			var element = $('transparent_ajax_error');
                			element.innerHTML = '<p>Mailer error: {$mail->ErrorInfo}</p>';
                			TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>";
                    } else {
                        $this->DB()->CompleteTrans();
                        echo "<script>
                    			var element = $('transparent_ajax_notice');
                    			element.innerHTML = '<p>Se ha enviado un mensaje a su cuenta de email con las instrucciones para reactivar su nueva contraseña.</p>';
                    			TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}})
                    			setTimeout('parent.Windows.getFocusedWindow().close()', 5000);
                    			</script>";
                    }

                }

                echo "<script>
            			var element = $('transparent_ajax_error');
            			element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
            			TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>";
            } else {
                $this->DB()->CompleteTrans();
                echo "<script>
            			var element = $('transparent_ajax_error');
            			element.innerHTML = '<p>No existe la combinación Usuario/E-Mail</p>';
            			TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})
            			</script>";
            }
        }
        else {
            UsuarioView::recordarPassword();
        }
    }




    public function newPassword( $args=array() ) {
        parse_str(implode("&", $args));
        $this->load('envio_clave=? AND envio_valido_hasta >= ?', array($envio_clave, 'NOW()'));
        UsuarioView::newPassword($this);
    }


    public function reestablecerPassword() {
        $this->Load('usuario=?', array($_POST['usuario']));
        $this->LoadFromPOST( $_POST );
        $this->eliminado = 'FALSE';

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
			element.innerHTML = '<p>Contraseña cambiada con éxito.  Serás redireccionado automáticamente al inicio.</p>';
			TransparentMenu.show('transparent_ajax_notice', {insideElement:{id:'frmFormulario'}})
			setTimeout('window.location.href=\"" . WEB_PATH . "\"', 4000);
			</script>";
        }
    }

}

?>