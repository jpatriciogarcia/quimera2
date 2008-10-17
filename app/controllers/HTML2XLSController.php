<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class HTML2XLSController {

    /**
     * Enter description here...
     *
     */
    function __construct() {
    }

    function index() {
        $_SESSION['content'] = $_POST['content'];
    }

    /**
     * Enter description here...
     *
     */
    public function generate() {
        header("Content-type: application/vnd.ms-excel; charset='utf-8'");
        echo trim($_SESSION['content']);
    }


}

?>