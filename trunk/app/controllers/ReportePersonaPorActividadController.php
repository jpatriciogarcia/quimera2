<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReportePersonaPorActividadController extends ReportePersonaPorActividadModel {

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
		ReportePersonaPorActividadView::showAll($this->Find('1=?', array('1')));
	}


	public function updateList() {

		$sql = '1=1';
		$args = array();

		if (isset($_POST['actividad']) ? $_POST['actividad'] : false) {
			$args[] = "UPPER(actividad) like '%".strtoupper($_POST['actividad'])."%'";
		}
		if (isset($_POST['nombreactividad']) ? $_POST['nombreactividad'] : false) {
			$args[] = "UPPER(nombreactividad) like '%".strtoupper($_POST['nombreactividad'])."%'";
		}

		if (sizeof($args)) {
			$sql = implode(' AND ', $args);
		}

		
		echo ReportePersonaPorActividadView::getList( $this->Find($sql) );
	}


}

?>