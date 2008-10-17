<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteDinerosActividadEspecificaView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Actividad $Actividad
     */
    public function showAll($Reporte) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort', 'scriptaculous', 'transparent_message'));
        echo HtmlHelper::includeCSSFiles(array('style.windows', 'niceforms'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        "<table><tr><td>".
        HtmlHelper::imageButton('export_to_pdf', "onclick='exportToPdf()'")
        ."</td><td>&nbsp;</td><td>".
        HtmlHelper::imageButton('export_to_xls', "onclick='exportToExcel()'")
        ."</td></tr></table>"
        );

        
        ?>
  	    <div id="ajax_info_message" style="display:none"><br /><p>Actualizando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>

        <fieldset>
	    <legend>Filtro de Búsqueda</legend>
	    <table width="100%">
	      <tr>
	        <td>Numero Actividad </td>
	        <td>Nombre Actividad </td>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        
	        <td><?php echo FormHelper::inputText('codigo_actividad', '', false, array('class' => 'required validate-max-13 textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('nombre_actividad', '', false, array('class' => 'required validate-max-30 textinput' )); ?></td>
	        <td>&nbsp;</td>
	        <td><?php echo HtmlHelper::imageButton('buscar_DinerosPorActividad', "onclick='updateReport()'") ?></td>
	        </tr>

	     </table>
	     
	     </fieldset>

	     <br />

        <?php

        $html = "<div id='div-list'>" . self::getList($Reporte) . "</div>";

        echo $html;

        ?>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Reportes :: Dineros por Actividad');

        function updateReport() {
            new Ajax.Updater('div-list', '<?php echo WEB_PATH; ?>/ReporteDinerosActividadEspecifica/updateList', {
                parameters: { codigo_actividad: $('codigo_actividad').value, nombre_actividad: $('nombre_actividad').value },
                onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'div-list'}, showMode:null}); },
                onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); }
            });
        }


        function exportToPdf() {
            new Ajax.Request('<?php echo WEB_PATH; ?>/HTML2PDF', {
                parameters: { content: $('div-list').innerHTML },
                onComplete: function(transport){ window.open('<?php echo WEB_PATH; ?>/HTML2PDF/generate'); }
            });
        }

        function exportToExcel() {
            new Ajax.Request('<?php echo WEB_PATH; ?>/HTML2XLS', {
                parameters: { content: $('div-list').innerHTML },
                onComplete: function(transport){ window.open('<?php echo WEB_PATH; ?>/HTML2XLS/generate'); }
            });
        }
        </script>
        <?php

        echo HtmlHelper::endDocument();

    }


    public function getList($Reporte) {

        if (!sizeof($Reporte)) {
            die("<br /><h3 align='center'>No existen datos para el criterio de búsqueda seleccionado.</h3>");
        }

        $html = "
        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th>Código Actividad</th>"
        ."\n  <th>Nombre Actividad</th>"
        ."\n  <th>Estado Actividad</th>"
        ."\n  <th>Tipo Documento</th>"
        ."\n  <th>Número del Documento</th>"
        ."\n  <th>Valor</th>"
        ."\n </tr>";

        foreach ($Reporte as $Reporte) {
            $html .= "\n <tr>"
            ."\n  <td>{$Reporte->codigo_actividad}</td>"
            ."\n  <td><div align='left'>{$Reporte->nombre_actividad}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->nombre_estado}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->descripcion}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->numero_documento}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->costo}</div></td>"
            ."\n </tr>";
        }
        $html .= "\n</table>";

        return $html;
    }


}

?>
