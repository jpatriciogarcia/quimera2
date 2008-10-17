<?php
/**
 * Objeto CentroFamiliarController.
 *
 * En este archivo se define la clase controladora para los usuarios.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ComunaController extends ComunaModel {

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
        CentroFamiliarView::showAll($this->Find('1=?', array('1')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        CentroFamiliarView::editar($this);
    }

    /**
     * Enter description here...
     *
     */
    public function guardar() {
        $this->Load('codigo=?', array($_POST['codigo']));
        $this->LoadFromPOST( $_POST );
        $this->Save();
    }

    /**
     * Enter description here...
     *
     */
    public function eliminar() {
        $this->Load('codigo=?', array($_POST['codigo']));
        $this->Delete();
    }


    public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY comuna";
        } else {
            $whereOrderBy = "lower(comuna) like '%".strtolower($value)."%' ORDER BY comuna";
        }
        ComunaView::liveSearch($this->Find($whereOrderBy));
    }

}

?>