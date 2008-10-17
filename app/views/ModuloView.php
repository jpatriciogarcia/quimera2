<?php
/**
 * Objeto UsuarioView.
 *
 * En este archivo se define la clase para la presentacion del usuario.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class ModuloView {


    /**
	 * Genera los iconos para los modulos
	 *
	 * @param Modulo $Modulo
	 */
    public function makeMenu( $Modulo ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeCSSFiles(array('style.windows', 'validation'));
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'dragdrop'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar();

        $i = 0;
        echo "\n<table cellspacing='10px'>\n  <tr>";

        foreach ( $Modulo as $Modulo ) {

            echo "\n   <td>";
            echo "\n    <div class='button' id='{$Modulo->codigo}' style='cursor: pointer; '>"
            . "\n      <img "
            ."onclick=\"location.href='" . WEB_PATH . ($Modulo->url?$Modulo->url:"/Modulo/makeMenu/".$Modulo->nombre."/") . "'\" "
            ."src='" . WEB_PATH . "/public/images/" . $Modulo->imagen . "' />"
            . "<br />" . $Modulo->descripcion . "\n    </div>";
            echo "\n   </td>";

            $i++;

            if ( $i == 3 ) {
                $i = 0;
                echo "\n  </tr>\n  <tr>";
            }

            echo "<script>
            new Draggable('{$Modulo->codigo}', {zindex: 99999});</script>";

        }
        echo "</table>";

        if ($Modulo->modulo) {
            $Modulo->Load('codigo=?', array($Modulo->modulo));
            echo "<script>parent.Windows.getFocusedWindow().setTitle('".$Modulo->descripcion."');</script>";
        }

        echo HtmlHelper::endDocument();
    }



    /**
     * Lista todos los modulos a partir de un objeto
     * ActiveRecord::Modulo
     *
     * @param Actividad $Actividad
     */
    public function showAll($Modulo) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        HtmlHelper::imageButton('add_modulo', "onclick='parent.FunFamilia.openDialog(\"Módulo::Agregar\", \""
        .WEB_PATH."/Modulo/editar/codigo=0\", "
        ."{center: true, modal: true});'")
        );

        $html = "
        <br />

        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th></th>"
        ."\n  <th></th>"
        ."\n  <th>C&oacute;digo</th>"
        ."\n  <th>Padre</th>"
        ."\n  <th>Nombre</th>"
        ."\n  <th>URL</th>"
        ."\n  <th>Dock</th>"
        ."\n  <th>Imagen</th>"
        ."\n </tr>";

        foreach ($Modulo as $Modulo) {

            $Modulo->subString();

            $Padre = new ModuloModel;
            if ($Modulo->modulo) {
                $Padre->Load('codigo=?', array($Modulo->modulo));
            }

            $html .= "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Módulo::Editar\", \""
            .WEB_PATH."/Modulo/editar/codigo={$Modulo->codigo}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeleteModulo(\"{$Modulo->codigo}\")'\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>{$Modulo->codigo}</td>"
            ."\n  <td>{$Padre->descripcion}</td>"
            ."\n  <td>{$Modulo->descripcion}</td>"
            ."\n  <td>" . $Modulo->url . "</td>"
            ."\n  <td>" . ($Modulo->dock=='t'?"SI":"NO") . "</td>"
            ."\n  <td><img width='24px' height='24px' src='" . WEB_PATH . "/public/images/" . $Modulo->imagen . "' /></td>"
            ."\n </tr>";
        }
        $html .= "\n</table>
        <script>
        parent.Windows.getFocusedWindow().setTitle('Módulos :: Listar');
        </script>";

        echo $html;
        echo HtmlHelper::endDocument();

    }



    /**
	 * Genera un formulario para Agregar/Editar un módulo
	 *
	 * @param Modulo $Modulo
	 */
    public function editar( ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms',
        'transparent_message', 'calendar_stripped', 'calendar-es', 'calendar-setup', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        $this->FormatFields();

        $ModuloPadre = new ModuloModel;
        if ($this->modulo) {
            $ModuloPadre->Load('codigo=?', array($this->modulo));
        }

        $checked = $this->dock == 't' ? 'checked' : '';

    ?>

    <form action="<?php echo WEB_PATH; ?>/Modulo/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

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
        <td>M&oacute;dulo (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('codigo', $this->codigo, false, array('class' => 'textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('modulo', $ModuloPadre->descripcion, true, array('class' => 'validate-max-255 textinput' )); ?></td>
        <td><?php echo FormHelper::inputHidden('modulo_codigo', $ModuloPadre->codigo); ?></td>
      </tr>
      <tr>
        <td>Nombre (*)</td>
        <td>Descripci&oacute;n (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('nombre', $this->nombre, false, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('descripcion', $this->descripcion, false, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>URL (*)</td>
        <td>Imagen (*)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputText('url', $this->url, false, array('class' => 'textinput' )); ?></td>
        <td><?php echo FormHelper::inputText('imagen', $this->imagen, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Dock men&uacute;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><?php echo FormHelper::inputCheckbox('dock', 'Es dock menú?', $checked); ?></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </fieldset>
    </form>
    <script>

    /**
    * Funcion para procesar los datos al seleccionar un campo del LiveSearch
    */
    function updateFieldsFromLiveSearch(element, selectedElement) {
        if(element.id == 'modulo') {
            var oInfo = selectedElement.childNodes.item(1);
            $('modulo_codigo').value = oInfo.childNodes.item(3).innerHTML.strip();
        }
    }

    FunFamilia.makeAutocompleteFields(['modulo', 'imagen'], '<?php echo WEB_PATH; ?>/LiveSearch');
    $('codigo').disable();
    $('frmFormulario').focusFirstElement();
    </script>
	<?php
    }




    /**
	 * deprecated...
	 *
	 */
    public function index() {
        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeCSSFiles(array('style.windows', 'validation'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar();
    ?>
    <table>
     <tr>
      <td><?php echo HtmlHelper::imageButton('configuracion'); ?></td>
      <td><?php echo HtmlHelper::imageButton('planificacion'); ?></td>
      <td><?php echo HtmlHelper::imageButton('reporte'); ?></td>
     </tr>
    </table>
    <?php
    echo HtmlHelper::endDocument();
    }



    /**
	 * deprecated...
	 *
	 */
    public function setting() {
        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar();
    ?>
    <table>
     <tr>
      <td><?php echo HtmlHelper::imageButton('centro_familiar'); ?></td>
      <td><?php echo HtmlHelper::imageButton('usuario'); ?></td>
      <td><?php echo HtmlHelper::imageButton('grupo'); ?></td>
     </tr>
     <tr>
      <td><?php echo HtmlHelper::imageButton('programa'); ?></td>
      <td><?php echo HtmlHelper::imageButton('actividad'); ?></td>
      <td><?php echo HtmlHelper::imageButton('monitor'); ?></td>
     </tr>
    </table>
    <?php
    echo HtmlHelper::endDocument();
    }



    public function liveSearch($Modulo) {
        echo "\n<ul>";
        foreach ($Modulo as $Modulo) {
            $Parent = new ModuloModel;
            $Parent->descripcion = "";
            if ($Modulo->modulo) {
                $Parent->Load('codigo=?', array($Modulo->modulo));
            }

            echo "\n <li>".($Modulo->descripcion).""
            ."\n  <span class=\"informal\">"
            ."\n  <span class=\"name\">(".($Parent->descripcion?$Parent->descripcion:"raíz").")</span>"
            ."\n  <span style=\"display:none;\">" . $Modulo->codigo . "</span>"
            ."\n  </span>"
            ."\n </li>";
        }
        echo "\n</ul>";
    }


}

?>