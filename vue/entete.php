<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <title></title>
    </head>
<?php
session_start();
include "fonctions/fonctionsAccesDonnees.php";
include "fonctions/fonctionsGestion.php";
?>
<body>
    <h1><?php echo chargeJSONseminaire()->seminaire->intitule?></h1>
    <table>
	<tr>
	    <td><a href="./?action=inscription">Inscription</a></td>
            <td><a href="./?action=programme">Voir le programme</a></td>
            <td><a href="./?action=choixconferences">Choisir ses conférences</a></td>
            <td><a href="./?action=connexion">Connexion admin</a></td>
            <td><a href="./?action=voirinscriptions">Voir les inscrits aux conférences</a></td>
            <?php
                if (isset($_SESSION['login'])) {
                    echo"<td><a href='./?action=deconnexion'>Déconnexion</a></td>";
                    echo "<td>Bonjour " . $_SESSION['login'] . "</td>";
                }
                
            ?>
        </tr>
    </table>
    <br/>