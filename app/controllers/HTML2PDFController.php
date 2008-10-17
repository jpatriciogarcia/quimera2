<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class HTML2PDFController {

    /**
     * Enter description here...
     *
     */
    function __construct() {
    }

    function index() {
        $_SESSION['content'] = $_POST['content'];
    }

    /**
     * Enter description here...
     *
     */
    public function generate() {
        // We'll be outputting a PDF
        header('Content-type: application/pdf; charset="utf-8"', true);

        // It will be called downloaded.pdf
        header('Content-Disposition: attachment; filename="Fundacion de la Familia.pdf"');

        ob_start();
        echo $_SESSION['content'];
        // Output-Buffer in variable:
        $html = ob_get_contents();
        // delete Output-Buffer
        ob_end_clean();
        $pdf = new HTML2FPDF();
        $pdf->DisplayPreferences('HideWindowUI');
        $pdf->AddPage();
        $pdf->WriteHTML($html);
        $pdf->Output('doc.pdf','I');
    }

}
?>