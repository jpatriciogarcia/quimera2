<?php
/**
 * Objeto ActividadTipoView.
 *
 * En este archivo se define la clase para la presentacion del estado del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ActividadTipoView {

	/**
     * Lista todos los centros familiares a partir de un objeto
     * ActiveRecord::ProgramaEstado
     *
     * @param ProgramaEstado $ActividadTipo
     */
	public function liveSearch($ActividadTipo) {
		echo "\n<ul>";
		foreach ($ActividadTipo as $ActividadTipo) {
			echo "\n <li>".($ActividadTipo->nombre).""
			."\n  <span class=\"informal\"></span>"
			."\n </li>";
		}
		echo "\n</ul>";
	}

}

?>