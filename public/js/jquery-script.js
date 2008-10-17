jQuery(document).ready(function(){

    jQuery("#login").Bounce(70);

    jQuery("#footbar").slideDown("slow");

    jQuery("input").focus(function(){
        jQuery(this).parent().addClass("active");
    });
    jQuery("input").blur(function(){
        jQuery(this).parent().removeClass();
    });


    jQuery('#login form').submit(function(e){
        e.preventDefault();

        var username = jQuery("#username input").attr('value');
        var password = jQuery("#password input").attr('value');

        jQuery.ajax({
            type: "POST",
            data: {username: username, password: password},
            url: 'Usuario/login',
            success: function(result) {
                if(result == "true") {
                    jQuery("#ajax_load").fadeOut(200);
                    jQuery("#messages").append('<div id="ajax_accept">Accediendo al sistema...</div>');
                    jQuery("#ajax_accept").hide().show("slow",function(){
                        setTimeout(function(){jQuery("#login").slideUp(500);},500);
                        setTimeout(function(){jQuery('#login form')[0].submit();},1200);
                    });
                }
                else {
                    jQuery("#ajax_load").animate({opacity: 1.0}, 500).fadeOut(500);
                    jQuery("#messages").append('<div id="ajax_error">'+result+' <a href=\'javascript:FunFamilia.openDialog("Usuario::Recordar Contraseña", "Usuario/recordarPassword/usuario=", {center: true, modal: true, height: 210, width: 350});\'>¿Olvidó su contraseña?</a></div>');
                    jQuery("#login").Shake(4);
                }
            }
        })
    });

    jQuery(".button").ajaxStart(function(){
        jQuery("#messages div").remove();
        jQuery("#messages").append('<div id="ajax_load">Validando los datos...</div>');
    });
});
