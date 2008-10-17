<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReportePersonasCentroFamiliarController extends ReportePersonasCentroFamiliarModel {

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
		ReportePersonasCentroFamiliarView::showAll($this->Find('1=?', array('1')));
	}


	public function updateList() {

		$sql = '1=1';
		$args = array();

		if (isset($_POST['centro_familiar']) ? $_POST['centro_familiar'] : false) {
			$args[] = 'codigo_centro_familiar = '.$_POST['centro_familiar'];
		}
		if (isset($_POST['rut']) ? $_POST['rut'] : false) {
			$args[] = "UPPER(rut) like '%".strtoupper($_POST['rut'])."%'";
		}
		if (isset($_POST['nombre']) ? $_POST['nombre'] : false) {
			$args[] = "UPPER(nombre) like '%".strtoupper($_POST['nombre'])."%'";
		}

		if (sizeof($args)) {
			$sql = implode(' AND ', $args);
		}

		
		echo ReportePersonasCentroFamiliarView::getList( $this->Find($sql) );
	}


}

?>