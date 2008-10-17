<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteDinerosActividadEspecificaController extends ReporteDinerosActividadEspecificaModel {

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
		ReporteDinerosActividadEspecificaView::showAll($this->Find('1=?', array('1')));
	}


	public function updateList() {

		$sql = '1=1';
		$args = array();

		if (isset($_POST['codigo_actividad']) ? $_POST['codigo_actividad'] : false) {
			$args[] = "UPPER(codigo_actividad) like '%".strtoupper($_POST['codigo_actividad'])."%'";
		}
		if (isset($_POST['nombre_actividad']) ? $_POST['nombre_actividad'] : false) {
			$args[] = "UPPER(nombre_actividad) like '%".strtoupper($_POST['nombre_actividad'])."%'";
		}

		if (sizeof($args)) {
			$sql = implode(' AND ', $args);
		}

		
		echo ReporteDinerosActividadEspecificaView::getList( $this->Find($sql) );
	}


}

?>