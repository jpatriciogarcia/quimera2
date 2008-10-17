/**
* Class JSManager.
*
* Definición del objeto JSManager para el manejo del sistema.
* @author JGG <jgarcigo@yahoo.es>
* @version Beta
* @package Clases
*/
var JSManager = Class.create();
JSManager.prototype = {

    // Inicializacion del objeto
    initialize: function() {
        this.minChars = 1;
        this.indicator = 'ajax_load';
        this.className = "mac_os_x";
        this.classNameDialog = "alphacube";
    },

    /**
    * Genera los listeners necesarios para crear campos "live search"
    * @param array fields
    * @param string url
    */
    makeAutocompleteFields: function(fields, url) {
        fields.each(function(s) {
            new Ajax.Autocompleter(s, 'results-' + s, url, {
                minChars: this.minChars,
                afterUpdateElement: updateFieldsFromLiveSearch,
                indicator: 'live_search',
                parameters: 'action=liveSearch'
            });

        });
    },

    /**
    * Función callbak para makeAutocompleteFields
    */

    updateFieldsFromLiveSearch: function(element, selectedElement) {
        /*
        var oInfo = selectedElement.childNodes.item(1);
        $('rut').value = oInfo.childNodes.item(1).innerHTML.strip();
        $('primer_nombre').value = oInfo.childNodes.item(3).innerHTML.strip();
        $('apellido_paterno').value = oInfo.childNodes.item(5).innerHTML.strip();
        */
    },


    // Crea una ventana para eliminar un centro
    makeWindowDeleteCentro: function(codigo) {
        Dialog.confirm('¿Estás seguro que deseas eliminar este centro?<br />Si existen datos relacionados a este centro no se podrá eliminar.', {
            className: this.classNameDialog,
            okLabel: "OK",
            cancelLabel: "Cancelar",
            ok: function() {
                new Ajax.Request('CentroFamiliar/eliminar', {
                    parameters: {codigo: codigo},
                    onComplete: function(transport) {
                        transport.responseText.evalScripts();
                    }
                });
                return true;
            }
        });
    },


    // Crea una ventana para eliminar unusuario
    makeWindowDeleteUsuario: function(usuario) {
        Dialog.confirm('¿Estás seguro que deseas eliminar este usuario?<br />Si existen datos relacionados a este usuario no se podrá eliminar.', {
            className: this.classNameDialog,
            okLabel: "OK",
            cancelLabel: "Cancelar",
            ok: function() {
                new Ajax.Request('Usuario/eliminar', {
                    parameters: {usuario: usuario},
                    onComplete: function(transport) {
                        transport.responseText.evalScripts();
                    }
                });
                return true;
            }
        });
    },


    // Crea una ventana para eliminar un proyecto
    makeWindowDeleteProyecto: function(codigo) {
        Dialog.confirm('¿Estás seguro que deseas eliminar este proyecto?<br />Si existen datos relacionados a este proyecto no se podr&aacute; eliminar.', {
            className: this.classNameDialog,
            okLabel: "OK",
            cancelLabel: "Cancelar",
            ok: function() {
                new Ajax.Request('Proyecto/eliminar', {
                    parameters: {codigo: codigo},
                    onComplete: function(transport) {
                        transport.responseText.evalScripts();
                    }
                });
                return true;
            }
        });
    },


    // Crea una ventana para eliminar un programa
    makeWindowDeletePrograma: function(codigo) {
        Dialog.confirm('¿Estás seguro que deseas eliminar este programa?<br />Si existen datos relacionados a este programa no se podr&aacute; eliminar.', {
            className: this.classNameDialog,
            okLabel: "OK",
            cancelLabel: "Cancelar",
            ok: function() {
                new Ajax.Request('Programa/eliminar', {
                    parameters: {codigo: codigo},
                    onComplete: function(transport) {
                        transport.responseText.evalScripts();
                    }
                });
                return true;
            }
        });
    },


    // Crea una ventana para eliminar una actividad
    makeWindowDeleteActividad: function(codigo) {
        Dialog.confirm('�Est�s seguro que deseas eliminar esta actividad?<br />Si existen datos relacionados a esta actividad no se podr&aacute; eliminar.', {
            className: this.classNameDialog,
            okLabel: "OK",
            cancelLabel: "Cancelar",
            ok: function() {
                new Ajax.Request('Actividad/eliminar', {
                    parameters: {codigo: codigo},
                    onComplete: function(transport) {
                        transport.responseText.evalScripts();
                    }
                });
                return true;
            }
        });
    },


    // Crea una ventana para eliminar un grupo
    makeWindowDeleteGrupo: function(codigo) {
        Dialog.confirm('¿Estás seguro que deseas eliminar este grupo?<br />Si existen datos relacionados a este grupo no se podr&aacute; eliminar.', {
            className: this.classNameDialog,
            okLabel: "OK",
            cancelLabel: "Cancelar",
            ok: function() {
                new Ajax.Request('Grupo/eliminar', {
                    parameters: {codigo: codigo},
                    onComplete: function(transport) {
                        transport.responseText.evalScripts();
                    }
                });
                return true;
            }
        });
    },


    // Crea una ventana para eliminar un grupo
    makeWindowDeleteModulo: function(codigo) {
        Dialog.confirm('¿Estás seguro que deseas eliminar este módulo?<br />Se eliminarán los datos asociados a éste.', {
            className: this.classNameDialog,
            okLabel: "OK",
            cancelLabel: "Cancelar",
            ok: function() {
                new Ajax.Request('Modulo/eliminar', {
                    parameters: {codigo: codigo},
                    onComplete: function(transport) {
                        transport.responseText.evalScripts();
                    }
                });
                return true;
            }
        });
    },


    // Crea una ventana para eliminar un grupo
    makeWindowDeletePlanificacionActividad: function(codigo) {
        Dialog.confirm('¿Estás seguro que deseas eliminar esta planificación?', {
            className: this.classNameDialog,
            okLabel: "OK",
            cancelLabel: "Cancelar",
            ok: function() {
                new Ajax.Request('PlanificacionActividad/eliminar', {
                    parameters: {codigo: codigo},
                    onComplete: function(transport) {
                        transport.responseText.evalScripts();
                    }
                });
                return true;
            }
        });
    },


    makeWindowSesion: function(actividad) {
        this.openDialog('Asistencia :: Actividad', 'Sesion/editar/codigo=' + actividad, {modal: true});
    },


    makeWindowCostos: function(actividad) {
        this.openDialog('Costos :: Actividad', 'Costos/editar/codigo=' + actividad, {modal: true});
    },


    // Para enviar los formularios
    saveForm: function(form) {

        var valid = new Validation(form, {onSubmit: false});
        var result = valid.validate();
        var disabledElements = new Array();
        var parameters = $H();

        var i = 0;
        $(form).getElements().each(function(s) {
            if(s.disabled) { disabledElements[i++] = s; }
        });

        if($('list-pertenecientes')) {
            parameters = Sortable.serialize('list-pertenecientes');
        }

        $(form).enable();
        if ( result ) {
            $(form).request({
                parameters: parameters,
                onLoading: function(){
                    TransparentMenu.show('ajax_info_message', {hideMode:'none', insideElement:{id:'frmFormulario'}, showMode:null});
                },
                onComplete: function(transport){
                    TransparentMenu.hide('ajax_info_message')
                    disabledElements.each(function(s) { s.disable(); });
                    transport.responseText.evalScripts();
                }
            });
        }
    },


    /**
    * Crea una ventana Prototype Window Class (PWC)
    * @param string title
    * @param string url
    * @param array params
    */
    openDialog: function(title, url, params) {

        var params = params ? params : Array;
        var width = params['width'] ? params['width'] : 695;
        var height = params['height'] ? params['height'] : 370;
        var left = params['left'] ? params['left'] : 30;
        var top = params['top'] ? params['top'] : 30;
        var center = params['center'] ? params['center'] : false;
        var modal = params['modal'] ? params['modal'] : false;

        var win = new Window({
            className: this.className,
            width: width,
            height: height,
            title: title,
            url: url,
            left: left,
            top: top,
            wiredDrag: true,
            destroyOnClose: true,
            showEffect: Element.show,
            hideEffect: Element.hide
        })

        win.setConstraint(true, {left: 2, right: 2, top: 2, bottom: 2});

        if( center ) {
            win.showCenter(modal);
        }
        else {
            win.show(modal);
        }

    },


    alert: function( msg ) {
        Dialog.alert(msg, {className: this.classNameDialog});
    }

};


/**
* Funcion para procesar los datos al seleccionar un campo del LiveSearch.
* Se debe sobreescribir esta funcion antes de la llamada a FunFamilia.makeAutocompleteFields
* si se desea utilizar la funcionalidad.
*/
function updateFieldsFromLiveSearch() {
}



// Se instancia el objeto para que este disponible desde toda la aplicaci�n.
var FunFamilia = new JSManager();
