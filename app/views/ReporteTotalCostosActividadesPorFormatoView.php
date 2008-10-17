<?php
/**
 * Objeto FamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteTotalCostosActividadesPorFormatoView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Actividad $Actividad
     */
    public function showAll($Reporte) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'calendar_stripped', 'calendar-es', 'calendar-setup', 'utils'));
		echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
		
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        "<table><tr><td>".
        HtmlHelper::imageButton('export_to_pdf', "onclick='exportToPdf()'")
        ."</td><td>&nbsp;</td><td>".
        HtmlHelper::imageButton('export_to_xls', "onclick='exportToExcel()'")
        ."</td></tr></table>"
        );

        $ActividadFormato = new ActividadFormatoModel;
        
        ?>
  	    <div id="ajax_info_message" style="display:none"><br /><p>Actualizando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>

        <fieldset>
	    <legend>Filtro de Búsqueda</legend>
	    <table width="100%">
	      <tr>
	        <td>Fecha Inicio</td>
	        <td>Fecha Término</td>
	        <td>Centro Familiar</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputDateTime('fecha_inicio', '', array('class' => 'validate-date textinput' )); ?></td>
	        <td><?php echo FormHelper::inputDateTime('fecha_termino', '', array('class' => 'validate-date textinput' )); ?></td>
	        <td><td><?php echo FormHelper::selectBox('formato_actividad', '', $ActividadFormato->Find('1=1 order by nombre'), 'codigo', 'nombre', true, array('class' => 'validate-selection selectArea', 'onChange' => 'updateReport()')); ?></td></td>
	        <td><td><?php echo HtmlHelper::imageButton('buscar_TotalCostoActividadPorFormato', "onclick='updateReport()'") ?></td></td>
	        </tr>

	     </table>
	     
	     </fieldset>

	     <br />

        <?php

        $html = "<div id='div-list'>" . self::getList($Reporte) . "</div>";

        echo $html;

        ?>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Reportes :: Total de Costo Actividades por Formato');

        function updateReport() {
            new Ajax.Updater('div-list', '<?php echo WEB_PATH; ?>/ReporteCostosActividadesPorFormato/updateList', {
                parameters: { centro_familiar: $('centro_familiar').value, fechainicio: $('fecha_inicio').value, fechatermino: $('fecha_termino').value},
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
        ."\n  <th>Costo </th>"
        ."\n  <th>Nombre Tipo Actividad </th>"
        ."\n  <th>Fecha Inicio</th>"
        ."\n  <th>Fecha Término</th>"
		."\n </tr>";

        foreach ($Reporte as $Reporte) {
            $html .= "\n <tr>"
            ."\n  <td><div align='left'>{$Reporte->costo}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->nombre_formato}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->fecha_inicio}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->fecha_termino}</div></td>"
            ."\n </tr>";
        }
        $html .= "\n</table>";

        return $html;
    }


}

?>
