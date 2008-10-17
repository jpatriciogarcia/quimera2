<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del centro familiar.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class CentroFamiliarView {

    /**
     * Lista todos los centros familiares a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param CentroFamiliar $CentroFamiliar
     */
    public function showAll($CentroFamiliar) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        HtmlHelper::imageButton('add_centro', "onclick='parent.FunFamilia.openDialog(\"Centro Familiar::Agregar\", \""
        .WEB_PATH."/CentroFamiliar/editar/codigo=0\", "
        ."{center: true, modal: true});'")
        );

        $html = "
        <br />

        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th></th>"
        ."\n  <th></th>"
        ."\n  <th>C&oacute;digo</th>"
        ."\n  <th>Nombre</th>"
        ."\n  <th>Comuna</th>"
        ."\n  <th>Tel&eacute;fono</th>"
        ."\n  <th>Mail</th>"
        ."\n  <th>Director</th>"
        ."\n </tr>";

        foreach ($CentroFamiliar as $CentroFamiliar) {
            $Comuna = new ComunaModel;
            $Comuna->Load('codigo=?', array($CentroFamiliar->comuna));
            $html .= "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Centro Familiar::Editar\", \""
            .WEB_PATH."/CentroFamiliar/editar/codigo={$CentroFamiliar->codigo}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeleteCentro(\"{$CentroFamiliar->codigo}\")'\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>{$CentroFamiliar->codigo}</td>"
            ."\n  <td>{$CentroFamiliar->nombre}</td>"
            ."\n  <td>{$Comuna->comuna}</td>"
            ."\n  <td>{$CentroFamiliar->telefono}</td>"
            ."\n  <td>{$CentroFamiliar->mail}</td>"
            ."\n  <td>{$CentroFamiliar->director}</td>"
            ."\n </tr>";
        }
        $html .= "\n</table>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Centro Familiar :: Listar');
        </script>";

        echo !sizeof($CentroFamiliar) ? 'No existen datos' : $html;
        echo HtmlHelper::endDocument();

    }


    public function editar( $CentroFamiliar ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        $Comuna = new ComunaModel;
        $Comuna->Load('codigo=?', array($CentroFamiliar->comuna));

        $checked = $this->activo == 't' ? 'checked' : '';

    ?>

    <form action="<?php echo WEB_PATH; ?>/CentroFamiliar/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

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
        <td>Direcci&oacute;n (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('codigo', $CentroFamiliar->codigo, false, array('class' => 'textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('direccion', $CentroFamiliar->direccion, false, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Nombre (*)</td>
        <td>Poblaci&oacute;n</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('nombre', $CentroFamiliar->nombre, false, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('poblacion', $CentroFamiliar->poblacion, false, array('class' => 'validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Director (*)</td>
        <td>Comuna (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('director', $CentroFamiliar->director, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('comuna', $Comuna->comuna, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Tel&eacute;fono (*)</td>
        <td>Fax (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('telefono', $CentroFamiliar->telefono, false, array('class' => 'required validate-numeric textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('fax', $CentroFamiliar->fax, false, array('class' => 'required validate-numeric textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Casilla</td>
        <td>Correo electr&oacute;nico (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('casilla', $CentroFamiliar->casilla, false, array('class' => 'validate-max-20 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('mail', $CentroFamiliar->mail, false, array('class' => 'required validate-max-80 validate-email textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Descripci&oacute;n</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::textArea('descripcion', $CentroFamiliar->descripcion, array('class' => 'textarea' )); ?></td>
        <td><?php echo FormHelper::inputCheckbox('activo', 'Activo', $checked); ?></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <div id="info">Los campos marcados con (*) son requeridos.</div>
    </fieldset>
    </form>
    <script>
    FunFamilia.makeAutocompleteFields(['comuna'], '<?php echo WEB_PATH; ?>/LiveSearch');
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
    public function liveSearch($CentroFamiliar) {
        echo "<ul>";
        foreach ($CentroFamiliar as $CentroFamiliar) {
            echo "<li>".($CentroFamiliar->nombre).""
            ."<span class=\"informal\">"
            ."</span>"
            ."</li>";
        }
        echo "</ul>";
    }
}

?>