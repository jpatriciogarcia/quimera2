<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ActividadView {

	/**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Actividad $Actividad
     */
	public function showAll($Actividad) {

		echo HtmlHelper::startHeader();
		echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
		echo HtmlHelper::includeCSSFiles(array('style.windows'));
		echo HtmlHelper::endHeader();
		echo HtmlHelper::commandButtonBar(
		HtmlHelper::imageButton('add_actividad', "onclick='parent.FunFamilia.openDialog(\"Actividad::Agregar\", \""
		.WEB_PATH."/Actividad/editar/codigo=0\", "
		."{center: true, modal: true});'")
		);

		$html = "
        <br />

        <table class='sortable'>"
		."\n <tr>"
		."\n  <th></th>"
		."\n  <th></th>"
		."\n  <th>Código</th>"
		."\n  <th>Nombre</th>"
		."\n  <th>Fecha estimada inicio</th>"
		."\n  <th>Programa</th>"
		."\n  <th>Responsable</th>"
		."\n  <th>Costo</th>"
		."\n </tr>";

		foreach ($Actividad as $Actividad) {
			$html .= "\n <tr>"
			."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Actividad::Editar\", \""
			.WEB_PATH."/Actividad/editar/codigo={$Actividad->codigo}\", "
			."{center: true, modal: true});'
            /></td>"
			."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeleteActividad(\"{$Actividad->codigo}\")'\", "
			."{center: true, modal: true});'
            /></td>"
			."\n  <td>{$Actividad->codigo}</td>"
			."\n  <td>{$Actividad->nombre}</td>"
			."\n  <td>{$Actividad->fecha_inicio}</td>"
			."\n  <td>{$Actividad->fecha_termino}</td>"
			."\n  <td>{$Actividad->programa}</td>"
			."\n  <td>{$Actividad->usuario}</td>"
			."\n  <td>{$Actividad->costo}</td>"
			."\n  <td>{$Actividad->descripcion}</td>"
			."\n </tr>";
		}
        $html .= "\n</table>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Actividad :: Listar');
        </script>";

		echo $html;
		echo HtmlHelper::endDocument();

	}


	public function editar( $Actividad ) {

		echo HtmlHelper::startHeader();
		echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'calendar_stripped', 'calendar-es', 'calendar-setup', 'utils'));
		echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
		echo HtmlHelper::endHeader();

		$Actividad->FormatFields();


		$Programa = new ProgramaModel;
		$Programa->Load('codigo=?', array($Actividad->programa));

		$ActividadTipo = new ActividadTipoModel;
		$ActividadTipo->Load('codigo=?', array($Actividad->actividad_tipo));

	    ?>

	    <form action="<?php echo WEB_PATH; ?>/Actividad/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

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
	        <td>Código (*)</td>
	        <td>Nombre (*)</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('codigo', $Actividad->codigo, false, array('class' => 'textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('nombre', $Actividad->nombre, false, array('class' => 'requiered validate-max-255 textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Fecha de Inicio (*)</td>
	        <td>Fecha termino (*)</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputDateTime('fecha_inicio', $Actividad->fecha_inicio, array('class' => 'validate-date textinput' )); ?></td>
	        <td><?php echo FormHelper::inputDateTime('fecha_termino', $Actividad->fecha_termino, array('class' => 'validate-date textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Programa (*)</td>
	        <td>Responsable (*)</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('programa', $Programa->codigo, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('usuario', $Actividad->usuario, true, array('class' => 'required validate-max-20 textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Costo (*)</td>
	        <td>Tipo Actividad(*)</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('costo', $Actividad->costo, false, array('class' => 'validate-number textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('actividad_tipo', $ActividadTipo->codigo, true, array('class' => 'required validate-max-20 textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Observaciones (*)</td>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::textArea('descripcion', $Actividad->descripcion, array('class' => 'textarea' )); ?></td>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	    </table>
	    </fieldset>
	    </form>
	    <script>
	    FunFamilia.makeAutocompleteFields(['usuario', 'programa', 'actividad_tipo'], '<?php echo WEB_PATH; ?>/LiveSearch');
	    $('codigo').disable();
	    $('frmFormulario').focusFirstElement();
	    </script>
		<?php
	}


}

?>
