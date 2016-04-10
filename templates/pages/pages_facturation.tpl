<section id="js_facturation">
    <!-- BEGIN lst_fam -->
    <div class="inbl mbl mtm">
        <button data-fam-num="{lst_fam.FAM_NUM}" class="js_btn_get_pres">{lst_fam.FAM_LIBEL}</button>
    </div>
    <!-- END lst_fam -->

    <!-- IFEXIST show_fac -->
    <form action="">
        <p data-fac-num="{FAC_NUM}">Facture n° {FAC_NUM} <button class="js_btn_del_fac mlm">Supprimer la facture</button></p>
        <p>Nom : {CLI_NOM}</p>
        <p>Prénom : {CLI_PRENOM}</p>
        <table class="mts">
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Prix</th>
                    <th>Remise</th>
                    <th>Prix remisé</th>
                    <th>Suppression</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td class="t_right">Total :</td>
                    <td class="total_base">{TOTAL_BASE}</td>
                    <td></td>
                    <td class="total_applied">{TOTAL_APPLIED}</td>
                    <td></td>
                </tr>
            </tfoot>
            <tbody>
                <!-- IFEXIST is_lg_fac -->
                <!-- BEGIN lst_ligne_fac -->
                <tr data-pres-num="{lst_ligne_fac.PRES_NUM}" data-fac-num-lg="{lst_ligne_fac.FAC_NUM}">
                    <td class="pres_libel">{lst_ligne_fac.PRES_LIBEL}</td>
                    <td class="pres_prix_base">{lst_ligne_fac.PRES_PRIX_BASE}</td>
                    <td>
                        <input type="text" value="{lst_ligne_fac.PRES_REMISE}" class="js_pres_remise">
                    </td>
                    <td><input type="text" value="{lst_ligne_fac.PRES_PRIX_APPLIED}" class="pres_prix_applied" readonly="readonly"></td>
                    <td><button class="js_btn_del_fac_pres">ok</button></td>
                </tr>
                <!-- END lst_ligne_fac -->
                <!-- ENDIF -->
            </tbody>
        </table>
        <div>
			<!-- IFEXIST is_included_fac -->
			<p>Factures associées :
				<!-- BEGIN lst_fac_included -->
				<button class="js_del_fac_included" data-fac-included="{lst_fac_included.FAC_NUM}"> {lst_fac_included.FAC_NUM} (supprimer)</button>
				<!-- END lst_fac_included -->
			</p>
			<!-- ENDIF -->
            <p><button class="js_add_waiting_fac">Associer une autre facture</button></p>
        </div>
        <div id="paiement">
            <h1>Paiement</h1>
            <label for="cb"><img src="./templates/images/cb.png" alt=""/></label> <input type="text" name="cb" id="cb"><br>
            <label for="cheque"><img src="./templates/images/logo_cheque.jpg" alt=""/></label> <input type="text" name="cheque" id="cheque"><br>
            <label for="espece"><img src="./templates/images/especes.png" alt=""/></label> <input type="text" name="espece" id="espece"> <span class="rendu"></span>
            <p>Total paiement : <span class="total_pai"></span></p>
        </div>
        <p><button class="js_btn_validate_fac">Valider la facture</button></p>
    </form>
    <!-- ENDIF -->
</section>