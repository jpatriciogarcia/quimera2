<?php
/**
 * Objeto IndexController.
 *
 * En este archivo se define la clase controladora para el Index.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

abstract class AppHelper {

    /**
     * Enter description here...
     *
     * @param Session ACL Array - $acl
     * @return boolean - true si es permitida la operacion, false de lo contrario.
     */
    public function canSesion( $acl ) {
        $return = false;
        foreach ($acl as $rule) {
            if ($rule['grupo'] == 40 or $rule['grupo'] == 50 or $rule['grupo'] == 10) {
                $return = true;
            }
        }
        return $return;
    }

    /**
     * Enter description here...
     *
     * @param Session ACL Array - $acl
     * @return boolean - true si es permitida la operacion, false de lo contrario.
     */
    public function canCostos( $acl ) {
        $return = false;
        foreach ($acl as $rule) {
            if ($rule['grupo'] == 40 or $rule['grupo'] == 50 or $rule['grupo'] == 10) {
                $return = true;
            }
        }
        return $return;
    }

    /**
     * Enter description here...
     *
     * @param Session ACL Array - $acl
     * @return boolean - true si es permitida la operacion, false de lo contrario.
     */
    public function canPlanificarActividad( $acl ) {
        $return = false;
        foreach ($acl as $rule) {
            if ($rule['grupo'] == 40 or $rule['grupo'] == 10) {
                $return = true;
            }
        }
        return $return;
    }

    /**
     * Enter description here...
     *
     * @param Session ACL Array - $acl
     * @return boolean - true si es permitida la operacion, false de lo contrario.
     */
    public function canGrabarActividad( $acl ) {
        $return = false;
        foreach ($acl as $rule) {
            if ($rule['grupo'] == 40 or $rule['grupo'] == 50 or $rule['grupo'] == 10) {
                $return = true;
            }
        }
        return $return;
    }

    /**
     * Enter description here...
     *
     * @param Session ACL Array - $acl
     * @return boolean - true si es permitida la operacion, false de lo contrario.
     */
    public function canAceptarActividad( $acl ) {
        $return = false;
        foreach ($acl as $rule) {
            if ($rule['grupo'] == 30 or $rule['grupo'] == 10) {
                $return = true;
            }
        }
        return $return;
    }

    /**
     * Enter description here...
     *
     * @param Session ACL Array - $acl
     * @return boolean - true si es permitida la operacion, false de lo contrario.
     */
    public function canRechazarActividad( $acl ) {
        $return = false;
        foreach ($acl as $rule) {
            if ($rule['grupo'] == 30 or $rule['grupo'] == 10) {
                $return = true;
            }
        }
        return $return;
    }

    /**
     * Enter description here...
     *
     * @param Session ACL Array - $acl
     * @return boolean - true si es permitida la operacion, false de lo contrario.
     */
    public function canObservarActividad( $acl ) {
        $return = false;
        foreach ($acl as $rule) {
            if ($rule['grupo'] == 30 or $rule['grupo'] == 10) {
                $return = true;
            }
        }
        return $return;
    }

}


?>
