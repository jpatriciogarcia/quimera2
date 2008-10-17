<?php
// For loading classes
function __autoload($className) {

    if (ereg('Controller', $className)) {
        if (is_file(DOCUMENT_ROOT . '/app/controllers/' . $className . '.php')) {
            require(DOCUMENT_ROOT . '/app/controllers/' . $className . '.php');
        }
        else {
            $fp = fopen(DOCUMENT_ROOT.'/log/error-'.date('Ymd').'.log', 'a');
            fwrite($fp, date('Y-m-d H:i:s ')."Archivo no encontrado - ".$_SERVER['REQUEST_URI']."\n");
            fclose($fp);
            die("Archivo no encontrado");
        }
    }
    elseif (ereg('Model', $className)) {
        if (is_file(DOCUMENT_ROOT . '/app/models/' . $className . '.php')) {
            require(DOCUMENT_ROOT . '/app/models/' . $className . '.php');
        }
        else {
            $fp = fopen(DOCUMENT_ROOT.'/log/error-'.date('Ymd').'.log', 'a');
            fwrite($fp, date('Y-m-d H:i:s ')."Archivo no encontrado - ".$_SERVER['REQUEST_URI']."\n");
            fclose($fp);
            die("Archivo no encontrado");
        }
    }
    elseif (ereg('View', $className)) {
        if (is_file(DOCUMENT_ROOT . '/app/views/' . $className . '.php')) {
            require(DOCUMENT_ROOT . '/app/views/' . $className . '.php');
        }
        else {
            $fp = fopen(DOCUMENT_ROOT.'/log/error-'.date('Ymd').'.log', 'a');
            fwrite($fp, date('Y-m-d H:i:s ')."Archivo no encontrado - ".$_SERVER['REQUEST_URI']."\n");
            fclose($fp);
            die("Archivo no encontrado");
        }
    }
    elseif (ereg('Helper', $className)) {
        if (is_file(DOCUMENT_ROOT . '/app/helpers/' . $className . '.php')) {
            require(DOCUMENT_ROOT . '/app/helpers/' . $className . '.php');
        }
        else {
            $fp = fopen(DOCUMENT_ROOT.'/log/error-'.date('Ymd').'.log', 'a');
            fwrite($fp, date('Y-m-d H:i:s ')."Archivo no encontrado - ".$_SERVER['REQUEST_URI']."\n");
            fclose($fp);
            die("Archivo no encontrado");
        }
    }
    else {
        require($className . '.php');
    }

    return true;
}



/**
 * Invierte una fecha segun los siguientes formatos
 * dd-mm-yyyy => yyyy-mm-dd
 * dd/mm/yyyy => yyyy/mm/dd
 * yyyy-mm-dd => dd-mm-yyyy
 * yyyy/mm/dd => dd/mm/yyyy
 *
 * @param String $date
 * @return String fecha formateada
 */
function reverseDate( $date ) {
    $separator = strstr($date, "-") ? "-" : "/";
    if ( preg_match("/[0-9]{1,2}\/[0-9]{1,2}\/([0-9]){4}/", $date) || preg_match("/[0-9]{1,2}-[0-9]{1,2}-([0-9]){4}/", $date) ) {
        return substr($date, 6, 4) . $separator . substr($date, 3, 2) . $separator . substr($date, 0, 2);
    }
    if ( preg_match("/([0-9]){4}\/[0-9]{1,2}\/[0-9]{1,2}/", $date) || preg_match("/([0-9]){4}-[0-9]{1,2}-[0-9]{1,2}/", $date) ) {
        return substr($date, 8, 2) . $separator . substr($date, 5, 2) . $separator . substr($date, 0, 4);
    }
    return false;
}


function getMKTime($fecha_inicio='0000-00-00 00:00:00 ') {
    $fecha_hora = split("[ ]", ereg_replace("[']", "", $fecha_inicio));
    $fecha = split("[-]", $fecha_hora[0]);
    $hora = split("[:]", $fecha_hora[1]);

    $hora[0] = isset($hora[0]) ? $hora[0] : 0;
    $hora[1] = isset($hora[1]) ? $hora[1] : 0;
    $hora[2] = isset($hora[2]) ? $hora[2] : 0;

    $fecha[0] = isset($fecha[0]) ? $fecha[0] : 0;
    $fecha[1] = isset($fecha[1]) ? $fecha[1] : 0;
    $fecha[2] = isset($fecha[2]) ? $fecha[2] : 0;

    return mktime($hora[0]*1, $hora[1]*1, $hora[2]*1, $fecha[1]*1, $fecha[2]*1, $fecha[0]*1);
}

?>