<?php
/**
 * Objeto ProyectoView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ProyectoView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Actividad $Proyecto
     */
    public function showAll($Proyecto) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        HtmlHelper::imageButton('add_proyecto', "onclick='parent.FunFamilia.openDialog(\"Proyecto::Agregar\", \""
        .WEB_PATH."/Proyecto/editar/codigo=0\", "
        ."{center: true, modal: true});'")
        );

        $html = "
        <br />

        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th></th>"
        ."\n  <th></th>"
        ."\n  <th>C&oacute;digo</th>"
        ."\n  <th>Centro Familiar</th>"
        ."\n  <th>Usuario</th>"
        ."\n  <th>Nombre</th>"
        ."\n  <th>Descripci&oacute;n</th>"
        ."\n  <th>Costo</th>"
        ."\n </tr>";

        foreach ($Proyecto as $Proyecto) {
            $CentroFamiliar = new CentroFamiliarModel;
            $CentroFamiliar->Load('codigo=?', array($Proyecto->centro_familiar));

            $Usuario = new UsuarioModel;
            $Usuario->Load('usuario=?', array($Proyecto->usuario));

            $html .= "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Proyecto::Editar\", \""
            .WEB_PATH."/Proyecto/editar/codigo={$Proyecto->codigo}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeleteProyecto(\"{$Proyecto->codigo}\")'\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>{$Proyecto->codigo}</td>"
            ."\n  <td>{$CentroFamiliar->nombre}</td>"
            ."\n  <td>" . $Usuario->nombres . " " . $Usuario->apellido_paterno . " " . $Usuario->apellido_materno . "</td>"
            ."\n  <td>{$Proyecto->nombre}</td>"
            ."\n  <td>{$Proyecto->descripcion}</td>"
            ."\n  <td>" . number_format($Proyecto->costo, 0, '', '.') . "</td>"
            ."\n </tr>";
        }
        $html .= "\n</table>";

        echo $html;
        echo HtmlHelper::endDocument();

    }


    public function editar( $Proyecto ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'typecast', 'typecast.config', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms'));
        echo HtmlHelper::endHeader();

        $Proyecto->FormatFields();
        $Proyecto->centro_familiar = $Proyecto->centro_familiar ? $Proyecto->centro_familiar : 0;
        $CentroFamiliar = new CentroFamiliarModel;
        $CentroFamiliar->Load('codigo=?', array($Proyecto->centro_familiar));

        $Usuario = new UsuarioModel;
        $Usuario->Load('usuario=?', array($Proyecto->usuario));

        $checked = $this->activo == 't' ? 'checked' : '';

        ?>

    <form action="<?php echo WEB_PATH; ?>/Proyecto/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

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
        <td>C&oacute;digo (*)</td>
        <td>Centro Familiar (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('codigo', $Proyecto->codigo, false, array('class' => 'textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('centro_familiar', $CentroFamiliar->nombre, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Responsable del proyecto (*)</td>
        <td>Nombre (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('usuario', ($Usuario->nombres . ' ' . $Usuario->apellido_paterno . ' ' . $Usuario->apellido_materno), true, array('class' => 'required validate-max-20 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('nombre', $Proyecto->nombre, false, array('class' => 'required validate-max-20 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Descripci&oacute;n (*)</td>
        <td>Costo (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('descripcion', $Proyecto->descripcion, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('costo', $Proyecto->costo, false, array('class' => 'required validate-number textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
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
    FunFamilia.makeAutocompleteFields(['centro_familiar', 'usuario'], '<?php echo WEB_PATH; ?>/LiveSearch');
    $('codigo').disable();
    $('frmFormulario').focusFirstElement();
    </script>
	<?php
    }



    /**
	 * Enter description here...
	 *
	 * @param unknown_type $Proyecto
	 */
    public function liveSearch($Proyecto) {
        echo "<ul>";
        foreach ($Proyecto as $Proyecto) {
            echo "<li>".($Proyecto->nombre).""
            ."<span class=\"informal\">"
            ."</span>"
            ."</li>";
        }
        echo "</ul>";
    }
}

?>
