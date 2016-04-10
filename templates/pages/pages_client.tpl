<section class="grid-2" id="js_fiche_client">
    <div>
        <p>
            <label for="cli_num">N° :</label>
            <input type="text" name="cli_num" id="cli_num" value="{CLI_NUM}">
        </p>
        <p>
            <label for="cli_sexe">Sexe :</label>
            {LST_SEXE}
        </p>
        <p class="cli_nom">
            <label for="cli_nom">Nom :</label>
            <input type="text" name="cli_nom" id="cli_nom" value="{CLI_NOM}">
        </p>
        <p class="cli_pname">
            <label for="cli_prenom">Prénom :</label>
            <input type="text" name="cli_prenom" id="cli_prenom" value="{CLI_PNOM}">
        </p>
        <p>
            <label for="cli_adr">Adresse :</label>
            <input type="text" name="cli_adr" id="cli_adr" value="{CLI_ADR}">
        </p>
        <p>
            <label for="cli_cp">Code postal :</label>
            <input type="text" name="cli_cp" id="cli_cp" value="{CLI_CP}">
        </p>
        <p>
            <label for="cli_ville">Ville :</label>
            <input type="text" name="cli_ville" id="cli_ville" value="{CLI_VILLE}">
        </p>
        <p>
            <label for="cli_tel">Téléphone :</label>
            <input type="text" name="cli_tel" id="cli_tel" value="{CLI_TEL}">
        </p>
        <p>
            <label for="cli_mobile">Mobile :</label>
            <input type="text" name="cli_mobile" id="cli_mobile" value="{CLI_MOBILE}">
        </p>
        <p>
            <label for="cli_email">Email :</label>
            <input type="text" name="cli_email" id="cli_email" value="{CLI_EMAIL}">
        </p>
        <p>
            <label for="cli_naiss">Date de naissance :</label>
            <input type="text" name="cli_naiss" id="cli_naiss" class="datepicker" value="{CLI_NAIS}">
        </p>
        <p>
            <label for="cli_genre">Genre :</label>
            {LST_GEN}
        </p>
        <p>
            <button type="button" class="js_btn_edit_client">Modifier</button>
            <button class="js_back_search">Retour</button>
            <!--<button type="button" class="js_btn_del_client">Supprimer</button>-->
        </p>
    </div>
    <div>
        <div class="t_center">
            <button class="js_btn_add_svc" data-fam-num="1">Couleur</button>
            <button class="js_btn_add_svc" data-fam-num="2">Mèches</button>
            <button class="js_btn_add_svc" data-fam-num="3">Forme</button>
        </div>
        <div class="mtm">
            <!-- IFEXIST is_lst_svc -->
            <table class="footable">
                <tr>
                    <th>Date</th>
                    <th>Prestation</th>
                    <th>Suppression</th>
                </tr>
                <!-- BEGIN lst_svc -->
                <tr>
                    <td class="js_get_svc" data-svc-num="{lst_svc.SVC_NUM}">{lst_svc.SVC_DATE}</td>
                    <td class="js_get_svc" data-svc-num="{lst_svc.SVC_NUM}">{lst_svc.FAM_LIBEL}</td>
                    <td><button class="ui-button ui-widget italic" onclick="O.Ajax.delService({lst_svc.SVC_NUM})">supprimer</button></td>
                </tr>
                <!-- END lst_svc -->
            </table>
            <!-- ENDIF -->
        </div>
    </div>
    <div>
        <p>Liste des factures</p>
        <!-- IFEXIST is_lst_fac -->
        <table class="footable">
            <tr>
                <th>N°</th>
                <th>Date</th>
                <th></th>
            </tr>
            <!-- BEGIN lst_fac -->
            <tr>
                <td>{lst_fac.FAC_NUM}</td>
                <td>{lst_fac.FAC_DATE}</td>
                <td><a href="?p=facture&f={lst_fac.FAC_NUM}&amp;c={CLI_NUM}">Voir</a></td>
            </tr>
            <!-- END lst_fac -->
        </table>
        <!-- ELSE -->
        Aucunes factures pour le moment
        <!-- ENDIF -->
    </div>
</section>