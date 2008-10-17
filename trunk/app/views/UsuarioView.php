<?php
/**
 * Objeto UsuarioView.
 *
 * En este archivo se define la clase para la presentacion del usuario.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class UsuarioView {

    /**
     * Lista todos los usuarios a partir de un objeto ActiveRecord::Usuario
     *
     * @param Usuario $Usuario
     */
    public function showAll($Usuario) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort'));
        echo HtmlHelper::includeCSSFiles(array('style.windows'));
        echo HtmlHelper::endHeader();
        echo HtmlHelper::commandButtonBar(
        HtmlHelper::imageButton('add_user', "onclick='parent.FunFamilia.openDialog(\"Usuario::Agregar\", \""
        .WEB_PATH."/Usuario/editar/usuario=\", "
        ."{center: true, modal: true});'")
        );

        $html = "

        <br />

        <table class='sortable'>"
        ."\n <tr>"
        ."\n  <th></th>"
        ."\n  <th></th>"
        ."\n  <th>Usuario</th>"
        ."\n  <th>Nombre</th>"
        ."\n  <th>Inicio sesión</th>"
        ."\n  <th>Fin sesión</th>"
        ."\n  <th>Último acceso</th>"
        ."\n  <th>Origen</th>"
        ."\n  <th>Bloqueado</th>"
        ."\n </tr>";

        foreach ($Usuario as $Usuario) {
            $Usuario->FormatFields();
            $html .= "\n <tr>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Usuario::Editar\", \""
            .WEB_PATH."/Usuario/editar/usuario={$Usuario->usuario}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='parent.FunFamilia.makeWindowDeleteUsuario(\"{$Usuario->usuario}\")'\", "
            .WEB_PATH."/Usuario/editar/usuario={$Usuario->usuario}\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>{$Usuario->usuario}</td>"
            ."\n  <td>{$Usuario->nombres} {$Usuario->apellido_paterno} {$Usuario->apellido_materno}</td>"
            ."\n  <td>{$Usuario->inicio_sesion}</td>"
            ."\n  <td>{$Usuario->fin_sesion}</td>"
            ."\n  <td>{$Usuario->ultimo_acceso}</td>"
            ."\n  <td>{$Usuario->origen}</td>"
            ."\n  <td>{$Usuario->bloqueado}</td>"
            ."\n </tr>";
        }
        $html .= "\n</table>";

        echo $html;
        echo HtmlHelper::endDocument();

    }


    public function edit( $Usuario ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'typecast', 'typecast.config', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        $Usuario->FormatFields();

        $checked = $Usuario->bloqueado ? 'checked' : '';
        $required = $Usuario->usuario ? false : true;

        $CentroFamiliar = new CentroFamiliarModel;
        $CentroFamiliarUsuario = new CentroFamiliarUsuarioModel;
        $centros = array();

        foreach ($CentroFamiliarUsuario->Find('usuario=?', array($Usuario->usuario)) as $CentroFamiliarUsuario) {
            $CentroFamiliar->Load('codigo=?', array($CentroFamiliarUsuario->centro_familiar));
            $centros[] = $CentroFamiliar->nombre;
        }

	?>

	    <form action="<?php echo WEB_PATH; ?>/Usuario/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

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
	        <td>Usuario</td>
	        <td>Bloqueado</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('usuario', $Usuario->usuario, false, array('class' => 'required validate-max-255 textinput' )); ?></td>
	        <td><?php echo FormHelper::inputCheckbox('bloqueado', '', $checked, array('class' => 'checkbox')); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Contraseña</td>
	        <td>Repita Contraseña</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputPassword('clave', '', false, array('class' => 'validate-password textinput' )); ?></td>
	        <td><?php echo FormHelper::inputPassword('clave-confirm', '', false, array('class' => 'validate-password-confirm textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Rut ej. 12345678-9</td>
	        <td>Nombres</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('rut', $Usuario->getFormatRut(), false, array('class' => 'required validate-rut textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('nombres', $Usuario->nombres, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Apellido Paterno</td>
	        <td>Apellido Materno</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('apellido_paterno', $Usuario->apellido_paterno, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('apellido_materno', $Usuario->apellido_materno, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Dirección</td>
	        <td>Teléfono</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('direccion', $Usuario->direccion, false, array('class' => 'required validate-max-80 textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('telefono', $Usuario->telefono, false, array('class' => 'required validate-digits textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Celular</td>
	        <td>Mail</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('celular', $Usuario->celular, false, array('class' => 'required validate-digits textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('mail', $Usuario->mail, false, array('class' => 'required validate-email textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>Centros</td>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::selectBoxMultiple('centros', $centros, $CentroFamiliar->Find('1=1'), 'codigo', 'nombre', false) ?></td>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
	      </tr>
	    </table>
	    </fieldset>
	    </form>

	    <script>
	    Validation.addAllThese([
	    ['validate-password', 'La clave debe contener por lo menos 6 caracteres y no ser igual al usuario', {
	        <?php echo $required ? 'minLength : 6,' : ''; ?>
	        //notOneOf : ['password','PASSWORD','1234567','0123456'],
	        notEqualToField : 'usuario'
	    }],
	    ['validate-password-confirm', 'Las claves no coinciden.', {
	        equalToField : 'clave'
	    }]
	    ]);

	    $('frmFormulario').focusFirstElement();
		</script>

	    <?php
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $Comuna
	 */
    public function liveSearch($Usuario) {
        echo "<ul>";
        foreach ($Usuario as $Usuario) {
            echo "<li>".($Usuario->getNombreCompleto())."</li>";
        }
        echo "</ul>";
    }




    public function recordarPassword() {
        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'typecast', 'typecast.config', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

	?>

	    <form action="<?php echo WEB_PATH; ?>/Usuario/recordarPassword" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

	    <div id="ajax_info_message" style="display:none"><br /><p>Procesando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>
		<div id="transparent_ajax_error" style="display:none" class="transparent_ajax_message transparent_ajax_error"></div>
		<div id="transparent_ajax_notice" style="display:none" class="transparent_ajax_message transparent_ajax_notice"></div>

	    <div id="live_search" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Buscando...</div>

	    <fieldset>
	    <legend>Datos</legend>
	    <table width="100%" height="100%">
	      <tr>
	    	<td>&nbsp;</td>
	        <td>
	         <div align="right">
	          <?php echo HtmlHelper::imageButton('restore_password', 'onclick=\'FunFamilia.saveForm("frmFormulario")\''); ?>
	         </div>
	        </td>
	      </tr>
	      <tr>
	        <td>Usuario</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('usuario', '', false, array('class' => 'required validate-max-255 textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>E-Mail</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('mail', '', false, array('class' => 'required validate-email textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	    </table>
	    </fieldset>
	    </form>

	    <script>
	    $('frmFormulario').focusFirstElement();
		</script>

	    <?php

    }


    public function newPassword( $Usuario ) {
        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'typecast', 'typecast.config', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        if ( ! $Usuario->usuario ) {
            die('<h1>El enlace no está disponible</h1>');
        }

	?>

	    <form action="<?php echo WEB_PATH; ?>/Usuario/reestablecerPassword" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

	    <div id="ajax_info_message" style="display:none"><br /><p>Procesando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>
		<div id="transparent_ajax_error" style="display:none" class="transparent_ajax_message transparent_ajax_error"></div>
		<div id="transparent_ajax_notice" style="display:none" class="transparent_ajax_message transparent_ajax_notice"></div>

	    <div id="live_search" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Buscando...</div>

	    <fieldset>
	    <legend>Reestablecer la contraseña</legend>
	    <table width="100%" height="100%">
	      <tr>
	    	<td>&nbsp;</td>
	        <td>
	         <div align="right">
	          <?php echo HtmlHelper::imageButton('save_all', 'onclick=\'FunFamilia.saveForm("frmFormulario")\''); ?>
	         </div>
	        </td>
	      </tr>
	      <tr>
	        <td>Nueva contraseña</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputPassword('clave', '', false, array('class' => 'validate-password textinput' )); ?></td>
	        <td><?php echo FormHelper::inputHidden('usuario', $Usuario->usuario); ?></td>
	      </tr>
	      <tr>
	        <td>Repita nueva contraseña</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputPassword('clave-confirm', '', false, array('class' => 'validate-password-confirm textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	    </table>
	    </fieldset>
	    </form>

	    <script>
	    Validation.addAllThese([
	    ['validate-password', 'La contraseña debe contener por lo menos 6 caracteres y no ser igual al usuario', {
	        minLength : 6,
	        //notOneOf : ['<?php echo $Usuario->usuario; ?>'],
	        notEqualToField : 'usuario'
	    }],
	    ['validate-password-confirm', 'Las contraseñas no coinciden.', {
	        equalToField : 'clave'
	    }]
	    ]);

	    $('frmFormulario').focusFirstElement();
		</script>

	    <?php

    }
}

?>