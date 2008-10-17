<?php
/**
 * Objeto SesionView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class CostosView {

    public function editar( $Actividad, $Costos ) {

        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'scriptaculous', 'validation', 'niceforms', 'transparent_message', 'typecast', 'typecast.config', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('validation', 'style.windows', 'livesearch', 'niceforms'));
        echo HtmlHelper::endHeader();

        ?>

        <form action="<?php echo WEB_PATH; ?>/Costos/updateList" method="post" enctype="application/x-www-form-urlencoded" name="frmFormulario" id="frmFormulario">

        <div id="ajax_info_message" style="display:none"><br /><p>Procesando<br/><img src="<?php echo WEB_PATH; ?>/public/images/progress.gif" /></p></div>
    	<div id="transparent_ajax_error" style="display:none" class="transparent_ajax_message transparent_ajax_error"></div>
    	<div id="transparent_ajax_notice" style="display:none" class="transparent_ajax_message transparent_ajax_notice"></div>

        <div id="live_search" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Buscando...</div>

        <?php echo FormHelper::inputHidden('actividad', $Actividad->codigo); ?>

        <fieldset>
        <legend>Costos de la Actividad</legend>
        <table>
         <tr>
          <th>N° Documento (*)</th>
          <td><?php echo FormHelper::inputText('numero_documento', '', false, array('class' => 'required validate-number validate-max-10 textinput' )); ?></td>
          <td rowspan="6" valign="baseline"><?php echo HtmlHelper::imageButton('add_costo', 'onclick=\'FunFamilia.saveForm("frmFormulario")\''); ?></td>
         </tr>
         <tr>
          <th>Tipo de Comprobante (*)</th>
          <td><?php echo FormHelper::inputText('descripcion', '', false, array('class' => 'required validate-max-255 textinput' )); ?></td>
         </tr>
         <tr>
          <th>Valor I.V.A. Incluido $ (*)</th>
          <td><?php echo FormHelper::inputText('costo', '', false, array('class' => 'required validate-number validate-max-10 textinput' )); ?></td>
         </tr>
        </table>
        <div id="info">Los campos marcados con (*) son requeridos.</div>
        </fieldset>
        </form>
        <script>
        parent.Windows.getFocusedWindow().maximize();
        </script>
        <div id="list-costos"></div>

    	<?php
    }



    /**
     * Enter description here...
     *
     * @param unknown_type $Personas
     * @param unknown_type $actividad
     */
    public function updateList( $Costos ) {

        echo "\n<script>$('list-costos').update('<table class=\'sortable\'>"
        ." <tr>"
        ."  <th>N° Documento</th>"
        ."  <th>Descripción</th>"
        ."  <th>Costo</th>"
        ." </tr>"
        ;

        foreach ($Costos as $Costo) {
            echo " <tr>"
            ."  <td>{$Costo['numero_documento']}</td>"
            ."  <td><div align=\"left\">{$Costo['descripcion']}</div></td>"
            ."  <td><div align=\"right\">$".number_format($Costo['costo'], 0, '', '.')."</div></td>"
            ." </tr>";
        }
        echo "</table>'); </script>";
    }



}

?>
