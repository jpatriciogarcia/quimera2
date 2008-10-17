<?php
/**
 * Objeto GrupoModuloView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class GrupoModuloView {

	/**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::GrupoModulo
     *
     * @param GrupoModulo $GrupoModulo
     */
	public function showAll($GrupoModulo) {

		echo HtmlHelper::startHeader();
		echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
		echo HtmlHelper::includeCSSFiles(array('style.windows'));
		echo HtmlHelper::endHeader();
		echo HtmlHelper::commandButtonBar(
		HtmlHelper::imageButton('add_grupo_modulo', "onclick='parent.FunFamilia.openDialog(\"Privilegios :: Agregar\", \""
		.WEB_PATH."/GrupoModulo/editar/grupo=0/modulo=0\", "
		."{center: true, modal: true});'")
		);

		$html = "
        <br />

        <table class='sortable'>"
		."\n <tr>"
		."\n  <th></th>"
		."\n  <th></th>"
		."\n  <th>Grupo</th>"
		."\n  <th>M&oacute;dulo</th>"
		."\n  <th>Privilegio</th>"
		."\n </tr>";

		foreach ($GrupoModulo as $GrupoModulo) {

			$Grupo = new GrupoModel;
			$Modulo = new ModuloModel;

			$Grupo->Load('codigo=?', array($GrupoModulo->grupo));
			$Modulo->Load('codigo=?', array($GrupoModulo->modulo));

			$html .= "\n <tr>"
			."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"GrupoModulo::Editar\", \""
			.WEB_PATH."/GrupoModulo/editar/grupo={$GrupoModulo->grupo}/modulo={$GrupoModulo->modulo}\", "
			."{center: true, modal: true});'
            /></td>"
			."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeleteGrupoModulo(\"{$GrupoModulo->grupo}\", \"{$GrupoModulo->modulo}\")'\", "
			."{center: true, modal: true});'
            /></td>"
			."\n  <td>{$Grupo->grupo}</td>"
			."\n  <td>{$Modulo->descripcion}</td>"
			."\n  <td>".strtoupper($GrupoModulo->privilegio)."</td>"
			."\n </tr>";
		}
        $html .= "\n</table>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Privilegios :: Listar');
        </script>";

		echo $html;
		echo HtmlHelper::endDocument();

	}


	public function editar( $GrupoModulo ) {

		echo HtmlHelper::startHeader();
		echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'utils'));
		echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
		echo HtmlHelper::endHeader();

		$GrupoModulo->FormatFields();

		$Grupo = new GrupoModel;
		$Grupo->Load('codigo=?', array($GrupoModulo->grupo));

		$Modulo = new ModuloModel;
		$Modulo->Load('codigo=?', array($GrupoModulo->modulo));

    ?>

    <form action="<?php echo WEB_PATH; ?>/GrupoModulo/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

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
        <td>Grupo (*)</td>
        <td>Modulo (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::selectBox('grupo', $Grupo->grupo, $Grupo->Find('1=1'), 'codigo', 'grupo', array('class' => 'selectArea' )); ?></td>
        <td><?php echo FormHelper::selectBox('modulo', $Modulo->descripcion, $Modulo->Find('1=1'), 'codigo', 'descripcion', array('class' => 'selectArea' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Privilegios</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputCheckbox('lectura', 'Lectura', $this->lectura, array('class' => 'checkboxArea' )); ?></td>
        <td><?php echo FormHelper::inputCheckbox('escritura', 'Escritura', $this->escritura, array('class' => 'checkboxArea' )); ?></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </fieldset>
    </form>
    <script>
    //FunFamilia.makeAutocompleteFields(['programa', 'actividad_tipo', 'usuario'], '<?php echo WEB_PATH; ?>/LiveSearch');
    //$('codigo').disable();
    $('frmFormulario').focusFirstElement();
    </script>
	<?php
	}


}

?>