<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteSeguimientoPersonasController extends ReporteSeguimientoPersonasModel {

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
		ReporteSeguimientoPersonasView::showAll($this->Find('1=?', array('1')));
	}


	public function updateList() {

		$sql = '1=1';
		$args = array();

		if (isset($_POST['rut']) ? $_POST['rut'] : false) {
			$args[] = "UPPER(rut) like '%".strtoupper($_POST['rut'])."%'";
		}
		if (isset($_POST['nombre']) ? $_POST['nombre'] : false) {
			$args[] = "UPPER(nombre) like '%".strtoupper($_POST['nombre'])."%'";
		}

		if (sizeof($args)) {
			$sql = implode(' AND ', $args);
		}

		
		echo ReporteSeguimientoPersonasView::getList( $this->Find($sql) );
	}


}

?>