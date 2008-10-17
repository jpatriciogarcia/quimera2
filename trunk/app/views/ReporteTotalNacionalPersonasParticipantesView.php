<?php
/**
 * Objeto FamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteTotalNacionalPersonasParticipantesView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Actividad $Actividad
     */
    public function showAll($Reporte) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'calendar_stripped', 'calendar-es', 'calendar-setup', 'tablesort', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));

        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        "<table><tr><td>".
        HtmlHelper::imageButton('export_to_pdf', "onclick='exportToPdf()'")
        ."</td><td>&nbsp;</td><td>".
        HtmlHelper::imageButton('export_to_xls', "onclick='exportToExcel()'")
        ."</td></tr></table>"
        );

        $CentroFamiliar = new CentroFamiliarModel;

        ?>
  	    <div id="ajax_info_message" style="display:none"><br /><p>Actualizando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>

        <fieldset>
	    <legend>Filtro de Búsqueda</legend>
	    <table width="100%">
	      <tr>
	        <td>Centro Familiar</td>
	        <td>Proyecto</td>
	        <td>Programa</td>
	        <td>Actividad</td>
	        <td>Fecha Inicio</td>
	        <td>Fecha Término</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::selectBox('centro_familiar', '', $CentroFamiliar->Find('1=1 order by nombre'), 'codigo', 'nombre', true, array('class' => 'validate-selection selectArea', 'onChange' => 'findProyectos(this.value);')); ?></td>
	        <td><div id="div-proyecto"><select id="proyecto" name="proyecto" class="validate-selection selectArea"><option></option></select></div></td>
	        <td><div id="div-programa"><select id="programa" name="programa" class="validate-selection selectArea"><option></option></select></div></td>
	        <td><div id="div-actividad"><select id="actividad" name="actividad" class="validate-selection selectArea"><option></option></select></div></td>
	        <td><?php echo FormHelper::inputDate('fecha_inicio', '', array('class' => 'validate-date dateinput', 'onChange' => 'updateReport()')); ?></td>
	        <td><?php echo FormHelper::inputDate('fecha_termino', '', array('class' => 'validate-date dateinput', 'onChange' => 'updateReport()')); ?></td>
          </tr>
	     </table>

	     </fieldset>

	     <br />

        <?php

        $html = "<div id='div-list'>" . self::getList($Reporte) . "</div>";

        echo $html;

        ?>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Reportes :: Total Nacional Personas Participantes');

        function findProyectos(centro) {
            new Ajax.Updater('div-proyecto', '<?php echo WEB_PATH; ?>/ListasDependientes', {
                parameters: { controller: 'proyecto', key: 'centro_familiar', value: centro, selected: '', extra_params: '{"class":"validate-selection selectArea", "onChange":"findProgramas(this.value)"}' },
                onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'div-list'}, showMode:null}); },
            });
            $('programa').update('<select id="programa" name="programa" class="validate-selection selectArea"><option></option></select>');
            $('actividad').update('<select id="actividad" name="actividad" class="validate-selection selectArea"><option></option></select>');
            updateReport();
        }

        function findProgramas(proyecto) {
            new Ajax.Updater('div-programa', '<?php echo WEB_PATH; ?>/ListasDependientes', {
                parameters: { controller: 'programa', key: 'proyecto', value: proyecto, selected: '', extra_params: '{"class":"validate-selection selectArea", "onChange":"findActividades(this.value)"}' },
                onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'div-list'}, showMode:null}); },
            });
            $('actividad').update('<select id="actividad" name="actividad" class="validate-selection selectArea"><option></option></select>');
            updateReport();
        }

        function findActividades(programa) {
            new Ajax.Updater('div-actividad', '<?php echo WEB_PATH; ?>/ListasDependientes', {
                parameters: { controller: 'actividad', key: 'programa', value: programa, selected: '', extra_params: '{"class":"validate-selection selectArea", "onChange":"updateReport()"}' },
                onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'div-list'}, showMode:null}); },
            });
            updateReport();
        }

        function updateReport() {
            new Ajax.Updater('div-list', '<?php echo WEB_PATH; ?>/ReporteTotalNacionalPersonasParticipantes/updateList', {
                parameters: { centro_familiar: $('centro_familiar').value, proyecto: $('proyecto').value, programa: $('programa').value, actividad: $('actividad').value, fecha_inicio: $('fecha_inicio').value, fecha_termino: $('fecha_termino').value},
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

        $cantidad = 0;
        $html = "
        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th>Centro Familiar</th>"
        ."\n  <th>Proyecto</th>"
        ."\n  <th>Programa</th>"
        ."\n  <th>Actividad</th>"
        ."\n  <th>Fecha Inicio</th>"
        ."\n  <th>Fecha Término</th>"
        ."\n  <th>Total Personas</th>"
        ."\n </tr>";

        foreach ($Reporte as $Reporte) {
            $Reporte->FormatFields();
            $html .= "\n <tr>"
            ."\n  <td><div align='left'>{$Reporte->centro_familiar_nombre}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->proyecto_nombre}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->programa_nombre}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->actividad_nombre}</div></td>"
            ."\n  <td><div align='center'>{$Reporte->fecha_inicio}</div></td>"
            ."\n  <td><div align='center'>{$Reporte->fecha_termino}</div></td>"
            ."\n  <td><div align='center'>{$Reporte->cantidad_personas}</div></td>"
            ."\n </tr>";
            $cantidad += $Reporte->cantidad_personas;
        }
        $html .= "\n <tr>"
        ."\n  <td colspan='6'><div align='right'>TOTAL</div></td>"
        ."\n  <td><div align='center'>{$cantidad}</div></td>"
        ."\n </tr>";
        $html .= "\n</table>";

        return $html;
    }


}

?>
