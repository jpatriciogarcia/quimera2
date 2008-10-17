<?php
/**
 * Objeto IndexView.
 *
 * En este archivo se define la clase para la presentacion del index.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class IndexView {

    private $registry;

    function __construct($registry) {
        $this->registry = $registry;
    }

    public function index() {
        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('jquery', 'interface', 'jquery-script', 'jquery-plugins', 'prototype', 'effects', 'window', 'debug', 'validation', 'utils'));
        echo HtmlHelper::includeCSSFiles(array('login', 'themes/default', 'themes/alphacube', 'themes/mac_os_x'));
        echo HtmlHelper::endHeader();
    }


    public function login() {
        self::index();
        ?>
    	<div id="login">
    		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    		<form method="post" action="home" class="png">
    			<label for="username" id="username">
    				<span>Usuario: </span>
    				<input type="text" name="username" />
    			</label>
    			<label for="password" id="password">
    				<span>Contraseña: </span>
    				<input type="password" name="password" />
    			</label>
    			<div id="messages"></div>

    			<input type="submit" value="Login" class="button" />
    		</form>
    	</div>
        <?php
        echo HtmlHelper::endDocument();
    }


    public function showHome( Array $Modulo ) {
        echo HtmlHelper::startHeader();
        echo HtmlHelper::includeJSFiles(array('prototype', 'effects', 'window', 'debug', 'validation', 'utils', 'jquery', 'interface'));
        echo HtmlHelper::includeCSSFiles(array('themes/default', 'themes/alphacube', 'themes/mac_os_x', 'style'));
        echo HtmlHelper::endHeader();
        echo $this->makeDockMenu( $Modulo );
        ?>
        <div id="welcome">Bienvenid@<br /><?php echo ucwords($_SESSION['nombres']); ?></div>
        <img id="logo" src="<?php echo WEB_PATH; ?>/public/images/logo.png" />
        <!--dock menu JS options -->
        <script type="text/javascript">
        jQuery.noConflict();

        jQuery(document).ready(
        function()
        {
            jQuery('#dock2').Fisheye({
                maxWidth: 50,
                items: 'a',
                itemsText: 'span',
                container: '.dock-container2',
                itemWidth: 40,
                proximity: 80,
                alignment : 'left',
                valign: 'bottom',
                halign : 'center'
            })
        }
        );

        </script>
        <?php
        echo HtmlHelper::endDocument();
    }


    public function makeDockMenu( Array $Modulo ) {
        $return = "<!--bottom dock -->"
        ."\n<div class='dock' id='dock2'>"
        ."\n <div class='dock-container2'>";
        foreach ($Modulo as $Modulo) {
            $return .= "\n  <a class='dock-item2' href='#' onclick=\"FunFamilia.openDialog('{$Modulo->descripcion}', "
            ."'{$Modulo->url}', {left: 1, top: 1, width: 650, height: 400})\"><span>{$Modulo->descripcion}</span>"
            ."<img src='".WEB_PATH."/public/images/{$Modulo->imagen}' /></a>";
        }
        $return .= "\n  <a class='dock-item2' href='".WEB_PATH."/Usuario/logout'><span>Salir</span>"
        ."<img src='".WEB_PATH."/public/images/dock-menu/shutdown.png' /></a>";
        $return .= "\n </div>\n</div>";

        return $return;
    }

}

?>