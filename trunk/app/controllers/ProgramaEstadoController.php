<?php
/**
 * Objeto ProgramaEstadoController.
 *
 * En este archivo se define la clase controladora para los estados de programas.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ProgramaEstadoController extends ProgramaEstadoModel {

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
        ProgramaEstadoView::showAll($this->Find('1=?', array('1')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('codigo=?', array($codigo));
        ProgramaEstadoView::editar($this);
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
            $whereOrderBy = "1=1 ORDER BY nombre";
        } else {
            $whereOrderBy = "lower(nombre) like '%".strtolower($value)."%' ORDER BY nombre";
        }
        ProgramaEstadoView::liveSearch($this->Find($whereOrderBy));
    }

}

?>