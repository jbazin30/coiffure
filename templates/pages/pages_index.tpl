<section class="flex-container-v" id="index">
    <div>
        <a href="?p=search">
            <img src="./templates/images/fiche_client.png"><br>
            Fichier clients
        </a>
        <a href="" class="js_add_client">
            <img src="./templates/images/ajout_client.png"><br>
            Nouveau client
        </a>
    </div>
    <div>
        <div class="b_white ba round">
            <div class="col bb b_white pa5">
                <a href="?p=search&amp;a=f">
                    <img src="./templates/images/facturation.png" class="logo_facturation">
                    Facturation
                </a>
            </div>
            <!-- IFEXIST is_lst_fac_prov -->
            <div class="pa5">
                <!-- BEGIN lst_fac -->
                <p><a href="?p=facturation&amp;f={lst_fac.FAC_NUM}">{lst_fac.FAC_CLI_NOM} - {lst_fac.FAC_CLI_PRENOM}</a></p>
                <!-- END lst_fac -->
            </div>
            <!-- ENDIF -->
        </div>
    </div>
    <div>
        <a href="">
            <img src="./templates/images/stock.png"><br>
            Stock
        </a>
        <a href="?p=depense">
            <img src="./templates/images/depenses.png"><br>
            Dépenses
        </a>
        <a href="">
            <img src="./templates/images/caisse.png"><br>
            Caisse
        </a>
    </div>
</section>