<?php
/**
 * Objeto ActividadController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ImagenController extends ImagenModel {

    public function liveSearch( $value ) {
        ImagenView::liveSearch($this->Find());
    }

}

?>