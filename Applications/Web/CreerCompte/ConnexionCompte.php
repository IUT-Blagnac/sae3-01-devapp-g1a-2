<?php 
         include_once("../Menu.php");
         include_once("../Footer.php");
?>


<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />

        <link rel="stylesheet" href="ConnexionCompte_css.css">
    
    </head>

<body>


<div class="background-image"></div>
<div class="content">
    
<!--  <form action="TraitConnexion.php" method="POST">  
    avec la base de donné on pourras l'utiliser -->

    <form class="formulaire" method="post">
    <label for="login">Adresse mail :</label>
    <input type="text" id="login" name="login" required>
    <label for="mdp">Mot de passe:</label>
    <input type="password" id="mdp" name="mdp" required>
    <input type='submit' name='valider' value='valider' />
    <div class="creercompte">
            <a href="CreerCompte.php" ><p>Créer un compte </p></a><br><br><br>
<?php
    session_start();
    if(isset($_POST['valider'])){
        $req = "SELECT * FROM Client";
        $lesComptes = oci_parse($connect, $req);
        $result = oci_execute($lesComptes);
        if (!$result) {
            $e = oci_error($lesComptes);
            print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
        }
        while (($unCompte = oci_fetch_assoc($lesComptes)) != false) {
            if($unCompte['EMAILC'] == htmlentities($_POST["login"]) && password_verify(htmlentities($_POST["mdp"]),$unCompte['MDPC']) ) {
                $_SESSION['acces'] = "OK";
				$_SESSION['nom'] = $unCompte['PRENOMC'];
                header('location:MonCompte.php');
            }
        }
        echo "Adresse mail / mot de passe incorrect ... ";
    }
?>
    
    </div>
</form>
</div>

</body>     