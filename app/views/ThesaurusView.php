<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ThesaurusView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Actividad $Thesaurus
     */
    public function showAll($Thesaurus) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar();

        echo "
        <br />

        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th>¿ Surerir ?</th>"
        ."\n  <th>Palabra</th>"
        ."\n  <th>Cantidad de Ocurrencias</th>"
        ."\n </tr>";

        foreach ($Thesaurus as $Thesaurus) {
            echo "\n <tr>"
            ."\n  <td>".(FormHelper::inputCheckbox('sugerir[]', '', ($Thesaurus->sugerir=='t'?"checked":""), array('value'=>$Thesaurus->codigo, 'onclick'=>'updateThesaurus(this)')))."</td>"
            ."\n  <td>{$Thesaurus->palabra}</td>"
            ."\n  <td>{$Thesaurus->cantidad_ocurrencias}</td>"
            ."\n </tr>";
        }

        echo "\n</table>";
        ?>

        <script>
        parent.Windows.getFocusedWindow().setTitle('Thesaurus :: Listar');

        function updateThesaurus(palabra) {
            new Ajax.Request('<?php echo WEB_PATH; ?>/Thesaurus/update', {
                parameters: { codigo: palabra.value, sugerir: palabra.checked }
            });
        }
        </script>

        <?php

        echo HtmlHelper::endDocument();

    }


    /**
	 * Enter description here...
	 *
	 */
    public function ver( $rs ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar();

        echo "
        <br />

        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th>Ver</th>"
        ."\n  <th>Actividad</th>"
        ."\n  <th>Resultado</th>"
        ."\n </tr>";

        while ( ! $rs->EOF ) {

            echo "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/viewrow.png'
            onclick='parent.FunFamilia.openDialog(\"Thesaurus :: Detalle\", \""
            .WEB_PATH."/Thesaurus/verDetalle/codigo={$rs->fields['codigo']}\", "
            ."{center: true, modal: false});'
            /></td>"
            ."\n  <td>{$rs->fields['nombre']}</td>"
            ."\n  <td>{$rs->fields['resultado']}</td>"
            ."\n </tr>";

            $rs->MoveNext();
        }

        echo "\n</table>";
        echo HtmlHelper::endDocument();

    }





    /**
     * Enter description here...
     *
     * @param unknown_type $Actividad
     */
    public function verDetalle( $rs ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();

        echo "
        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th>Estado</th>"
        ."\n  <th>Descripción</th>"
        ."\n  <th>Usuario</th>"
        ."\n  <th>Fecha</th>"
        ."\n </tr>";

        while ( ! $rs->EOF ) {

            $ActividadEstado = new ActividadEstadoModel;
            $ActividadEstado->Load('codigo=?', array($rs->fields['estado']));

            echo "\n <tr>"
            ."\n  <td>{$ActividadEstado->nombre}</td>"
            ."\n  <td><div align='left'>{$rs->fields['descripcion']}</div></td>"
            ."\n  <td>{$rs->fields['usuario_modificacion']}</td>"
            ."\n  <td>{$rs->fields['timestamp']}</td>"
            ."\n </tr>";

            $rs->MoveNext();
        }

        echo "\n</table>";
        echo HtmlHelper::endDocument();

    }
}

?>
