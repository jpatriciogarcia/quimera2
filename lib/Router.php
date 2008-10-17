<?php

	class Router {
		private $registry;
		private $path;
		private $args = array();


		function __construct($registry) {
			$this->registry = $registry;
		}


		function setPath($path) {
			$path = trim($path, '/\\');
			$path .= '/';

			if (is_dir($path) == false) {
				echo "<pre>";
				throw new Exception ('Ruta de controlador inválida: `' . $path . '`');
			}

			$this->path = $path;
		}


		function delegate() {
			// Analyze route
			$this->getController($file, $controller, $action, $args);

			// File available?
			if (is_readable($file) == false) {
				throw new Exception ('Controlador no encontrado: `' . $file . '`');
			}

			// Include the file
			//include ($file);

			// Initiate the class
			$class = $controller . 'Controller';
			$controller = new $class($this->registry);

			// Action available?
			if (is_callable(array($controller, $action)) == false) {
				throw new Exception ('Metodo no encontrado: `' . $action . '`');
			}

			// Run action
			$controller->$action($args);
		}


		private function getController(&$file, &$controller, &$action, &$args) {

			$route = (empty($_GET['route'])) ? '' : $_GET['route'];

			if (empty($route)) { $route = 'Index'; }

			// Get separate parts
			$route = trim($route, '/\\');
			$parts = explode('/', $route);

			// Find right controller
			$cmd_path = $this->path;
			foreach ($parts as $part) {
				$fullpath = $cmd_path . $part;

				// Is there a dir with this path?
				if (is_dir($fullpath)) {
					$cmd_path .= $part . '/';
					array_shift($parts);
					continue;
				}

				// Find the file
				if (is_file($fullpath . 'Controller.php')) {
					$controller = $part;
					array_shift($parts);
					break;
				}
			}

			if (empty($controller)) { $controller = 'Index'; };

			// Get action
			$action = array_shift($parts);
			if (empty($action)) { $action = 'index'; }

			$file = $cmd_path . $controller . 'Controller.php';
			$args = $parts;
		}


	}

?>