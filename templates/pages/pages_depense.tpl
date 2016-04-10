<section id="depenses">
    <form action="#" method="post">
        <p><label for="libel">Détails :</label> <input type="text" id="libel" name="libel" size="40"></p>
        <p><label for="date">Date :</label> <input type="text" id="date" name="date" size="10" class="datepicker"></p>
        <p><label for="prix">Prix :</label> <input type="text" id="prix" name="prix" size="8"></p>
        <button type="button" class="add_value mtm">Sauvegarder</button>
        <span class="return"></span>
    </form>
    <!-- IFEXIST is_lst_ach -->
    <table class="footable mtl">
        <thead>
            <tr>
                <th>N°</th>
                <th>Libellé</th>
                <th>Prix</th>
                <th>Date</th>
            </tr>
        </thead>
        <!-- BEGIN lst_ach -->
        <tr>
            <td>{lst_ach.ACH_NUM}</td>
            <td>{lst_ach.ACH_LIBEL}</td>
            <td>{lst_ach.ACH_PRIX}</td>
            <td>{lst_ach.ACH_DATE}</td>
        </tr>
        <!-- END lst_ach -->
    </table>
    <!-- ENDIF -->
</section>