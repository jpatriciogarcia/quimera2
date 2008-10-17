<?php
/**
 * Objeto IndexController.
 *
 * En este archivo se define la clase controladora para el Index.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class IndexController extends IndexView {

    public function index() {
        if ( ! UsuarioController::isLogged() ) {
            echo IndexView::login();
        }
        else {
            $this->home();
        }
    }


    public function login() {
        echo "false";
        UsuarioModel::Load('id=?', array(1));
    }


    public function home() {
        if (!isset($_SESSION['ACL'])) {
            header('Location: .');
        }

        $modulo = array();
        foreach ($_SESSION['ACL'] as $acl) {
            $modulo[] = $acl['modulo'];
        }

        $Modulo = new ModuloModel;
        $this->showHome( $Modulo->Find('dock = true AND codigo IN('.implode(',', $modulo).')') );
    }


}

?>