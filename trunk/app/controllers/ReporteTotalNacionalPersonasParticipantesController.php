<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteTotalNacionalPersonasParticipantesController extends ReporteTotalNacionalPersonasParticipantesModel {

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
        ReporteTotalNacionalPersonasParticipantesView::showAll($this->Find('1=?', array('1')));
    }


    public function updateList() {

        $sql = '';
        $args = array();

        if ( isset($_POST['centro_familiar']) ? $_POST['centro_familiar'] : false ) {
            $args[] = "centro_familiar_codigo = ".$_POST['centro_familiar'];
        }

        if ( isset($_POST['proyecto']) ? $_POST['proyecto'] : false ) {
            $args[] = "proyecto_codigo = ".$_POST['proyecto'];
        }

        if ( isset($_POST['programa']) ? $_POST['programa'] : false ) {
            $args[] = "programa_codigo = ".$_POST['programa'];
        }

        if ( isset($_POST['actividad']) ? $_POST['actividad'] : false ) {
            $args[] = "actividad_codigo = ".$_POST['actividad'];
        }

        if ( isset($_POST['fecha_inicio']) ? $_POST['fecha_inicio'] : false ) {
            $args[] = "fecha_inicio <= '".reverseDate($_POST['fecha_inicio'])."'";
        }

        if ( isset($_POST['fecha_termino']) ? $_POST['fecha_termino'] : false ) {
            $args[] = "fecha_termino >= '".reverseDate($_POST['fecha_termino'])."'";
        }

        $sql = implode(" AND ", $args);

        echo ReporteTotalNacionalPersonasParticipantesView::getList( $this->Find($sql) );
    }


}

?>