<?php
/**
 * Objeto ProgramaEstadoView.
 *
 * En este archivo se define la clase para la presentacion del estado del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ProgramaEstadoView {

    /**
     * Lista todos los centros familiares a partir de un objeto
     * ActiveRecord::ProgramaEstado
     *
     * @param ProgramaEstado $ProgramaEstado
     */
    public function liveSearch($ProgramaEstado) {
        echo "<ul>";
        foreach ($ProgramaEstado as $ProgramaEstado) {
            echo "<li>".($ProgramaEstado->nombre).""
            ."<span class=\"informal\">"
            ."</span>"
            ."</li>";
        }
        echo "</ul>";
    }

}

?>