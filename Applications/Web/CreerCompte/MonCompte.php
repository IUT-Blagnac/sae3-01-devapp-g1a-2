<?php 

   
   require_once("../Menu.php");
   require_once("../Footer.php");
   require_once("../include/connect.inc.php");
   if(!isset($_SESSION["acces"]) ) {   
      header("location:ConnexionCompte.php?msg=Vous n'êtes pas connecté.");
}
   
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="MonCompte_css.css"> 
   <title>Noskia</title>
</head>
<body>
   <div class="containeur_flex">

      <form class="sous_menu" method="POST">
         <div class="menu_items">
            <input type="submit" class="submit" name="acceuil" value="Accueil et historique">
            <img src="../Image/imageFlecheRetour.png" alt="Image d'une flêche">
         </div>
         <div class="menu_items">
            <input type="submit" class="submit" name="modifier" value="Modifier mes informations">
            <img src="../Image/imageFlecheRetour.png" alt="Image d'une flêche">
         </div>
      </form>
      <div class="containeur_compte">
         
         <div class="content">
            <div class="pdp"><img src="../Image/newcompte.png" alt="Image photo de profil"></div>
            <?php
               echo "<h1 class='nom_prenom'>".$_SESSION["nom"]." ".$_SESSION["prenom"]."</h1>"
            ?>
            <h5 class="member">Membre Noskia</h5>
            <a href="TraitDeconnexion.php"><p class="sedeco">Se deconnecter</p><img class="deco" src="../Image/deconnexion.png" alt="Logo deconnexion"></a>
            <div class="horizontal_bar"></div>
            
      

            <?php
               if(isset($_POST["modifier"])) {
                  $req = "SELECT * FROM Client C, Domicile D WHERE D.NUMC (+) =C.NUMC AND C.NUMC =:numc";
                  $lesComptes = oci_parse($connect, $req);
                  oci_bind_by_name($lesComptes,":numc",$_SESSION["numc"]);
                  $result = oci_execute($lesComptes);
                  if (!$result) {
                     $e = oci_error($lesComptes);
                     print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
                  }
                  $unCompte = oci_fetch_assoc($lesComptes);
                  echo "
                  <h2 class='titre_bienvenu'>Modifier mes informations</h2 >
                  <div class='container_form_modif'>
                     <form class='modifier_infos' method='POST'>
                     <h3>Informations générale :</h3>
                     <label for='name'>Nom:</label>
                     <input class='input' type='text' id='name' name='name' required value='".$unCompte['NOMC']."'><br>
                     <label for='surname'>Prenom:</label>
                     <input class='input'type='text' id='surname' name='surname' required value='".$unCompte['PRENOMC']."'><br>
                     <label for='email'>Email:</label>
                     <input class='input' type='email' id='email' name='email' required value='".$unCompte['EMAILC']."'><br>
                     <label for='phone'>Téléphone:</label>
                     <input class='input' type='tel' id='phone' name='phone' required value='".$unCompte['NUMTELC']."'><br>
                     <label for='Genre'> Genre :</label>
                     <select class='genre' name='LD_genre' required><br>
                        <option value='homme'>Homme</option>
                        <option value='femme'" ;
                        if ($unCompte['GENREC']=='femme'){
                           echo " selected='selected' ";
                        }
                        echo ">Femme</option>
                     </select><BR>
                     <label for='dteNaissance'> Date de naissance :</label>
                     <input class='input' type='date' id='date' name='date' required value='".date('Y-m-d', strtotime($unCompte['NAISSANCEC']))."'><br><br>
                     <h3>Adresse :</h3>
                     <label for='name'>Adresse:</label>
                     <input class='input' type='text' id='adresse' name='adresse' required value='".$unCompte['ADRESSED']."'><br>
                     <label for='name'>Code postal:</label>
                     <input class='input' type='text' id='cpostal' name='cpostal' required value='".$unCompte['POSTALD']."'><br>
                     <label for='name'>Ville:</label>
                     <input class='input' type='text' id='ville' name='ville' required value='".$unCompte['VILLED']."'><br><br>
                     <input type='submit' name='modifierlesinfos' value='Modifier'>
                     </form>
                  </div>";

                  
               } else {
                  echo "<h2 class='titre_bienvenu'>Bienvenue sur votre espace personnel.</h2 >";
                  echo "<p class='txt_histo'> Historique des commandes :</p>";
                  echo "<div class='historique'><p>À implémenter ...</p></div>";
               }

               if(isset($_POST["modifierlesinfos"])){
                  $nom = htmlentities($_POST["name"]);
                  $prenom = htmlentities($_POST["surname"]);
                  $genre = htmlentities($_POST["LD_genre"]);
                  $numTel = htmlentities($_POST["phone"]);
                  $dteNaissance = htmlentities($_POST["date"]);
                  $email = htmlentities($_POST["email"]);

                  $req = "UPDATE Client 
                          SET nomc=:nomc, 
                           prenomc=:prenomc, 
                           genrec=:genrec,
                           numtelc=:numtelc,
                           naissancec=TO_DATE(:naissancec, 'yyyy/mm/dd'),
                           emailc=:emailc 
                          WHERE numc=:numc";

                  $modif = oci_parse($connect, $req);
                  oci_bind_by_name($modif,":nomc",$nom);
                  oci_bind_by_name($modif,":prenomc",$prenom);
                  oci_bind_by_name($modif,":genrec",$genre);
                  oci_bind_by_name($modif,":numtelc",$numTel);
                  oci_bind_by_name($modif,":naissancec",$dteNaissance);
                  oci_bind_by_name($modif,":emailc",$email);
                  oci_bind_by_name($modif,":numc",$_SESSION["numc"]);

                  $result = oci_execute($modif);   
                  if (!$result) {
                     $e = oci_error($modif);
                     print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
                  }  

                  $req2 = "UPDATE Domicile 
                          SET adressed=:adressed, 
                           postald=:postald, 
                           villed=:villed
                          WHERE numc=:numc";

                  $adressed = htmlentities($_POST["adresse"]);
                  $postald = htmlentities($_POST["cpostal"]);
                  $villed = htmlentities($_POST["ville"]);

                  $sonDomicile = oci_parse($connect, $req2);
                  oci_bind_by_name($sonDomicile,":adressed",$adressed);
                  oci_bind_by_name($sonDomicile,":postald",$postald);
                  oci_bind_by_name($sonDomicile,":villed",$villed);
                  oci_bind_by_name($sonDomicile,":numc",$_SESSION["numc"]);

                  $result2 = oci_execute($sonDomicile);

                  echo "Informations modifier avec succès."; 
               }

               
            ?>

         </div>
      </div>
   </div>
</body>
</html>