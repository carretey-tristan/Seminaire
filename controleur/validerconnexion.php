<?php
include "fonctions/fonctionsGestion.php";
$login = $_POST['login'];
$mdp = $_POST['mdp'];
verifier($login, $mdp);
if (verifier($login, $mdp)) {
    header("Location: ./?action=programme");
} else {
    header("Location: ./?action=connexion");
}
?>