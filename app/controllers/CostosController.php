<?php
/**
 * Objeto SesionController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class CostosController extends CostosModel{

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
        return ;
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));

        $Actividad = new ActividadModel;
        $Actividad->Load('codigo=?', array($codigo));

        $Costos = new CostosModel;
        $Costos = $Costos->Find('codigo_actividad=?', array($Actividad->codigo));

        if (!isset($_SESSION['planificacion'][$Actividad->codigo])) {
            $_SESSION['planificacion'][$Actividad->codigo]['costos'] = array();
        }

        CostosView::editar( $Actividad, $Costos );
        $_POST['actividad'] = $Actividad->codigo;
        $this->updateList();
    }

    /**
     * Enter description here...
     *
     */

    public function updateList( ) {

        extract($_POST);

        if (isset($_POST['numero_documento'])) {
            $_SESSION['planificacion'][$actividad]['costos'][] = array('numero_documento' => $_POST['numero_documento'], 'descripcion' => $_POST['descripcion'], 'costo' => $_POST['costo']);
        }

        $this->DB()->Execute("DELETE FROM detalle_costos WHERE codigo_actividad=".$actividad);

        foreach ($_SESSION['planificacion'][$actividad]['costos'] as $tmp) {
            $Costos = new CostosModel;
            $Costos->codigo_actividad = $actividad;
            $Costos->descripcion = $tmp['descripcion'];
            $Costos->costo = $tmp['costo'];
            $Costos->numero_documento = $tmp['numero_documento'];
            $Costos->Save();
        }

        CostosView::updatelist($_SESSION['planificacion'][$actividad]['costos']);
    }

    /**
     * Enter description here...
     *
     */
    public function eliminar() {

    }


    public function liveSearch( $value ) {

    }

}

?>