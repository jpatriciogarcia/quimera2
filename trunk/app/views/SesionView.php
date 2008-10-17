<?php
/**
 * Objeto SesionView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class SesionView {

    public function editar( $Sesion ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'calendar_stripped', 'calendar-es', 'calendar-setup', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms', 'aqua/theme'));
        echo HtmlHelper::endHeader();

        $Actividad = $Sesion['obj'];

        ?>

        <form action="<?php echo WEB_PATH; ?>/Sesion/guardar" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

        <div id="ajax_info_message" style="display:none"><br /><p>Procesando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>
    	<div id="transparent_ajax_error" style="display:none" class="transparent_ajax_message transparent_ajax_error"></div>
    	<div id="transparent_ajax_notice" style="display:none" class="transparent_ajax_message transparent_ajax_notice"></div>

        <div id="live_search" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Buscando...</div>

        <?php
        echo FormHelper::inputHidden('actividad', $Actividad->codigo);
        ?>

        <fieldset>
        <legend>Datos</legend>
        <table class="sortable">
    	 <tr>
    	  <?php
    	  foreach ($Sesion['header'] as $v) {
    	      echo "\n  <th>{$v}</th>";
    	  }
    	  ?>

    	  <th>
    	   <div align="right">
           <?php echo HtmlHelper::imageButton('save_all', 'onclick=\'FunFamilia.saveForm("frmFormulario")\''); ?>
           </div>
    	  </th>
    	  </tr>

    	  <?php

    	  // Para verificar los dias que ya se ha pasado asistencia y los dias en los cuales aun no es posible pasar asistencia
    	  $asistencias = array();
    	  foreach ($Sesion['body'] as $v) {
    	      foreach ($v as $kk => $vv) {
    	          if ($kk > 0 and $vv != '') {
    	              $asistencias[] = $kk;
    	          }
    	      }
    	  }

    	  $asistencias = array_unique($asistencias);
    	  if (sizeof($asistencias)) {
    	      $actual = max($asistencias)+1;
    	  }
    	  else {
    	      $actual = 1;
    	  }

    	  // Body
    	  foreach ($Sesion['body'] as $k => $v) {
    	      echo "\n <tr>";
    	      foreach ($v as $kk => $vv) {
    	          if ($kk===0) {
    	              echo "\n  <th>{$vv}</th>";
    	          }
    	          else {

    	              $params = array();
    	              if (in_array($kk, $asistencias) or $kk > $actual) {
    	                  $params = array('disabled' => 'disabled');
    	              }

    	              echo "\n  <td>";
    	              echo FormHelper::inputCheckbox('chk_'.$k.'_'.$kk, '', ($vv?'checked':''), $params);
    	              echo "</td>";
    	          }
    	      }
    	      echo "\n  <td></td>";
    	      echo "\n </tr>";
    	  }


    	  // Footer
    	  if (isset($k)) {
    	      echo "\n <tr>";
    	      foreach ($Sesion['body'][$k] as $kk => $vv) {
    	          if ($kk===0) {
    	              echo "\n  <th>Fecha</th>";
    	          }
    	          else {
    	              $params = array();
    	              echo "\n  <td>";

    	              $date = explode(" ", $Sesion['date']['fecha_'.$kk]);
    	              $date = reverseDate($date[0]);

    	              if (in_array($kk, $asistencias) or $kk > $actual) {
    	                  $params = array('disabled' => 'disabled');
    	                  echo FormHelper::inputTextDate('fecha_'.$kk, $date, array('disabled' => 'disabled date' ));
    	              }
    	              else {
    	                  echo FormHelper::inputDate('fecha_'.$kk, $date, array('class' => 'required validate-date date' ));
    	              }
    	              echo "</td>";
    	          }
    	      }
    	      echo "\n  <td></td>";
    	      echo "\n </tr>";
    	  }

  		  ?>
        </table>

        </fieldset>
        </form>
        <script>
        parent.Windows.getFocusedWindow().maximize();
        </script>
    	<?php
    }



    /**
	 * Enter description here...
	 *
	 * @param unknown_type $Sesion
	 */
    public function liveSearch($Sesion) {
        echo "<ul>";
        foreach ($Sesion as $Sesion) {
            echo "<li>".($Sesion->nombre).""
            ."<span class=\"informal\">"
            ."</span>"
            ."</li>";
        }
        echo "</ul>";
    }



}

?>
