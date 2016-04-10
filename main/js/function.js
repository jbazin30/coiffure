
$(function () {
    var js_add_client = $('#js_add_client');
    var js_get_svc = $('#js_get_service');
    var js_add_svc = $('#js_add_service');
    var js_add_pres = $('#js_add_pres');

    /**
     * Bind jQuery
     */
    $('.add_value').on('click', function () {
        var data = {
            mod: 'addDepense',
            libel: $('#libel').val(),
            date: $('#date').val(),
            prix: $('#prix').val()
        }
        O.Ajax.addDepense(data);
    });


    $('.js_btn_add_svc').button().on('click', function () {
        $('#js_add_service .name').html($('.cli_nom input').val());
        $('#js_add_service .pname').html($('.cli_pname input').val());
        $('#js_add_service .tech').html($(this).html());
        $('#js_add_service .tech').attr('data-fam-num', $(this).data('fam-num'));
        js_add_svc.dialog('open');
    });


    $('.js_get_svc').on('click', function () {
        var data = {
            mod: 'getService',
            svc_num: $(this).data('svc-num')
        };
        O.Ajax.getService(data);
        $('#js_get_service #js_frm_service').attr('data-num', $(this).data('svc-num'));
        js_get_svc.dialog('open');
    });


    $('.js_add_client').on('click', function () {
        js_add_client.dialog('open');
        return false;
    });


    $('.js_btn_edit_client').on('click', function () {
        var data = {
            mod: 'editClient',
            cli_num: $('#cli_num').val(),
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
        console.log(data);
        O.Ajax.editClient(data);
    });

    $('.js_btn_del_client').on('click', function () {
        var data = {
            mod: 'delClient',
            cli_num: $('#js_fiche_client div:first-child').data('cli')
        };
        O.Ajax.delClient(data);
    });

    $('.js_btn_get_pres').on('click', function () {
        var data = {
            mod: 'getPres',
            fam_num: $(this).data('fam-num')
        };
        O.Ajax.getPres(data);
        $('#js_add_pres table').attr('data-fac-num', $(this).data('fam-num'));
        js_add_pres.dialog('open');
    });

    $('.js_pres_remise').on('focusout', function () {
        var taux = $(this).val();
        var index = $(this).parents('tr').children('td').children('.pres_prix_applied');
        var total_applied = 0;

        index.val((parseFloat(parseFloat($(this).parents('tr').find('.pres_prix_base').html())) * (1 - parseFloat(taux) / 100)).format(2, 3, ' ', '.'));

        $('tbody tr td input.pres_prix_applied').delay(1000).each(function () {
            total_applied = parseFloat(total_applied) + parseFloat($(this).val());
        });

        $('.total_applied').html(total_applied.format(2, 3, ' ', '.'));
    });
    $('.pres_prix_applied').on('focusout', function () {
        var total_applied = 0;

        $('tbody tr td input.pres_prix_applied').delay(1000).each(function () {
            total_applied = parseFloat(total_applied) + parseFloat($(this).val());
        });

        $('.total_applied').html(total_applied.format(2, 3, ' ', '.'));
    });

    $('.pres_prix_applied').on('dblclick', function () {
        $(this).removeAttr('readonly');
        $(this).css('border', '1px solid black');
    });

    $('.js_btn_del_fac_pres').on('click', function () {
        var current = $(this).parents('tr');
        var data = {
            mod: 'delPresFac',
            fac_num: $('#js_facturation p:first-child').data('fac-num'),
            pres_num: current.data('pres-num')
        }
        O.Ajax.delPresFac(data);
        return false;
    });

    $('.js_btn_validate_fac').on('click', function () {
        var data = {
            1: parseFloat($('#cb').val()),
            2: parseFloat($('#cheque').val()),
            3: parseFloat($('#espece').val())
        };
        O.Ajax.addPai({
            mod: 'addPai',
            fac_num: $('#js_facturation p:first-child').data('fac-num'),
            montants_pai: data
        });

        $('tbody tr').each(function () {
            O.Ajax.validateFac({
                mod: 'validateFac',
                pres_num: $(this).data('pres-num'),
                fac_num: $('#js_facturation p:first-child').data('fac-num'),
                pres_remise: parseFloat($(this).find('input.js_pres_remise').val()),
                pres_prix_base: parseFloat($(this).find('.pres_prix_base').html()),
                pres_prix_applied: parseFloat($(this).find('input.pres_prix_applied').val()),
            });
        });

        return false;
    });

    $('#cb, #cheque, #espece').on('focusout', function () {
        var total_pai = 0;

        if (isNaN(parseFloat($('#cb').val())) === false) {
            total_pai = total_pai + parseFloat($('#cb').val());
        }
        if (isNaN(parseFloat($('#cheque').val())) === false) {
            total_pai = total_pai + parseFloat($('#cheque').val());
        }
        if (isNaN(parseFloat($('#espece').val())) === false) {
            total_pai = total_pai + parseFloat($('#espece').val());
        }

        var rendu = parseFloat($('.total_applied').html()) - total_pai;
        $('.rendu').html(rendu);
        $('.total_pai').html(total_pai);
    });

    $('.js_btn_del_fac').on('click', function () {
        var data = {
            mod: 'delFac',
            fac_num: $('#js_facturation p:first-child').data('fac-num')
        }
        O.Ajax.delFac(data);
        return false;
    });

    $('.js_back_search').on('click', function () {
        window.location.href = '?p=search';
    });
    $('header').on('click', function () {
        window.location.href = 'index.php';
    });

    /**
     * Datepicker
     */
    $('.datepicker').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1920:2040"
    });
    $('.datepicker').datepicker($.datepicker.regional[ "fr" ]);

    /**
     * Footable
     */
    $('.footable').footable().bind('footable_filtering', function (e) {
        var selected = $('.filter-status').find(':selected').text();
        if (selected && selected.length > 0) {
            e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
            e.clear = !e.filter;
        }
    });

    $('.clear-filter').click(function (e) {
        e.preventDefault();
        $('.filter-status').val('');
        $('.footable').trigger('footable_clear_filter');
    });


    /**
     * Ajout style btn
     */
    $("input[type=submit], button").button();

    /**
     * OnResize
     */
    $(window).resize(function () {
        $('.ui-dialog-content:visible').dialog("option", "position", $('.ui-dialog-content:visible').dialog("option", "position"));
    });
});

/**
 * Formate un nombre
 * @param {type} n
 * @param {type} x
 * @param {type} s
 * @param {type} c
 * @returns {String}
 */
Number.prototype.format = function (n, x, s, c) {
    var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
            num = this.toFixed(Math.max(0, ~~n));

    return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ',')) + ' €';
};