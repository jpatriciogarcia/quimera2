<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteActividadEstadoNuevaController extends ReporteActividadEstadoNuevaModel {

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
        ReporteActividadEstadoNuevaView::showAll($this->Find('1=?', array('1')));
    }


    public function updateList() {

        $sql = '1=1';
        $args = array();

        if (isset($_POST['centro_familiar']) ? $_POST['centro_familiar'] : false) {
            $sql = 'numerocentro = ' . $_POST['centro_familiar'];
        }

        if ( (isset($_POST['fecha_inicio']) ? $_POST['fecha_inicio'] : false)
        and !(isset($_POST['fecha_termino']) ? $_POST['fecha_termino'] : false) ) {
            if ($sql != '1=1') {
                $sql .= ' and ';
            }
            $sql .= "fecha_inicio >= '".reverseDate($_POST['fecha_inicio'])."'";
        }

        if ( (isset($_POST['fecha_termino']) ? $_POST['fecha_termino'] : false)
        and !(isset($_POST['fecha_inicio']) ? $_POST['fecha_inicio'] : false)
        ) {
            if ($sql != '1=1') {
                $sql .= ' and ';
            }
            $sql .= "fecha_termino <= '".reverseDate($_POST['fecha_termino'])."'";
        }

        if ( (isset($_POST['fecha_termino']) ? $_POST['fecha_termino'] : false)
        and (isset($_POST['fecha_inicio']) ? $_POST['fecha_inicio'] : false)
        ) {
            if ($sql != '1=1') {
                $sql .= ' and ';
            }
            $sql .= "fecha_inicio >= '".reverseDate($_POST['fecha_inicio'])."' and fecha_termino <= '".reverseDate($_POST['fecha_termino'])."'";
        }

        echo ReporteActividadEstadoNuevaView::getList( $this->Find($sql) );
    }


}

?>