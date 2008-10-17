<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ReporteBuscaPersonasView {

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
	        <td> &nbsp;</td>
	        <td>Rut </td>
	        <td>Nombre </td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>&nbsp;</td>
	        <td><?php echo FormHelper::inputText('rut', '', false, array('class' => 'required validate-max-13 textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('nombre', '', false, array('class' => 'required validate-max-30 textinput' )); ?></td>
	      <td><?php echo HtmlHelper::imageButton('buscar_Personas', "onclick='updateReport()'") ?></td>
	        </tr>

	     </table>
	     
	     </fieldset>

	     <br />

        <?php

        $html = "<div id='div-list'>" . self::getList($Reporte) . "</div>";

        echo $html;

        ?>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Reportes :: Busca Personas');

        function updateReport() {
            new Ajax.Updater('div-list', '<?php echo WEB_PATH; ?>/ReporteBuscaPersonas/updateList', {
                parameters: { rut: $('rut').value, nombre: $('nombre').value },
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
        ."\n  <th>RUT</th>"
        ."\n  <th>Nombre</th>"
        ."\n  <th>Dirección</th>"
        ."\n  <th>Comuna</th>"
        ."\n  <th>Estado Civil</th>"
        ."\n  <th>Teléfono</th>"
        ."\n  <th>Celular</th>"
        ."\n  <th>Ocupación</th>"
        ."\n  <th>Mail</th>"
        ."\n </tr>";

        foreach ($Reporte as $Reporte) {
            $html .= "\n <tr>"
            ."\n  <td>{$Reporte->rut}</td>"
            ."\n  <td><div align='left'>{$Reporte->nombre}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->direccion}</div></td>"            
            ."\n  <td><div align='left'>{$Reporte->comuna}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->estado_civil}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->telefono}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->celular}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->ocupacion}</div></td>"
            ."\n  <td><div align='left'>{$Reporte->mail}</div></td>"
            ."\n </tr>";
        }
        $html .= "\n</table>";

        return $html;
    }


}

?>
