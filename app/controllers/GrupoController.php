<?php
/**
 * Objeto GrupoController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class GrupoController extends GrupoModel {

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
		GrupoView::showAll($this->Find('1=?', array('1')));
	}

	/**
     * Enter description here...
     *
     * @param array $args
     */
	public function editar( $args=array() ) {
		parse_str(implode("&", $args));
		$this->Load('codigo=?', array($codigo));

		$this->codigo = $this->codigo ? $this->codigo : 0;

		$rs = $this->DB()->Execute("
								SELECT u.usuario
								FROM usuario u
								LEFT OUTER JOIN grupo_login gl ON (u.usuario = gl.usuario)
								LEFT OUTER JOIN grupo g ON (gl.codigo_grupo = g.codigo)
								WHERE g.codigo != {$this->codigo} OR g.codigo IS NULL
								GROUP BY u.usuario");
		$this->UsuariosDisponibles = $rs->GetArray();


		$rs = $this->DB()->Execute("
								SELECT u.usuario
								FROM usuario u
								INNER JOIN grupo_login gl ON (u.usuario = gl.usuario)
								INNER JOIN grupo g ON (gl.codigo_grupo = g.codigo)
								WHERE g.codigo = {$this->codigo}
								GROUP BY u.usuario");
		$this->UsuariosPertenecientes = $rs->GetArray();

		GrupoView::editar($this);
	}

	/**
     * Enter description here...
     *
     */
	public function guardar() {
		$this->DB()->StartTrans();

		$_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
		$this->Load('codigo=?', array($_POST['codigo']));
		unset($_POST['codigo']);
		$this->LoadFromPOST( $_POST );


		if ( ! $this->Save() ) {
			$this->DB()->RollbackTrans();
			echo "<script>
			var element = $('transparent_ajax_error');
			element.innerHTML = '<p>{$this->ErrorMsg()}</p>';
			TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>";
		} else {

			$this->DB()->Execute("delete from grupo_login where codigo_grupo={$this->codigo}");

			foreach ($_POST['list-pertenecientes'] as $usuario) {
				$GrupoLogin = new GrupoLoginModel;
				$GrupoLogin->codigo_grupo = $this->codigo;
				$GrupoLogin->usuario = $usuario;
				if ( ! $GrupoLogin->Save() ) {
					$this->DB()->RollbackTrans();
					die( "<script>
						var element = $('transparent_ajax_error');
						element.innerHTML = '<p>{$GrupoLogin->ErrorMsg()}</p>';
						TransparentMenu.show('transparent_ajax_error', {insideElement:{id:'frmFormulario'}})</script>");
				}
			}

			$this->DB()->CompleteTrans();
			echo "<script>
			$('codigo').value = " . $this->codigo . ";
			var element = $('transparent_ajax_notice');
			element.innerHTML = '<p>Grupo grabado con &eacute;xito</p>';
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
			echo "<script>alert('Grupo eliminada con exito.');</script>";
		}
	}


	public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY nombre";
        } else {
		$whereOrderBy = "lower(nombre) like '%".strtolower($value)."%' ORDER BY nombre";
        }
		GrupoView::liveSearch($this->Find($whereOrderBy));
	}

}

?>