<form action="#" method="post">
    <p class="t_center">
        Recherche : <input id="filter" type="text" class="mrs">
        <a href="#clear" class="clear-filter" title="clear filter">Effacer</a>
    </p>
</form>
<!-- IFEXIST in_search -->
<div class="scrollable">
    <table class="footable mts" data-filter="#filter" data-filter-text-only="true">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Ville</th>
                <th>Genre</th>
            </tr>
        </thead>
        <tbody>
            <!-- BEGIN lst_cli -->
            <tr onclick="window.location.href = 'index.php?p={PAGE}&amp;cli={lst_cli.CLI_NUM}'">
                <td>{lst_cli.CLI_NOM}</td>
                <td>{lst_cli.CLI_PNOM}</td>
                <td>{lst_cli.CLI_VILLE}</td>
                <td>{lst_cli.CLI_SEXE}</td>
            </tr>
            <!-- END lst_cli -->
        </tbody>
    </table>
</div>
<!-- ENDIF -->