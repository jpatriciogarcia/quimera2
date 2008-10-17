<?php
/**
 * Objeto IndexController.
 *
 * En este archivo se define la clase controladora para el Index.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class HtmlHelper extends AppHelper {

    public static function startHeader() {
        return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\""
        ." \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"
        ."\n<html xmlns=\"http://www.w3.org/1999/xhtml\">"
        ."\n<head>"
        ."\n <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />"
        ."\n <title>Fundaci&oacute;n de la Familia</title>"
        ."\n <link rel='shortcut icon' href='" . WEB_PATH . "/public/images/favicon.ico'>";
    }


    public static function endHeader() {
        return "\n </header>\n <body>";
    }


    public static function includeJSFiles( $files = array() ) {
        $html = "";
        foreach ($files as $file) {
            $html .= "\n <script type=\"text/javascript\" src=\"".WEB_PATH
            ."/public/js/{$file}.js\"></script>";
        }
        return $html;
    }


    public static function includeCSSFiles( $files = array() ) {
        $html = "";
        foreach ($files as $file) {
            $html .= "\n <link href=\"".WEB_PATH."/public/css/{$file}.css\" "
            ."rel=\"stylesheet\" type=\"text/css\" />";
        }
        return $html;
    }

    public static function endDocument() {
        return "\n </body>\n</html>";
    }


    public function imageButton( $button, $params='' ) {
        switch ( $button ) {
            case 'save_all':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/save_all.png' />Guardar</div>";
                        break;
            case 'restore_password':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/mail_reply.png' />Enviar</div>";
                        break;
            case 'find':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/find.png' />Buscar</div>";
                        break;
            case 'add_user':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Usuario</div>";
                        break;
            case 'add_persona':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Persona</div>";
                        break;
            case 'add_centro':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Centro Familiar</div>";
                        break;
            case 'add_programa':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Programa</div>";
                        break;
            case 'add_actividad':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Actividad</div>";
                        break;
            case 'add_grupo':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Grupo</div>";
                        break;
            case 'add_grupo_modulo':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Privilegio</div>";
                        break;
            case 'add_monitor':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Monitor</div>";
                        break;
            case 'add_proyecto':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Proyecto</div>";
                        break;
            case 'add_planificacionactividad':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Planificar Actividad</div>";
                        break;
            case 'add_modulo':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Módulo</div>";
                        break;
            case 'add_actividadformato':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Formato Actividad</div>";
                        break;
            case 'add_planificacion_usuarios':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add_group.png' />Agregar Personas</div>";
                        break;
            case 'add_costo':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/add.png' />Agregar Costo</div>";
                        break;
            case 'export_to_pdf':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/acroread.png' />PDF</div>";
                        break;
            case 'export_to_xls':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/ooo-calc.png' />OpenOffice Calc</div>";
                        break;
            case 'aceptar_actividad':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/aceptar.png' />Aprobar</div>";
                        break;
            case 'rechazar_actividad':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/rechazar.png' />Rechazar</div>";
                        break;
            case 'observar_actividad':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/info.png' />Observar</div>";
                        break;
            case 'buscar_datos_monitor':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/viewrow.png' /> Buscar</div>";
                        break;
            case 'buscar_ActividadEstadoNueva':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/viewrow.png' /> Buscar</div>";
                        break;
            case 'buscar_PersonaPorActividad':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/viewrow.png' /> Buscar</div>";
                        break;
            case 'buscar_DinerosPorActividad':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/viewrow.png' /> Buscar</div>";
                        break;
            case 'buscar_SeguimientoPersonas':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/viewrow.png' /> Buscar</div>";
                        break;
            case 'buscar_TotalCostosActividadPorFormato':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/viewrow.png' /> Buscar</div>";
                        break;
           	case 'buscar_Personas':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/viewrow.png' /> Buscar</div>";
                        break;

           	case 'calificar_actividad_exitosa':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/presence_online.png' /> Exitosa</div>";
                        break;
           	case 'calificar_actividad_no_exitosa':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/presence_offline.png' /> No Exitosa</div>";
                        break;
           	case 'calificar_actividad_mejorable':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/presence_away.png' /> Mejorable</div>";
                        break;
           	case 'busca_personas_centro_familiar':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/presence_away.png' /> Mejorable</div>";
                        break;
            case 'busca_total_nacional_personas_participantes':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/presence_away.png' /> Mejorable</div>";
                        break;
            case 'thesaurus':
                return "<div
                        {$params}
                        class='button'
                        style='cursor: pointer; '>
                        <img src='".WEB_PATH.
                        "/public/images/folder_applications.png' /> Thesaurus</div>";
                        break;


        }
    }


    public function commandButtonBar( $extraButtons='' ) {
    ?>
    <div id="command-button-bar">
     <img onclick="javascript:history.back();" style="cursor: pointer" src='<?php echo WEB_PATH; ?>/public/images/back.png' />
     <img onclick="javascript:history.forward();" style="cursor: pointer" src='<?php echo WEB_PATH; ?>/public/images/forward.png' />
     <img onclick="javascript:window.location.href='index.php?<?php echo $_SERVER['QUERY_STRING']; ?>'" style="cursor: pointer" src='<?php echo WEB_PATH; ?>/public/images/reload.png' />
     <div style="position: absolute; right: 10px; top: 8px; "><?php echo $extraButtons; ?></div>
    </div>
    <?php
    }

    public function commandButtonBarForms( $extraButtons=array() ) {
    ?>
    <div id="command-button-bar" style="height: 22px;">
     <div style="position: absolute; right: 10px; top: 8px; ">
      <table>
      <?php
      echo "<table>";
      foreach ($extraButtons as $v) {
          echo "<td>$v</td>";
      }
      echo "</table>";
      ?></div>
    </div>
    <?php
    }

}

?>