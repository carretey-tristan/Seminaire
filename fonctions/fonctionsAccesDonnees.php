<?php
/**
 * @access private
 * @return type
 */
function chargeJSONseminaire()
{
       $json_source = file_get_contents('data/seminaire.json');
       $document = json_decode($json_source);
       return $document;
}
 
/**
 * @access private
 * @return type
 */
function chargeJSONprofessions()
{
       $json_source = file_get_contents('data/professions.json');
       $document = json_decode($json_source);
       return $document;
}

function donnerIntituleSeminaire()
{
       $json_source = file_get_contents('data/seminaire.json');
       $document = json_decode($json_source);
       return $document->seminaire->intitule;
}

function donnerLesHeuresCreneaux()
{
       $json_source = file_get_contents('data/seminaire.json');
       $document = json_decode($json_source);
       return $document->seminaire->creneau;
}

function donnerLesConferences($heure) {
       $json_source = file_get_contents('data/seminaire.json');
       $document = json_decode($json_source);
   
       $creneaux = $document->seminaire->creneau;
   
       foreach ($creneaux as $creneau) {
           if ($creneau->heure === $heure) {
               return $creneau->conference; 
           }
       }
       return []; 
   }

function chargeJSONadmin()
{
       $json_source = file_get_contents('data/admin.json');
       $document = json_decode($json_source);
       return $document->users;
}

function donnerToutesLesConferences()
{
       $json_source = file_get_contents('data/seminaire.json');
       $document = json_decode($json_source);
       return $document->seminaire->creneau;
}