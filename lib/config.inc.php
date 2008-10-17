<?php
/**
 * Archivo de configuracion del sistema.
 *
 * En este archivo se crean las variables de configuracion basicas del sistema
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package config
 */

error_reporting(E_ALL);

/**
 * Libreria ADOdb para PHP
 * @link http://www.lacorona.com.mx/fortiz/adodb5/docs-adodb-es.htm
 */
include_once('adodb5/adodb.inc.php');

/**
 * ADOdb Active Record
 * @link http://www.lacorona.com.mx/fortiz/adodb5/docs-active-record-es.htm
 */
include_once('adodb5/adodb-active-record.inc.php');

/**
 * Para atrapar las excepciones conforme ocurran los errores.
 * @link http://www.lacorona.com.mx/fortiz/adodb5/docs-adodb-es.htm#php5
 */
include_once('adodb5/adodb-exceptions.inc.php');

/**
 * Para hacer envio de email.
 * @link http://phpmailer.codeworxtech.com/
 */
include_once('phpMailer/class.phpmailer.php');

/**
 * Libreria para exportar a PDF
 */
include_once('html2fpdf-3.0.2b/html2fpdf.php');

/**
 * Funciones utiles para el sistema.
 */
include_once('utils.php');


/**#@+
* Constants
*/
/**
 * El tipo de base de datos que se va a conectar.
 * Para mas detalles ver
 * http://www.lacorona.com.mx/fortiz/adodb5/docs-adodb-es.htm#drivers
 */
define('DB_DRIVER', 'postgres');

/**
 * El nombre o IP del host donde se conecta a la base de datos
 */
define('DB_HOST', '127.0.0.1');

/**
 * El nombre de usuario para la base de datos
 */
define('DB_USER', 'funfamilia');

/**
 * La password para conectar la base de datos
 */
define('DB_PASSWORD', 'funfamilia');

/**
 * El nombre de la base de datos
 */
define('DB_NAME', 'funfamilia');

/**
 * Path para utilizarla en referencias absolutas hacia archivos .js, .jpg, .gif,
 * etc.
 */
define('WEB_PATH', 'http://'.$_SERVER['SERVER_NAME'].'/FunFamilia');

/**
 * Define el largo maximo de las cadenas a mostrar en los listados
 *
 */
define('MAX_LENGTH_FIELD', 40);

/**
 * Path para utilizarla en referencias absolutas hacia archivos .php
 */
define('DOCUMENT_ROOT', 'C:\Archivos de programa\wamp\www\FunFamilia');
#define('DOCUMENT_ROOT', '/var/www/FunFamilia');

/*
* colores para listar la informacion de los mantenedores
*/

/**
 * Determina el lenguaje que usa la funcion MetaErrorMsg(). El valor por omision
 * es 'en', que significa mensajes en ingles. Para ver que lenguajes estan
 * disponibles, vea los archivos en adodb5/lang/adodb-$lang.inc.php, donde $lang
 * son los lenguajes disponibles.
 */
$ADODB_LANG = 'es';

/**
 * Determina como se obtienen los arreglos generados por los recordsets.
 * @link http://www.lacorona.com.mx/fortiz/adodb/docs-adodb-es.htm#adodb_fetch_mode
 */
$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC;

/**
 * Creacion del objeto conexion a la base de datos.
 */
$db = NewADOConnection(DB_DRIVER.'://'.DB_USER.':'.DB_PASSWORD.'@'.DB_HOST.'/'.DB_NAME);

/**
 * Libreria de ADOdb para el Diccionario de Datos en PHP
 * @link http://www.lacorona.com.mx/fortiz/adodb5/docs-datadict-es.htm
 */
$dict = NewDataDictionary($db);

/**
 * Para depurar el codigo.
 */
$db->debug = false;

/**
 * Para manejar base de datos con el patrón de diseño Active Record
 * @link http://es.wikipedia.org/wiki/Patron_ActiveRecord
 */
ADOdb_Active_Record::SetDatabaseAdapter($db);

include_once("adodb5/session/adodb-session2.php");
ADOdb_Session::config(DB_DRIVER, DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, false);

session_start();

?>
