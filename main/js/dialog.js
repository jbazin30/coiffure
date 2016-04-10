/**
 * Création des dialog jQuery UI
 */
var O;
if (!O)
    O = {};
else if (typeof O !== "object")
    throw new Error("O already exists & is not 1 object");
if (O.Dialog)
    throw new Error("O.Dialog already exists");

$(function () {
    O.Dialog.Init();
});

O.Dialog = {
    Init: function () {
        O.Dialog.addService();
        O.Dialog.getService();
        O.Dialog.addClient();
        O.Dialog.getPrestation();
    },
    addService: function () {
        var js_add_svc = $('#js_add_service');
        js_add_svc.dialog({
            autoOpen: false,
            width: 500,
            modal: true,
            buttons: {
                'Sauvegarder': function () {
                    var data = {
                        mod: 'addService',
                        cli_num: $('#js_fiche_client #cli_num').val(),
                        fam_num: $('#js_add_service .tech').data('fam-num'),
                        details: $('#js_add_service #details').val()
                    };
                    O.Ajax.addService(data);
                },
                'Annuler': function () {
                    js_add_svc.dialog('close');
                }
            },
            close: function () {
                //$('#js_frm_service').reset();
            }
        });
    },
    getService: function () {
        var js_get_svc = $('#js_get_service');
        js_get_svc.dialog({
            autoOpen: false,
            width: 500,
            modal: true,
            buttons: {
                'Modifier': function () {
                    var data = {
                        mod: 'editService',
                        svc_num: $('#js_get_service #js_frm_service').data('num'),
                        details: $('#js_get_service #details').val()
                    };
                    O.Ajax.editService(data);
                },
                'Annuler': function () {
                    js_get_svc.dialog('close');
                }
            },
            close: function () {
                //$('#js_frm_service').reset();
            }
        });
    },
    addClient: function () {
        var js_add_client = $('#js_add_client');
        js_add_client.dialog({
            autoOpen: false,
            width: 500,
            modal: true,
            buttons: {
                'Sauvegarder': function () {
                    var data = {
                        mod: 'addClient',
                        cli_nom: $('#cli_nom').val(),
                        cli_prenom: $('#cli_prenom').val(),
                        cli_adr: $('#cli_adr').val(),
                        cli_cp: $('#cli_cp').val(),
                        cli_ville: $('#cli_ville').val(),
                        cli_tel: $('#cli_tel').val(),
                        cli_mobile: $('#cli_mobile').val(),
                        cli_email: $('#cli_email').val(),
                        cli_naiss: $('#cli_naiss').val(),
                        cli_genre: $('#cli_genre option:selected').val(),
                        cli_sexe: $('#cli_sexe option:selected').val()
                    };
                    O.Ajax.addClient(data);
                },
                'Annuler': function () {
                    js_add_client.dialog('close');
                }
            },
            close: function () {
            }
        });
    },
    getPrestation: function () {
        var js_add_pres = $('#js_add_pres');
        js_add_pres.dialog({
            autoOpen: false,
            width: 500,
            modal: true,
            buttons: {
                'Ajouter': function () {
                    var data = {
                        mod: 'addPres',
                        lst_pres: lst_pres,
                        fac_num: $('#js_facturation p:first-child').data('fac-num')
                    };
                    O.Ajax.addPrestation(data);
                    js_add_pres.dialog('close');
                },
                'Annuler': function () {
                    $('#prestations').empty();
                    lst_pres = [];
                    js_add_pres.dialog('close');
                }
            },
            close: function () {
                $('#prestations').empty();
            }
        });
    }
};