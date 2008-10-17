<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteUsuariosTotalesController extends ReporteUsuariosTotalesModel {

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
        ReporteUsuariosTotalesView::showAll($this->Find('1=?', array('1')));
    }


    public function updateList() {

        $sql = '1=1';
        $args = array();

        if (isset($_POST['centro_familiar']) ? $_POST['centro_familiar'] : false) {
            $sql = 'codigo_centro_familiar = ?';
            $args[] = $_POST['centro_familiar'];
        }

        echo ReporteUsuariosTotalesView::getList( $this->Find($sql, $args) );
    }


}

?>