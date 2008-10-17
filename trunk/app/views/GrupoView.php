<?php
/**
 * Objeto GrupoView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class GrupoView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::Grupo
     *
     * @param Grupo $Grupo
     */
    public function showAll($Grupo) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        HtmlHelper::imageButton('add_grupo', "onclick='parent.FunFamilia.openDialog(\"Grupo::Agregar\", \""
        .WEB_PATH."/Grupo/editar/codigo=0\", "
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
        ."\n  <th>Descripci&oacute;n</th>"
        ."\n </tr>";

        foreach ($Grupo as $Grupo) {
            $html .= "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Grupo::Editar\", \""
            .WEB_PATH."/Grupo/editar/codigo={$Grupo->codigo}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>";

            if ($Grupo->codigo >= 100) {
                $html .= "<img style='cursor: pointer;'
                src='".WEB_PATH."/public/images/remove.png' "
                ."onclick='parent.FunFamilia.makeWindowDeleteGrupo(\"{$Grupo->codigo}\")'\", "
                ."{center: true, modal: true});' />";
            }

            $html .= "</td>"
            ."\n  <td>{$Grupo->codigo}</td>"
            ."\n  <td>{$Grupo->grupo}</td>"
            ."\n  <td>{$Grupo->descripcion}</td>"
            ."\n </tr>";
        }
        $html .= "\n</table>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Actividad :: Listar');
        </script>";

        echo $html;
        echo HtmlHelper::endDocument();

    }


    public function editar( $Grupo ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        $Grupo->FormatFields();

        /*
        $Programa = new ProgramaModel;
        $Programa->Load('codigo=?', array($Grupo->programa));

        $GrupoTipo = new GrupoTipoModel;
        $GrupoTipo->Load('codigo=?', array($Grupo->actividad_tipo));
        */

    ?>

    <form action="<?php echo WEB_PATH; ?>/Grupo/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

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
        <td>Nombre</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('codigo', $Grupo->codigo, false, array('class' => 'textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('grupo', $Grupo->grupo, false, array('class' => 'validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Descripci&oacute;n</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::textArea('descripcion', $Grupo->descripcion, array('class' => 'textarea' )); ?></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Usuario Disponibles</td>
        <td>Usuarios pertenecientes al grupo</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo self::listUsuariosDisponibles($this->UsuariosDisponibles); ?></td>
        <td><?php echo self::listUsuariosPertenecientes($this->UsuariosPertenecientes); ?></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </fieldset>
    </form>
    <script>
    $('codigo').disable();
    $('frmFormulario').focusFirstElement();

    Sortable.create("list-disponibles",
    {dropOnEmpty:true,containment:["list-disponibles","list-pertenecientes"],constraint:false});
    Sortable.create("list-pertenecientes",
    {dropOnEmpty:true,containment:["list-disponibles","list-pertenecientes"],constraint:false});
	</script>

	<?php
    }



    /**
	 * Enter description here...
	 *
	 * @param array $Obj
	 * @return string
	 */
    public function listUsuariosDisponibles( Array $Obj ) {
        $return = "\n<ul class='sortable textarea' id='list-disponibles'>";
        foreach ($Obj as $GrupoLogin) {
            $return .= "\n <li class='green' id='{$this->codigo}_{$GrupoLogin['usuario']}'>{$GrupoLogin['usuario']}</li>";
        }
        $return .= "\n</ul>";
        return $return;
    }


    public function listUsuariosPertenecientes( Array $Obj ) {
        $return = "\n<ul class='sortable textarea' id='list-pertenecientes'>";
        foreach ($Obj as $GrupoLogin) {
            $return .= "\n <li class='green' id='{$this->codigo}_{$GrupoLogin['usuario']}'>{$GrupoLogin['usuario']}</li>";
        }
        $return .= "\n</ul>";
        return $return;
    }


}

?>