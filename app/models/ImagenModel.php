<?php
/**
 * Objeto ImagenModel.
 *
 * En este archivo se define la clase para crear al patrón Active Record para la
 * tabla que almacena los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

//class ImagenModel extends ADOdb_Active_Record {
class ImagenModel extends DirectoryIterator {

    function __construct() {
        parent::__construct(DOCUMENT_ROOT . "/public/images");
    }

    public function Find() {
        return new DirectoryIterator(DOCUMENT_ROOT . "/public/images");
    }

}

?>