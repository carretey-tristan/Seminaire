<?php
/**
 * Vérifie le login et le mot de passe afin d'autoriser ou pas le visiteur à visualiser les inscriptions
 * @param chaîne $login
 * @param chaîne $mdp
 */
function verifier($login, $mdp)
{
       session_start();
       $json_source = file_get_contents('data/admin.json');
       $document = json_decode($json_source);
       $users = $document->users;
   
       foreach ($users as $user) {
           if ($user->login === $login && $user->mdp === $mdp) {
                     $_SESSION['login'] = $user->login;
                     $_SESSION['mdp'] = $user->mdp;
                     if ($_SESSION['login'] == "admin") {
                            $_SESSION['admin'] = 1;
                     }
                     else {
                            $_SESSION['admin'] = 0;
                     }
               return true; 
           }
       }
       return false; 
}
/**
 * Retourne vrai si le visiteur est un administrateur connecté <br> et autorisé à visualiser les inscriptions
 * @return booléen
 */ 
function logout()
{
    session_start();
    session_unset();
    session_destroy();
    header("Location: ./?action=programme");
    exit;
}

function estAdmin()
{
    if (isset($_SESSION['admin'])) {
            return $_SESSION['admin'] == 1;
    }
    return false;
}
