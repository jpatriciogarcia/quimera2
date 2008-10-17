<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class PersonaView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Persona $Persona
     */
    public function showAll($Persona) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        HtmlHelper::imageButton('add_persona', "onclick='parent.FunFamilia.openDialog(\"Persona::Agregar\", \""
        .WEB_PATH."/persona/editar/rut=0\", "
        ."{center: true, modal: true});'")
        );

        $html = "
        <br />

        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th></th>"
        ."\n  <th></th>"
        ."\n  <th>Rut</th>"
        ."\n  <th>Nombres</th>"
        ."\n  <th>Apellido Paterno</th>"
        ."\n  <th>Apellido Materno</th>"
        ."\n  <th>Sexo</th>"
        ."\n  <th>Fecha Nacimiento</th>"
        ."\n  <th>Tipo Calle</th>"
        ."\n  <th>Tipo Vivienda</th>"
        ."\n  <th>Calle</th>"
        ."\n  <th>Numero</th>"
        ."\n  <th>Comuna</th>"
        ."\n  <th>Fono</th>"
        ."\n  <th>Celular</th>"
        ."\n  <th>Mail</th>"
        ."\n  <th>Estado Civil</th>"
        ."\n  <th>N Integrantes de la Familia</th>"
        ."\n  <th>Nivel Educacional</th>"
        ."\n  <th>Ocupacion</th>"
        ."\n </tr>";

        foreach ($Persona as $Persona) {
            $html .= "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Persona::Editar\", \""
            .WEB_PATH."/Persona/editar/rut={$Persona->rut}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeletePersona(\"{$Persona->rut}\")'\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>{$Persona->rut}</td>"
            ."\n  <td>{$Persona->nombres}</td>"
            ."\n  <td>{$Persona->apellido_paterno}</td>"
            ."\n  <td>{$Persona->apellido_materno}</td>"
            ."\n  <td>{$Persona->sexo}</td>"
            ."\n  <td>{$Persona->fecha_nacimiento}</td>"
            ."\n  <td>{$Persona->tipo_calle}</td>"
            ."\n  <td>{$Persona->tipo_vivienda}</td>"
            ."\n  <td>{$Persona->calle}</td>"
            ."\n  <td>{$Persona->numero}</td>"
            ."\n  <td>{$Persona->comuna}</td>"
            ."\n  <td>{$Persona->fono}</td>"
            ."\n  <td>{$Persona->celular}</td>"
            ."\n  <td>{$Persona->mail}</td>"
            ."\n  <td>{$Persona->estado_civil}</td>"
            ."\n  <td>{$Persona->numero_miembros_familia}</td>"
            ."\n  <td>{$Persona->nivel_educacional}</td>"
            ."\n  <td>{$Persona->ocupacion}</td>"
            ."\n </tr>";
        }
        $html .= "\n</table>";

        echo $html;
        echo HtmlHelper::endDocument();

    }


    public function editar( $Persona ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'calendar_stripped', 'calendar-es', 'calendar-setup', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        $Persona->FormatFields();

        $Persona = new PersonaModel;
        $Persona->Load('rut=?', array($Persona->rut));

        //$PersonaTipo = new PersonaTipoModel;
        //$PersonaTipo->Load('rut=?', array($Persona->Persona));


    ?>

    <form action="<?php echo WEB_PATH; ?>/Persona/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

    <div id="ajax_load" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Grabando...</div>
    <div id="live_search" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Buscando...</div>
    <div id="ajax_message"></div>

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
        <td>Rut(*)</td>
        <td>Nombres</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('rut', $Persona->rut, false, array('class' => 'required integer' )); ?></td>
        <td><?php echo FormHelper::inputText('nombres', $Persona->nombres, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Apellido Paterno</td>
        <td>Apellido Materno</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('apellido_paterno', $Persona->apellido_paterno, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('apellido_materno', $Persona->apellido_materno, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Sexo</td>
        <td>Fecha de Nacimiento</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('sexo', $Persona->sexo, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td><?php echo FormHelper::inputDateTime('fecha_nacimiento', $Persona->fecha_nacimiento, array('class' => 'required validate-date textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Fecha de Inscripci&oacute;n</td>
        <td>Tipo Calle</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputDateTime('fecha_inscripcion', $Persona->fecha_inscripcion, array('class' => 'required validate-date textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('tipo_calle', $Persona->tipo_calle, false, array('class' => 'validate-max-20 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Tipo Vivienda</td>
        <td>Calle </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('tipo_vivienda', $Persona->tipo_vivienda, false, array('class' => 'required validate-max-1 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('calle', $Persona->calle, false, array('class' => 'required validate-max-1 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>N&uacute;mero</td>
        <td>Block</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('numero', $Persona->numero, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('block', $Persona->block, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Piso</td>
        <td>N&uacute;mero Departamento</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('piso', $Persona->piso, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('numero_departamento', $Persona->numero_departamento, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Comuna </td>
        <td>Fono </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('comuna', $Persona->comuna, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('fono', $Persona->fono, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Celular </td>
        <td>Mail </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('celular', $Persona->celular, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('mail', $Persona->mail, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Estado Civil</td>
        <td>N&uacute;mero de mienbros de la Familia</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('estado_civil', $Persona->estado_civil, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('numero_miembros_familia', $Persona->numero_miembros_familia, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Nivel Educacional</td>
        <td>Ocupaci&oacute;n</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('nivel_educacional', $Persona->nivel_educacional, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('ocupacion', $Persona->ocupacion, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </fieldset>
    </form>
    <script>
    //FunFamilia.makeAutocompleteFields(['programa', 'Persona_tipo', 'usuario'], '<?php echo WEB_PATH; ?>/LiveSearch');
    /*<?php echo $this->codigo ? "$('codigo').disable();" : "";?>*/
    //$('codigo').disable();
    $('frmFormulario').focusFirstElement();
    </script>
	<?php
    }



    /**
	 * Enter description here...
	 *
	 * @param unknown_type $ProgramaEstado
	 */
    public function liveSearch($Persona) {
        echo "\n<ul>";
        foreach ($Persona as $Persona) {
            echo "\n <li>".($Persona->rut).""
            ."\n  <span class=\"informal\">"
            ."\n   <span class=\"name\">".$Persona->getNombreCompleto()."</span>"
            ."\n   <span style=\"display: none\">".$Persona->rut."</span>"
            ."\n  </span>"
            ."\n </li>";
        }
        echo "\n</ul>";
    }

}

?>
