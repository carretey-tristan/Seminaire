<?php 
include "./vue/entete.php";
?>
<table border="1" class="tab";>
        <?php

        $creneaux = donnerLesHeuresCreneaux();
        
        foreach ($creneaux as $creneau) {
			echo "<td>" . $creneau->heure . "</td>";
			echo "<td>" . "Intervenant" . "</td>";
			echo "<td>" . "Salle" . "</td>";
            $conferences = donnerLesConferences($creneau->heure);
            foreach ($conferences as $conference) {
                echo "<tr>";

                echo "<td>" . $conference->description . "</td>";
                echo "<td>" . $conference->intervenant . "</td>";
                echo "<td>" . $conference->salle . "</td>";
                echo "</tr>";
            }
        }
		?>
</table>
<?php
include "./vue/pied.php";
?>