<button onclick="window.location.href = '?p=client&cli={CLI_NUM}'">Retour</button>
<div class="scrollable">
    <table class="footable mts">
        <thead>
            <tr>
                <th>Préstations</th>
                <th>Prix</th>
            </tr>
        </thead>
        <tbody>
            <!-- BEGIN lst_fac -->
            <tr>
                <td>{lst_fac.PRES_LIBEL}</td>
                <td>{lst_fac.FAC_PRICE_APPLIED}</td>
            </tr>
            <!-- END lst_fac -->
        </tbody>
    </table>
</div>