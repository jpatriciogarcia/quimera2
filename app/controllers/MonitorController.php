<?php
/**
 * Objeto UsuarioController.
 *
 * En este archivo se define la clase controladora para los usuarios.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class MonitorController extends MonitorModel {

    function __construct() {
        parent::__construct();
    }


    /**
	 * Enter description here...
	 *
	 */
    public function index() {
        MonitorView::showAll($this->Find('eliminado=?', array('FALSE')));
    }


    /**
	 * Enter description here...
	 *
	 * @return unknown
	 */
    public function isLogged() {
        return false;
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
            echo "<script>
			var element = $('transparent_ajax_notice');
			element.innerHTML = '<p>Monitor grabado con &eacute;xito</p>';
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
            echo "<script>FunFamilia.alert('Monitor eliminado con éxito');</script>";
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
            $whereOrderBy = "   usuario in(select distinct u.usuario
                                from usuario u
                                join grupo_login gl on (u.usuario=gl.usuario and gl.codigo_grupo=50)
                                ) ORDER BY nombres";
        } else {
            $whereOrderBy = "   usuario in(select distinct u.usuario
                                from usuario u
                                join grupo_login gl on (u.usuario=gl.usuario and gl.codigo_grupo=50)
                                ) and
                                lower(nombres || ' ' || apellido_paterno || ' ' || apellido_materno ) like '%".strtolower($value)."%' ORDER BY nombres";
        }
        UsuarioView::liveSearch($this->Find($whereOrderBy));
    }
}

?>