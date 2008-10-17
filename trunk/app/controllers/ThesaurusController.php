<?php
/**
 * Objeto ActividadController.
 *
 * En este archivo se define la clase controladora para los proyectos.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ThesaurusController extends ThesaurusModel {

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
        ThesaurusView::showAll($this->Find('1=? ORDER BY sugerir desc, palabra', array('1')));
    }


    /**
     * Enter description here...
     *
     */
    public function update( $args=array() ) {
        $this->Load('codigo=?', array($_POST['codigo']));
        $this->sugerir = $_POST['sugerir'];
        $this->Save();
    }


    /**
     * Enter description here...
     *
     */
    public function ver( $args=array() ) {
        parse_str(implode("&", $args));

        $Actividad = new ActividadModel;

        //$Actividad->DB()->debug = true;
        $rs = $Actividad->DB()->Execute("select distinct a.codigo, a.nombre, ar.nombre as resultado, count(t.codigo) as ocurrencias
                                        from actividad a
                                        join thesaurus_actividad ta on (a.codigo = ta.actividad)
                                        join thesaurus t on (ta.thesaurus = t.codigo)
                                        join actividad_resultado ar on (a.actividad_resultado = ar.codigo)
                                        where t.sugerir = true and a.actividad_resultado != 0 and a.actividad_formato = $actividad_formato
                                        group by a.codigo, a.nombre, ar.nombre
                                        order by a.codigo desc");
        ThesaurusView::ver($rs);
    }


    /**
     * Enter description here...
     *
     * @param unknown_type $args
     */
    public function verDetalle( $args=array() ) {
        parse_str(implode("&", $args));

        $Actividad = new ActividadModel;

        $rs = $Actividad->DB()->Execute("select a.codigo, a.descripcion, a.usuario_modificacion,
                                                to_char(a.timestamp, 'DD/MM/YYYY HH24:MI:SS') as timestamp,
                                                a.estado
                                        from actividad a
                                        where a.codigo = {$codigo}
                                        UNION
                                        select ah.codigo, ah.descripcion, ah.usuario_modificacion,
                                                to_char(ah.timestamp, 'DD/MM/YYYY HH24:MI:SS') as timestamp,
                                                ah.estado
                                        from actividad_historial ah
                                        where ah.codigo = {$codigo}
                                        order by estado desc, timestamp desc");

        //$Actividad->DB()->debug = true;
        ThesaurusView::verDetalle($rs);
    }

    /**
     * Enter description here...
     *
     * @param unknown_type $value
     */
    public function liveSearch( $value ) {
        if ($value=='.') {
            $whereOrderBy = "1=1 ORDER BY nombre";
        } else {
            $whereOrderBy = "lower(nombre) like '%".strtolower($value)."%' ORDER BY nombre";
        }
        ActividadView::liveSearch($this->Find($whereOrderBy));
    }

}

?>