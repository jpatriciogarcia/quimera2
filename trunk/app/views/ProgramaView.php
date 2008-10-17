<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ProgramaView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Programa $Programa
     */
    public function showAll($Programa) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(HtmlHelper::imageButton('add_programa', "onclick='parent.FunFamilia.openDialog(\"Programa::Agregar\", \""
        .WEB_PATH."/Programa/editar/codigo=0\", "
        ."{center: true, modal: true});'"));

        $html = "
        <br />
        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th></th>"
        ."\n  <th></th>"
        ."\n  <th>C&oacute;digo</th>"
        ."\n  <th>Nombre</th>"
        ."\n  <th>Fecha estimada inicio</th>"
        ."\n  <th>Fecha estimada fin</th>"
        ."\n  <th>Fecha real inicio</th>"
        ."\n  <th>Fecha real fin</th>"
        ."\n  <th>Costo</th>"
        ."\n </tr>";

        foreach ($Programa as $Programa) {
            $Programa->FormatFields();
            $html .= "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Programa::Editar\", \""
            .WEB_PATH."/Programa/editar/codigo={$Programa->codigo}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeletePrograma(\"{$Programa->codigo}\")'\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>{$Programa->codigo}</td>"
            ."\n  <td>{$Programa->nombre}</td>"
            ."\n  <td>{$Programa->fecha_inicio}</td>"
            ."\n  <td>{$Programa->fecha_termino}</td>"
            ."\n  <td>{$Programa->fecha_inicio_real}</td>"
            ."\n  <td>{$Programa->fecha_termino_real}</td>"
            ."\n  <td align=\"right\">$ {$Programa->costo}</td>"
            ."\n </tr>";
        }
        $html .= "\n</table>";

        echo $html;
        echo HtmlHelper::endDocument();

    }


    public function editar( $Programa ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'calendar_stripped', 'calendar-es', 'calendar-setup', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        $Programa->FormatFields();

        $Proyecto = new ProyectoModel;
        $Proyecto->Load('codigo=?', array($Programa->proyecto));

        $ProgramaEstado = new ProgramaEstadoModel;
        $ProgramaEstado->Load('codigo=?', array($Programa->programa_estado));

        $checked = $this->activo == 't' ? 'checked' : '';

    ?>

    <form action="<?php echo WEB_PATH; ?>/Programa/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

    <div id="ajax_info_message" style="display:none"><br /><p>Procesando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>
	<div id="transparent_ajax_error" style="display:none" class="transparent_ajax_message transparent_ajax_error"></div>
	<div id="transparent_ajax_notice" style="display:none" class="transparent_ajax_message transparent_ajax_notice"></div>

    <div id="live_search" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Buscando...</div>

    <fieldset>
    <legend>Datos</legend>
    <table width="100%" height="100%">
      <tr>
    	<td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>
         <div align="right">
          <?php echo HtmlHelper::imageButton('save_all', 'onclick=\'FunFamilia.saveForm("frmFormulario")\''); ?>
         </div>
        </td>
      </tr>
      <tr>
        <td>C&oacute;digo</td>
        <td>Proyecto (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('codigo', $Programa->codigo, false, array('class' => 'textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('proyecto', $Proyecto->nombre, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Nombre (*)</td>
        <td>Estado</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('nombre', $Programa->nombre, false, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('programa_estado', $ProgramaEstado->nombre, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Fecha inicio (*)</td>
        <td>Fecha termino (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputDateTime('fecha_inicio', $Programa->fecha_inicio, array('class' => 'required validate-date textinput' )); ?></td>
        <td><?php echo FormHelper::inputDateTime('fecha_termino', $Programa->fecha_termino, array('class' => 'required validate-date textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Fecha inicio real</td>
        <td>Fecha termino real</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputDateTime('fecha_inicio_real', $Programa->fecha_inicio_real, array('class' => 'validate-date textinput' )); ?></td>
        <td><?php echo FormHelper::inputDateTime('fecha_termino_real', $Programa->fecha_termino_real, array('class' => 'validate-date textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Descripci&oacute;n</td>
        <td>Costo (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::textArea('descripcion', $Programa->descripcion, array('class' => 'textarea' )); ?></td>
        <td><?php echo FormHelper::inputText('costo', $Programa->costo, false, array('class' => 'required validate-number textinput' )); ?><br /><br /><?php echo FormHelper::inputCheckbox('activo', 'Activo', $checked); ?></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <div id="info">Los campos marcados con (*) son requeridos.</div>
    </fieldset>
    </form>
    <script>
    FunFamilia.makeAutocompleteFields(['proyecto', 'programa_estado'], '<?php echo WEB_PATH; ?>/LiveSearch');
    $('codigo').disable();
    $('frmFormulario').focusFirstElement();
    </script>
	<?php
    }



    /**
	 * Enter description here...
	 *
	 * @param unknown_type $ProgramaEstado
	 */
    public function liveSearch($Programa) {
        echo "<ul>";
        foreach ($Programa as $Programa) {
            echo "<li>".($Programa->nombre).""
            ."<span class=\"informal\">"
            ."</span>"
            ."</li>";
        }
        echo "</ul>";
    }

}

?>