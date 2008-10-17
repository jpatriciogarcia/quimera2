<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ImagenView {

    public function liveSearch($Imagen) {
        echo "<ul>";
        foreach ($Imagen as $Imagen) {
            if (strstr($Imagen->getFilename(), ".png") && !in_array($Imagen->getFilename(), array('logo.png'))) {
                echo "<li>" . $Imagen->getFilename() . ""
                ."<span class=\"informal\">"
                ."<span class=\"name\"><img src='" . WEB_PATH . "/public/images/" . $Imagen->getFilename() . "' /></span>"
                ."</span>"
                ."</li>";
            }
        }
        echo "</ul>";
    }


}

?>
