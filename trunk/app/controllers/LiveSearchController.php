<?php
/**
 * Objeto LiveSearchController.
 *
 * Por este archivo pasan las peticiones del tipo LiveSearch
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class LiveSearchController {

	/**
     * Enter description here...
     *
     */
	public function index() {
		list($controller, $value) = each($_POST);

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

		// Action available?
		if (is_callable(array($controller, 'liveSearch')) == false) {
			throw new Exception ('Método no encontrado: `liveSearch`');
		}

		// Run action
		$controller->liveSearch($value);
	}

}

?>