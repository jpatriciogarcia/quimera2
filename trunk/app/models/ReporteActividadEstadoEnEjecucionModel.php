<?php
/**
 * Objeto PlanificacionActividadModel.
 *
 * En este archivo se define la clase para crear al patrón Active Record para la
 * tabla que almacena los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteActividadEstadoEnEjecucionModel extends ADOdb_Active_Record {

    public $_table = 'reporte_actividad_estado_en_ejecucion';
    private $_pkeys = array('');

    /**
	 * Constructor para la clase.
	 * Se crea el objeto padre con los parametros dados
	 *
	 */
    public function __construct() {
        parent::__construct($this->_table, $this->_pkeys);
    }


    /**
	 * Destruimos las referencias a la base de datos
	 *
	 */
    public function __destruct() {
        //$this->DB()->Close();
    }


    /**
	 * Setea los campos de la clase segun las variables enviadas por
	 * $HTTP_POST_VARS
	 *
	 * @param Array $_POST
	 */
    public function LoadFromPOST( &$_POST ) {
        $campos = $this->getAttributeNames();
        $tipos = $this->DB()->MetaColumns($this->_table, false);

        foreach ( $campos as $campo ) {
            if ( isset($_POST[$campo]) ) {
                switch ($tipos[$campo]->type) {
                    // Da el formato correcto al timestamp para ingresarlo en la base de datos
                    case "timestamp":
                        if ($_POST[$campo]) {
                            $timestamp = split(" ", $_POST[$campo]);
                            $this->$campo = $this->DB()->DBDate(reverseDate(str_replace("/", "-", $timestamp[0]))." ".$timestamp[1]);
                        }
                        break;
                    case "int4":
                        if (!$_POST[$campo]) {
                            $this->$campo = null;
                        }
                        break;
                    default:
                        $this->$campo = trim($_POST[$campo]);
                        break;
                }
            }
        }
    }


    /**
	 * Da el formato adecuado a los campos para mostrarlos al usuario
	 *
	 */
    public function FormatFields() {
        $campos = $this->getAttributeNames();
        $tipos = $this->DB()->MetaColumns($this->_table, false);

        foreach ( $campos as $campo ) {
            switch ($tipos[$campo]->type) {
                // Da el formato correcto al timestamp para mostrarlo al usuario
                case "timestamp":
                    if ($this->$campo) {
                        $this->$campo = substr($this->$campo, 8, 2) . "/" .
                        substr($this->$campo, 5, 2) . "/" .
                        substr($this->$campo, 0, 4) . " " .
                        substr($this->$campo, 11, 5);
                    }
                    break;
                case "int4":
                case "numeric":
                    $this->$campo = $this->$campo ? number_format($this->$campo, 0, '', '') : '';
                    break;
                default:
                    //
                    break;
            }
        }
    }

}

?>