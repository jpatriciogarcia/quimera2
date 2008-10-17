<?php
/**
 * Objeto ActividadFormatoView.
 *
 * En este archivo se define la clase para la presentacion del Formato de la Actividad.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ActividadFormatoView {

    /**
     * Lista todos los Formatod para las actividades a partir de un objeto
     * ActiveRecord::ActividadFormato
     *
     * @param ActividadFormato $ActividadFormato
     */
    public function showAll($ActividadFormato) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        HtmlHelper::imageButton('add_actividadformato', "onclick='parent.FunFamilia.openDialog(\"Actividad Formato::Agregar\", \""
        .WEB_PATH."/ActividadFormato/editar/codigo=0\", "
        ."{center: true, modal: true});'")
        );

        $html = "
        <br />

        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th></th>"
        ."\n  <th></th>"
        ."\n  <th>Código</th>"
        ."\n  <th>Actividad Tipo</th>"
        ."\n  <th>Nombre</th>"
        ."\n  <th>Descripción</th>"
        ."\n  <th>ID Activo</th>"
        ."\n </tr>";

        foreach ($ActividadFormato as $ActividadFormato) {
            $html .= "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"ActividadFormato::Editar\", \""
            .WEB_PATH."/ActividadFormato/editar/codigo={$ActividadFormato->codigo}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeleteActividadFormato(\"{$ActividadFormato->codigo}\")'\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>{$ActividadFormato->codigo}</td>"
            //."\n  <td>{$ActividadFormato->actividad_tipo}</td>"
            ."\n  <td>{$ActividadFormato->nombre}</td>"
            ."\n  <td>{$ActividadFormato->descripcion}</td>"
            ."\n  <td>{$ActividadFormato->activo}</td>"
            ."\n </tr>";
        }
        $html .= "\n</table>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Actividad Formato :: Listar');
        </script>";

        echo $html;
        echo HtmlHelper::endDocument();

    }


    public function editar( $ActividadFormato ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        //$ActividadFormato->FormatFields();

        $ActividadTipo = new ActividadTipoModel;
        $ActividadTipo->Load('codigo=?', array($ActividadFormato->actividad_tipo));

        $checked = $this->activo == 't' ? 'checked' : '';

    ?>

    <form action="<?php echo WEB_PATH; ?>/ActividadFormato/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

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
        <td>Código</td>
        <td>Actividad Tipo (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('codigo', $ActividadFormato->codigo, false, array('class' => 'textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('actividad_tipo', $ActividadTipo->nombre, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Nombre (*)</td>
        <td>Descripción (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('nombre', $ActividadFormato->nombre, false, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('descripcion', $ActividadFormato->descripcion, false, array('class' => 'validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Activo (*)</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputCheckbox('activo', 'Activo', $checked); ?></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <div id="info">Los campos marcados con (*) son requeridos.</div>
    </fieldset>
    </form>
    <script>
    FunFamilia.makeAutocompleteFields(['actividad_tipo'], '<?php echo WEB_PATH; ?>/LiveSearch');
    $('codigo').disable();
    $('frmFormulario').focusFirstElement();
    </script>
	<?php
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $Comuna
	 */
    public function liveSearch($ActividadFormato) {
        echo "\n<ul>";
        foreach ($ActividadFormato as $ActividadFormato) {
            echo "\n <li>".($ActividadFormato->nombre).""
            ."\n  <span class=\"informal\">"
            ."\n   <span class=\"name\">".($ActividadFormato->descripcion)."</span>"
            ."\n   <span style=\"display: none\">".($ActividadFormato->actividad_tipo)."</span>"
            ."\n  </span>"
            ."\n </li>";
        }
        echo "\n</ul>";
    }
}

?>