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
<?php
    if(isset($_POST['valider'])){
        header('location:MonCompte.php');
    }
?>

<div class="background-image"></div>
<div class="content">
    
<!--  <form action="TraitConnexion.php" method="POST">  
    avec la base de donné on pourras l'utiliser -->

<form class="formulaire" method="post">
    <label for="login">Login:</label>
    <input type="text" id="login" name="login" required>
    <label for="mdp">Mot de passe:</label>
    <input type="password" id="mdp" name="mdp" required>
    <input type='submit' name='valider' value='valider' />
    <div class="creercompte">
        <a href="CreerCompte.php" ><p>Créer un compte </p></a>
    </div>

  </form>
</div>

</body>     