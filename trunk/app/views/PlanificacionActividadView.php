<?php
/**
 * Objeto CentroFamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class PlanificacionActividadView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Actividad $Actividad
     */
    public function showAll($PlanificacionActividad) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'tablesort', 'scriptaculous', 'transparent_message'));
        echo HtmlHelper::includeCSSFiles(array('style.windows', 'niceforms'));
        echo HtmlHelper::endHeader();

        $buttons = '';

        if (AppHelper::canPlanificarActividad($_SESSION['ACL'])) {
            $buttons = HtmlHelper::imageButton('add_planificacionactividad', "onclick='parent.FunFamilia.openDialog(\"Actividad::Planificar\", \""
            .WEB_PATH."/PlanificacionActividad/editar/codigo=0\", {center: true, modal: false, height: 410});'");
        }

        echo HtmlHelper::commandButtonBar( $buttons );

        $CentroFamiliar = new CentroFamiliarModel;
        $Proyecto = new ProyectoModel;
        $ActividadEstado = new ActividadEstadoModel;

        $multi_centros = false;
        if (sizeof(explode(', ', $_SESSION['centros'])) > 1) {
            $multi_centros = true;
        }

        ?>
  	    <div id="ajax_info_message" style="display:none"><br /><p>Actualizando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>

        <fieldset>
	    <legend>Filtro de Búsqueda</legend>
	    <table width="100%">
	      <tr>
	        <?php if($multi_centros) echo "<td>Centro</td>"; ?>
	        <td>Proyecto</td>
	        <td>Programa</td>
	        <td>Estado</td>
	      </tr>
	      <tr>
	        <?php if($multi_centros) echo "<td>" . FormHelper::selectBox('centro_familiar', '', $CentroFamiliar->Find('codigo IN('.$_SESSION['centros'].') order by nombre'), 'codigo', 'nombre', true, array('class' => 'validate-selection selectArea', 'onChange' => 'findProyectos(this.value)')) . "</td>"; ?>
	        <td><div id="div-proyecto"><?php if($multi_centros) echo '<select id="proyecto" name="proyecto" class="validate-selection selectArea"><option></option></select>'; else echo FormHelper::selectBox('proyecto', '', $Proyecto->Find('centro_familiar IN('.$_SESSION['centros'].') order by nombre'), 'codigo', 'nombre', true, array('class' => 'validate-selection selectArea', 'onChange' => 'findProgramas(this.value)')); ?></div></td>
	        <td><div id="div-programa"><select id="programa" name="programa" class="validate-selection selectArea"><option></option></select></div></td>
	        <td><?php echo FormHelper::selectBox('estado', '', $ActividadEstado->Find('1=1 order by nombre'), 'codigo', 'nombre', true, array('class' => 'validate-selection selectArea', 'onChange' => 'findByEstado(this.value)')); ?></td>
	      </tr>
	     </table>
	     </fieldset>

	     <br />

        <?php

        $html = "<div id='div-list'>".self::getList($PlanificacionActividad)."</div>";

        echo $html;

        ?>
        <div id="leyenda-actividad-estado"><i>Leyenda:
        <?php
        foreach ($ActividadEstado->Find('1=1 ORDER BY codigo') as $ActividadEstado) {
            echo "&nbsp;&nbsp;<label style='".$ActividadEstado->style."'>".$ActividadEstado->nombre."</label>";
        }
        ?>
        </i></div>

        <script>
        parent.Windows.getFocusedWindow().setTitle('Planificación Actividad :: Listar');
        parent.Windows.getFocusedWindow().maximize();

        function findProyectos(centro) {
            new Ajax.Updater('div-proyecto', '<?php echo WEB_PATH; ?>/ListasDependientes', {
                parameters: { controller: 'proyecto', key: 'centro_familiar', value: centro, selected: '', extra_params: '{"class":"validate-selection selectArea", "onChange":"findProgramas(this.value)"}' },
                onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'div-list'}, showMode:null}); },
            });

            new Ajax.Updater('div-list', '<?php echo WEB_PATH; ?>/PlanificacionActividad/updateList', {
                parameters: { centro_familiar: $('centro_familiar').value, proyecto: $('proyecto').value, programa: $('programa').value, estado: $('estado').value },
                onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); }
            });
        }

        function findProgramas(proyecto) {
            new Ajax.Updater('div-programa', '<?php echo WEB_PATH; ?>/ListasDependientes', {
                parameters: { controller: 'programa', key: 'proyecto', value: proyecto, selected: '', extra_params: '{"class":"validate-selection selectArea", "onChange":"findActividades(this.value)"}' },
                onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'div-list'}, showMode:null}); },
            });

            new Ajax.Updater('div-list', '<?php echo WEB_PATH; ?>/PlanificacionActividad/updateList', {
                parameters: { proyecto: $('proyecto').value, programa: $('programa').value, estado: $('estado').value },
                onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); }
            });
        }

        function findActividades(programa) {
            new Ajax.Updater('div-list', '<?php echo WEB_PATH; ?>/PlanificacionActividad/updateList', {
                parameters: { proyecto: $('proyecto').value, programa: $('programa').value, estado: $('estado').value },
                onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'div-list'}, showMode:null}); },
                onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); }
            });
        }

        function findByEstado(estado) {
            new Ajax.Updater('div-list', '<?php echo WEB_PATH; ?>/PlanificacionActividad/updateList', {
                parameters: { proyecto: $('proyecto').value, programa: $('programa').value, estado: $('estado').value },
                onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'div-list'}, showMode:null}); },
                onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); }
            });
        }

        </script>
        <?php

        echo HtmlHelper::endDocument();

    }


    public function getList($PlanificacionActividad) {

        if (!sizeof($PlanificacionActividad)) {
            return ("<br /><h3 align='center'>No existen datos para el criterio de búsqueda seleccionado.</h3>");
        }

        $html = "<table class='sortable'>"
        ."\n <tr>"
        ."\n  <th>Ver/Editar</th>"
        ."\n  <th>Sesión</th>"
        ."\n  <th>Detalle Costos</th>"
        ."\n  <th>Estado</th>"
        ."\n  <th>Código</th>"
        ."\n  <th>Nombre Actividad</th>"
        ."\n  <th>Fecha Inicio</th>"
        ."\n  <th>Fecha Término</th>"
        ."\n  <th>Programa</th>"
        ."\n  <th>Responsable</th>"
        ."\n  <th>Costo</th>"
        ."\n </tr>";

        foreach ($PlanificacionActividad as $PlanificacionActividad) {

            $Programa = new ProgramaModel();
            $Programa->Load('codigo=?', array($PlanificacionActividad->programa));

            $Usuario = new UsuarioModel();
            $Usuario->Load('usuario=?', array($PlanificacionActividad->usuario));

            $ActividadEstado = new ActividadEstadoModel;
            $ActividadEstado->Load('codigo=?', array($PlanificacionActividad->estado));

            $ActividadResultado = new ActividadResultadoModel;
            $ActividadResultado->Load('codigo=?', array($PlanificacionActividad->actividad_resultado));

            $PlanificacionActividad->formatFields();
            $html .= "\n <tr style=\"".$ActividadEstado->style."\">"
            ."\n  <td><img style='cursor: pointer;' src='".WEB_PATH."/public/images/edit.png'
            onclick='parent.FunFamilia.openDialog(\"Planificación Actividad :: Editar\", \""
            .WEB_PATH."/PlanificacionActividad/editar/codigo={$PlanificacionActividad->codigo}\", "
            ."{center: true, modal: false, width: 740, height: 440});'
            /></td>";

            // Determina si el estado de la actividad permite modificar el listado de personas
            if (($ActividadEstado->codigo == 30 or $ActividadEstado->codigo == 50) and AppHelper::canCostos( $_SESSION['ACL'] )) {
                $html .= "\n <td><img style='cursor: pointer;' src='".WEB_PATH."/public/images/bookmark_folder.png'
                onclick='parent.FunFamilia.makeWindowSesion(\"{$PlanificacionActividad->codigo}\")'\", "
                ."{center: true, modal: false});' /></td>";
            }
            else {
                $html .= "\n <td></td>";
            }

            if (AppHelper::canCostos( $_SESSION['ACL'] )) {
                $html .= "\n  <td><img style='cursor: pointer;' src='".WEB_PATH."/public/images/lock.png'
                onclick='parent.FunFamilia.makeWindowCostos(\"{$PlanificacionActividad->codigo}\")'\", "
                ."{center: true, modal: true});' /></td>";
            }
            else {
                $html .= "\n <td></td>";
            }

            $html .= "\n  <td><div style='text-align: left;'>{$ActividadEstado->nombre}".($PlanificacionActividad->actividad_resultado?" ({$ActividadResultado->nombre})":"")."</div></td>"
            ."\n  <td>{$PlanificacionActividad->codigo}</td>"
            ."\n  <td><div style='text-align: left;'>{$PlanificacionActividad->nombre}</div></td>"
            ."\n  <td>{$PlanificacionActividad->fecha_inicio}</td>"
            ."\n  <td>{$PlanificacionActividad->fecha_termino}</td>"
            ."\n  <td><div style='text-align: left;'>{$Programa->nombre}</div></td>"
            ."\n  <td><div style='text-align: left;'>{$Usuario->getNombreCompleto()}</td>"
            ."\n  <td><div style='text-align: right;'>$".number_format($PlanificacionActividad->costo, 0, '', '.')."</div></td>"
            ."\n </tr>";
        }
        $html .= "\n</table></div>";

        return $html;
    }


    public function editar( $PlanificacionActividad ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'calendar_stripped', 'calendar-es', 'calendar-setup', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        $multi_centros = false;
        if (sizeof(explode(', ', $_SESSION['centros'])) > 1) {
            $multi_centros = true;
        }

        $Programa = new ProgramaModel;
        $Programa->Load('codigo=?', array($PlanificacionActividad->programa));

        $ActividadFormato = new ActividadFormatoModel;
        $ActividadFormato->Load('codigo=?', array($PlanificacionActividad->actividad_formato));

        $Proyecto = new ProyectoModel;
        $Proyecto->Load('codigo=?', array($Programa->proyecto));

        $CentroFamiliar = new CentroFamiliarModel;
        $CentroFamiliar->Load('codigo=?', array($Proyecto->centro_familiar));

        $Monitor = new MonitorModel;
        $Monitor->Load('usuario=?', array($PlanificacionActividad->usuario));

        $CentroFamiliar->FormatFields();
        $Proyecto->FormatFields();
        $Programa->FormatFields();
        $ActividadFormato->FormatFields();
        $Monitor->FormatFields();
        $PlanificacionActividad->FormatFields();
        $PlanificacionActividad->codigo = $PlanificacionActividad->codigo ? $PlanificacionActividad->codigo : 0;

        $centro_familiar_find = 'codigo IN('.$_SESSION['centros'].') order by nombre';
        $proyecto_find = 'centro_familiar IN('.$_SESSION['centros'].') order by nombre';
        $programa_find = "proyecto=".($Proyecto->codigo?$Proyecto->codigo:0);

        $PlanificacionActividad->descripcion = "";
        $rs = $PlanificacionActividad->DB()->Execute("select a.codigo, a.descripcion, a.usuario_modificacion, a.timestamp
                                                from actividad a
                                                where a.codigo = {$PlanificacionActividad->codigo}
                                                UNION
                                                select ah.codigo, ah.descripcion, ah.usuario_modificacion, ah.timestamp
                                                from actividad_historial ah
                                                where ah.codigo = {$PlanificacionActividad->codigo}
                                                order by timestamp desc");
        while ( ! $rs->EOF ) {
            $PlanificacionActividad->descripcion .= "\n(" . reverseDate($rs->fields["timestamp"]) . " - " . trim($rs->fields["usuario_modificacion"]) . ")"
            ."\n" . $rs->fields["descripcion"]."\n______________________________\n";

            $rs->MoveNext();
        }

        ?>

	    <form action="<?php echo WEB_PATH; ?>/PlanificacionActividad/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

	    <?php

	    $buttons = array();

	    if ($PlanificacionActividad->codigo and !$PlanificacionActividad->actividad_resultado) {
	        $buttons[] = HtmlHelper::imageButton('thesaurus', "onclick='parent.FunFamilia.openDialog(\"Thesaurus :: Listar\", \""
	        .WEB_PATH."/Thesaurus/ver/actividad_formato={$PlanificacionActividad->actividad_formato}/actividad={$PlanificacionActividad->codigo}\", {width: 300, height: 400, left: 1, top: 1});'");
	    }

	    if (($PlanificacionActividad->estado == 10 or $PlanificacionActividad->estado == 20) and (AppHelper::canAceptarActividad($_SESSION['ACL']) and AppHelper::canRechazarActividad($_SESSION['ACL']) and AppHelper::canObservarActividad($_SESSION['ACL']))) {
	        $buttons[] = HtmlHelper::imageButton('aceptar_actividad', 'onclick=\'AceptarActividad()\' id=\'btnAceptar\'');
	        $buttons[] = HtmlHelper::imageButton('rechazar_actividad', 'onclick=\'RechazarActividad()\' id=\'btnRechazar\'');
	        $buttons[] = HtmlHelper::imageButton('observar_actividad', 'onclick=\'ObservarActividad()\' id=\'btnObservar\'');
	    }

	    if ($PlanificacionActividad->estado == 60 and !$PlanificacionActividad->actividad_resultado) {
	        $buttons[] = HtmlHelper::imageButton('calificar_actividad_exitosa', 'onclick=\'CalificarActividad(10)\' id=\'btnCalificarExitosa\'');
	        $buttons[] = HtmlHelper::imageButton('calificar_actividad_no_exitosa', 'onclick=\'CalificarActividad(20)\' id=\'btnCalificarNoExitosa\'');
	        $buttons[] = HtmlHelper::imageButton('calificar_actividad_mejorable', 'onclick=\'CalificarActividad(30)\' id=\'btnCalificarMejorable\'');
	    }
	    elseif ($PlanificacionActividad->actividad_resultado) {
	        $ActividadResultado = new ActividadResultadoModel;
	        $ActividadResultado->Load('codigo=?', array($PlanificacionActividad->actividad_resultado));
	        $buttons[] = "Actividad calificada como \"".$ActividadResultado->nombre."\"";
	    }

	    if ($PlanificacionActividad->estado == 30 or $PlanificacionActividad->estado == 50) {
	        $buttons[] = '<div id="div-agregar-usuarios" style="display: none">'
	        . HtmlHelper::imageButton('add_planificacion_usuarios', "onclick='parent.FunFamilia.openDialog(\"Planificación Actividad :: Agregar Personas\", \""
	        .WEB_PATH."/PlanificacionActividad/addPersonas/codigo={$PlanificacionActividad->codigo}\", {center: true, modal: true, height: 200});'")
	        .'</div>';
	    }

	    if (AppHelper::canGrabarActividad($_SESSION['ACL']) and $PlanificacionActividad->estado != 60) {
	        $buttons[] = HtmlHelper::imageButton('save_all', 'onclick=\'FunFamilia.saveForm("frmFormulario")\'');
	    }

	    echo HtmlHelper::commandButtonBarForms( $buttons );
        ?>

	    <div id="ajax_info_message" style="display:none"><br /><p>Procesando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>
		<div id="transparent_ajax_error" style="display:none" class="transparent_ajax_message transparent_ajax_error"></div>
		<div id="transparent_ajax_notice" style="display:none" class="transparent_ajax_message transparent_ajax_notice"></div>

	    <div id="live_search" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Buscando...</div>

	    <fieldset>
	    <legend>Datos</legend>
	    <table width="100%" height="100%">
	      <?php if($multi_centros) { ?>
          <tr>
	        <td></td>
	        <td>Centro Familiar (*)</td>
	      </tr>
	      <tr>
	        <td></td>
	        <td><?php echo FormHelper::selectBox('centro_familiar', '', $CentroFamiliar->Find($centro_familiar_find), 'codigo', 'nombre', true, array('class' => 'validate-selection selectArea', 'onChange' => 'findProyectos(this.value)')); ?></td>
	      </tr>
	      <?php } ?>
	      <tr>
	        <td>Código (*)</td>
	        <td>Proyecto (*)</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('codigo', $PlanificacionActividad->codigo, false, array('class' => 'textinput' )); ?></td>
	        <td><div id="div-proyecto"><?php echo FormHelper::selectBox('proyecto', $Proyecto->nombre, $Proyecto->Find($proyecto_find), 'codigo', 'nombre', true, array('class' => 'validate-selection selectArea', 'onChange' => 'findProgramas(this.value)')); ?></div></td>
	      </tr>
	      <tr>
	        <td>Programa (*)</td>
	        <td>Actividad (*)</td>
	      </tr>
	      <tr>
	        <td><div id="div-programa"><?php echo FormHelper::selectBox('programa', $Programa->nombre, $Programa->Find($programa_find), 'codigo', 'nombre', true, array('class' => 'validate-selection selectArea', 'onChange' => 'findProgramas(this.value)')); ?></div></td>
	        <td><?php echo FormHelper::inputText('actividad_formato', $ActividadFormato->nombre, true, array('class' => 'required validate-max-255 textinput' )); ?></td>
	      </tr>
	      <tr>
	        <td>Nombre (*)</td>
	        <td>Monitor a cargo (*)</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('nombre', $PlanificacionActividad->nombre, false, array('class' => 'required validate-max-255 textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('monitor', $Monitor->getNombreCompleto(), true, array('class' => 'required validate-max-255 textinput' )); ?></td>
	      </tr>
	      <tr>
	        <td>Fecha de Inicio (*)</td>
	        <td>Fecha de Término (*)</td>
	      </tr>
	      <tr>
	        <td><?php
	        if ($PlanificacionActividad->estado < 20) {
	            echo FormHelper::inputDateTime('fecha_inicio', $PlanificacionActividad->fecha_inicio, array('class' => 'required validate-date textinput' ));
	        }
	        else {
	            echo FormHelper::inputText('fecha_inicio', $PlanificacionActividad->fecha_inicio, false, array('class' => 'textinput', 'disabled' => 'disabled' ));
	        }
	        ?></td>
	        <td><?php
	        if ($PlanificacionActividad->estado < 20) {
	            echo FormHelper::inputDateTime('fecha_termino', $PlanificacionActividad->fecha_termino, array('class' => 'required validate-date textinput' ));
	        }
	        else {
	            echo FormHelper::inputText('fecha_termino', $PlanificacionActividad->fecha_termino, false, array('class' => 'textinput', 'disabled' => 'disabled' ));
	        }
	        ?></td>
	      </tr>
	      <tr>
	        <td>Número de Sesiones (*)</td>
	        <td>Costo $ (*)</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('cantidad_sesiones_programadas', $PlanificacionActividad->cantidad_sesiones_programadas, false, array('class' => 'required validate-number textinput' )); ?></td>
	        <td><?php echo FormHelper::inputText('costo', $PlanificacionActividad->costo, false, array('class' => 'required validate-number textinput' )); ?></td>
	      </tr>
	      <tr>
	        <td>Observaciones (*)</td>
	        <td>Historial</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::textArea('descripcion', '', array('class' => 'textarea' )); ?></td>
	        <td><?php echo FormHelper::textArea('descripcion-historial', $PlanificacionActividad->descripcion, array('class' => 'textarea', 'readonly' => 'readonly' )); ?></td>
	      </tr>
	    </table>
	    <div id="info">Los campos marcados con (*) son requeridos.</div>
	    </fieldset>
        <?php echo FormHelper::inputHidden('actividad_tipo', ''); ?>
	    </form>
	    <script>
	    FunFamilia.makeAutocompleteFields(['actividad_formato', 'monitor'], '<?php echo WEB_PATH; ?>/LiveSearch');
	    $('codigo').disable();
	    $('frmFormulario').focusFirstElement();
	    parent.Windows.getFocusedWindow().maximize();

	    <?php
	    if ($ActividadFormato->actividad_tipo == 1 and ($PlanificacionActividad->estado == 30 or $PlanificacionActividad->estado == 50)) {
	        echo "$('div-agregar-usuarios').show()";
	    }
	    ?>

	    function findProyectos(centro) {
	        new Ajax.Updater('div-proyecto', '<?php echo WEB_PATH; ?>/ListasDependientes', {
	            parameters: { controller: 'proyecto', key: 'centro_familiar', value: centro, selected: '', extra_params: '{"class":"validate-selection selectArea", "onChange":"findProgramas(this.value)"}' },
	            onLoading: function(){ Element.show('live_search'); },
	            onComplete: function(transport){ Element.hide('live_search'); }
	        });

	    }

	    function findProgramas(proyecto) {
	        new Ajax.Updater('div-programa', '<?php echo WEB_PATH; ?>/ListasDependientes', {
	            parameters: { controller: 'programa', key: 'proyecto', value: proyecto, selected: '' },
	            onLoading: function(){ Element.show('live_search'); },
	            onComplete: function(transport){ Element.hide('live_search'); }
	        });
	    }

	    function AceptarActividad() {
	        new Ajax.Request('<?php echo WEB_PATH; ?>/PlanificacionActividad/aceptarActividad', {
	            parameters: { codigo: $F('codigo'), descripcion: $F('descripcion') },
	            onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'frmFormulario'}, showMode:null}); },
	            onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); transport.responseText.evalScripts(); }
	        });
	    }

	    function RechazarActividad() {
	        new Ajax.Request('<?php echo WEB_PATH; ?>/PlanificacionActividad/rechazarActividad', {
	            parameters: { codigo: $F('codigo'), descripcion: $F('descripcion') },
	            onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'frmFormulario'}, showMode:null}); },
	            onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); transport.responseText.evalScripts(); }
	        });
	    }

	    function ObservarActividad() {
	        new Ajax.Request('<?php echo WEB_PATH; ?>/PlanificacionActividad/observarActividad', {
	            parameters: { codigo: $F('codigo'), descripcion: $F('descripcion') },
	            onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'frmFormulario'}, showMode:null}); },
	            onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); transport.responseText.evalScripts(); }
	        });
	    }

	    function CalificarActividad(resultado) {
	        new Ajax.Request('<?php echo WEB_PATH; ?>/PlanificacionActividad/CalificarActividad', {
	            parameters: { codigo: $F('codigo'), resultado: resultado, descripcion: $F('descripcion') },
	            onLoading: function(){ TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'frmFormulario'}, showMode:null}); },
	            onComplete: function(transport){ TransparentMenu.hide('ajax_info_message'); transport.responseText.evalScripts(); }
	        });
	    }

	    /**
	    * Funcion para procesar los datos al seleccionar un campo del LiveSearch
	    */
	    function updateFieldsFromLiveSearch(element, selectedElement) {
	        if(element.id == 'actividad_formato') {
	            var oInfo = selectedElement.childNodes.item(1);
	            if(oInfo.childNodes.item(3).innerHTML.strip() == 1) {
	                if($('div-agregar-usuarios')) {$('div-agregar-usuarios').show()};
	                $('actividad_tipo').value = 1;
	            }
	            else {
	                if($('div-agregar-usuarios')) {$('div-agregar-usuarios').hide()};
	                $('actividad_tipo').value = 2;
	            }
	        }
	    }
    	    </script>
		<?php
    }


    public function addPersonas( $PlanificacionActividad ) {
        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'tablesort', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();
        ?>


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
	          <?php echo HtmlHelper::imageButton('save_all', 'onclick=\'parent.Windows.getFocusedWindow().close()\''); ?>
	         </div>
	        </td>
	      </tr>
	      <tr>
	        <td>Persona</td>
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td><?php echo FormHelper::inputText('persona', '', true, array('class' => 'textinput' )); ?></td>
	        <td>&nbsp;</td>
	      </tr>
	     </table>
   	    <form action="<?php echo WEB_PATH; ?>/PlanificacionActividad/guardarPersonas" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">
   	     <div id="div-personas"></div>
   	    </form>
	     <script>
	     FunFamilia.makeAutocompleteFields(['persona'], '<?php echo WEB_PATH; ?>/LiveSearch');
	     parent.Windows.getFocusedWindow().maximize();

	     function updateFieldsFromLiveSearch(element, selectedElement) {
	         if(element.id == 'persona') {
	             var oInfo = selectedElement.childNodes.item(1);
	             new Ajax.Updater('div-personas', '<?php echo WEB_PATH; ?>/PlanificacionActividad/updatePersonas/rut='+oInfo.childNodes.item(3).innerHTML.strip(), {
	                 parameters: { actividad: <?php echo $PlanificacionActividad->codigo?$PlanificacionActividad->codigo:0; ?> },
	                 onLoading: function(){ Element.show('live_search'); },
	                 onComplete: function(transport){ Element.hide('live_search'); new Effect.Highlight('div-personas'); }
	             });
	         }
	     }

	     function deletePersonas(actividad, rut) {
	         new Ajax.Updater('div-personas', '<?php echo WEB_PATH; ?>/PlanificacionActividad/deletePersona/', {
	             parameters: { actividad: <?php echo $PlanificacionActividad->codigo?$PlanificacionActividad->codigo:0; ?>, rut: rut },
	             onLoading: function(){ Element.show('live_search'); },
	             onComplete: function(transport){ Element.hide('live_search'); new Effect.Highlight('div-personas'); }
	         });
	     }

	     new Ajax.Updater('div-personas', '<?php echo WEB_PATH; ?>/PlanificacionActividad/updatePersonas/rut=0', {
	         parameters: { actividad: <?php echo $PlanificacionActividad->codigo?$PlanificacionActividad->codigo:0; ?> },
	         onLoading: function(){ Element.show('live_search'); },
	         onComplete: function(transport){ Element.hide('live_search'); new Effect.Highlight('div-personas'); }
	     });
        </script>

        <?php
        echo HtmlHelper::endDocument();

    }


    public function updatePersonas( $Personas, $actividad=0 ) {

        echo "\n<table class='sortable'>"
        ."\n <tr>"
        ."\n  <th></th>"
        ."\n  <th>Rut</th>"
        ."\n  <th>Nombre</th>"
        ."\n </tr>"
        ;

        foreach ($Personas as $Persona) {
            echo "\n <tr id='persona-{$Persona->rut}'>"
            ."\n  <td><img style='cursor: pointer;'
            src='".WEB_PATH."/public/images/remove.png'
            onclick='deletePersonas(\"{$actividad}\", \"{$Persona->rut}\")'\", "
            ."{center: true, modal: true});'
            /></td>"
            ."\n  <td>{$Persona->rut}</td>"
            ."\n  <td>{$Persona->getNombreCompleto()}</td>"
            ."\n </tr>";
        }
        echo "\n</table>";
    }

}

