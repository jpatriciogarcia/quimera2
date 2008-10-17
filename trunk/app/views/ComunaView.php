<?php
/**
 * Objeto ComunaView.
 *
 * En este archivo se define la clase para la presentacion de las comunas.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ComunaView {

    /**
     * Lista todos las comunas a partir de un objeto
     * ActiveRecord::Comuna
     *
     * @param Comuna $Comuna
     */
    public function liveSearch($Comuna) {
        echo "n<ul>";
        foreach ($Comuna as $Comuna) {
            $Ciudad = new CiudadModel;
            $Ciudad->Load('codigo=?', array($Comuna->codigo_ciudad));
            echo "<li>{$Comuna->comuna}"
            ."<span class=\"informal\">"
            ."<span class=\"name\">({$Ciudad->ciudad}) {$Comuna->comuna}</span>"
            ."</span>"
            ."</li>";
        }
        echo "</ul>";
    }

}

?>