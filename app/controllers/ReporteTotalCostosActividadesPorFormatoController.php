<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteTotalCostosActividadesPorFormatoController extends ReporteTotalCostosActividadesPorFormatoModel {

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
        ReporteTotalCostosActividadesPorFormatoView::showAll($this->Find('1=?', array('1')));
    }


    public function updateList() {

        $sql = '1=1';
        $args = array();

        if (isset($_POST['formato_actividad']) ? $_POST['formato_actividad'] : false) {
            $sql = 'formato_actividad = ' . $_POST['formato_actividad'];
        }

        if ( (isset($_POST['fechainicio']) ? $_POST['fechainicio'] : false)
        and !(isset($_POST['fechatermino']) ? $_POST['fechatermino'] : false) ) {
            if ($sql != '1=1') {
                $sql .= ' and ';
            }
            $sql .= "fecha_inicio >= '".reverseDate($_POST['fechainicio'])."'";
        }

        if ( (isset($_POST['fechatermino']) ? $_POST['fechatermino'] : false)
        and !(isset($_POST['fechainicio']) ? $_POST['fechainicio'] : false)
        ) {
            if ($sql != '1=1') {
                $sql .= ' and ';
            }
            $sql .= "fecha_termino <= '".reverseDate($_POST['fechatermino'])."'";
        }

        if ( (isset($_POST['fechatermino']) ? $_POST['fechatermino'] : false)
        and (isset($_POST['fechainicio']) ? $_POST['fechainicio'] : false)
        ) {
            if ($sql != '1=1') {
                $sql .= ' and ';
            }
            $sql .= "fecha_inicio >= '".reverseDate($_POST['fechainicio'])."' and fecha_termino <= '".reverseDate($_POST['fechatermino'])."'";
        }

        echo ReporteTotalCostosActividadesPorFormatoView::getList( $this->Find($sql) );
    }


}

?>