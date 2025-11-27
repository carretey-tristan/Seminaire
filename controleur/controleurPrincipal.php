<?php
function controleurPrincipal($action){
    $lesActions = array();
    $lesActions["inscription"] = "inscription.php";
    $lesActions["defaut"] = "programme.php";
    $lesActions["choixconferences"] = "choixconferences.php";
    $lesActions["connexion"] = "connexion.php";
    $lesActions["voirinscriptions"] = "voirinscriptions.php";
    $lesActions["validerConnexion"] = "validerConnexion.php";
    $lesActions["deconnexion"] = "deconnexion.php";

 
    if (array_key_exists ( $action , $lesActions )){
        return $lesActions[$action];
    }
    else{
        return $lesActions["defaut"];
    }
}
?>