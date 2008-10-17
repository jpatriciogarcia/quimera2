<?php
/**
 * Objeto PersonaController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class PersonaController extends PersonaModel {

    /**
     * Enter description here...
     *
     */
    function __construct() {
        parent::__construct();
    }

    /**
     * Enter description here...
     *
     */
    public function index() {
        PersonaView::showAll($this->Find('1=?', array('1')));
    }

    /**
     * Enter description here...
     *
     * @param array $args
     */
    public function editar( $args=array() ) {
        parse_str(implode("&", $args));
        $this->Load('rut=?', array($rut));
        PersonaView::editar($this);
    }

    /**
     * Enter description here...
     *
     */
    public function guardar() {
        $this->DB()->StartTrans();

        $_POST['codigo'] = $_POST['codigo'] ? $_POST['codigo'] : 0;
        $this->Load('codigo=?', array($_POST['codigo']));
        unset($_POST['codigo']);
        $this->LoadFromPOST( $_POST );
        //$this->Load('codigo=?', array($_POST['codigo']));
        //$this->LoadFromPOST( $_POST );

        // Validacion del Programa asociado
        $Programa = new ProgramaModel;
        $Programa->Load('nombre=?', array($_POST['programa']));
        if (!$Programa->codigo) {
            $this->DB()->RollbackTrans();
            die('El programa no existe.');
        }
        else {
            $this->programa = $Programa->codigo;
        }

        // Validacion del tipo asociado
        $ActividadTipo = new ActividadTipoModel;
        $ActividadTipo->Load('nombre=?', array($_POST['actividad_tipo']));
        if (!$ActividadTipo->codigo) {
            $this->DB()->RollbackTrans();
            die('El tipo no existe.');
        }
        else {
            $this->actividad_tipo = $ActividadTipo->codigo;
        }

        if ( ! $this->Save() ) {
            $this->DB()->RollbackTrans();
            echo $this->ErrorMsg();
        } else {
            $this->DB()->CompleteTrans();
            echo "Programa grabado con &eacute;xito.";
        }
    }

    /**
     * Enter description here...
     *
     */
    public function eliminar() {
        $this->DB()->StartTrans();
        $this->Load('codigo=?', array($_POST['codigo']));

        if ( ! $this->Delete() ) {
            $this->DB()->RollbackTrans();
            echo "<script>alert('{$this->ErrorMsg()}');</script>";
        } else {
            $this->DB()->CompleteTrans();
            echo "<script>alert('Persona eliminada con éxito.');</script>";
        }
    }


    public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY nombres, apellido_paterno, apellido_materno";
        } else {
            $whereOrderBy = "lower(nombres || ' ' || apellido_paterno || ' ' || apellido_materno) like '%".strtolower($value)."%'
                            OR
                            cast(rut as char(9)) like '".$value."%'
                            ORDER BY nombres, apellido_paterno, apellido_materno";
        }
        PersonaView::liveSearch($this->Find($whereOrderBy));
    }

}

?>