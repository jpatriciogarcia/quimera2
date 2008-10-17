<?php
/**
 * Objeto SesionController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ListasDependientesController{

    /**
     * Enter description here...
     *
     */
    function __construct() {
    }

    /**
     * Enter description here...
     *
     */
    public function index() {

        extract($_POST);

        if ( ereg('_', $controller) ? ($split = split('_', $controller)) : false ) {
            foreach ($split as $k => $v) {
                $split[$k] = ucfirst($v);
            }
            $class = implode('', $split) . 'Controller';
        }
        else {
            $class = ucfirst($controller) . 'Controller';
        }

        // Initiate the class
        $controller = new $class();

        // Run action
        $value = $value ? $value : 0;
        $obj = $controller->Find("$key=?", array($value));

        $params['class'] = 'validate-selection selectArea';

        if (isset($_POST['extra_params'])) {
            $params = json_decode(stripslashes($_POST['extra_params']), true);
        }

        echo FormHelper::selectBox($_POST['controller'], $_POST['selected'], $obj, 'codigo', 'nombre', true, $params);
    }


}

?>