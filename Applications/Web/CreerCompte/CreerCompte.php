<?php 
         include_once("../Menu.php");
         include_once("../Footer.php");
         require_once("../include/connect.inc.php")
?>


<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />

        <link rel="stylesheet" href="CreerCompte_css.css">
    
    </head>

<body>


<div class="background-image"></div>
<div class="content">
    
    <form method="POST" class="creercompte">
    <h1>Créer un compte</h1>
    <?php
            if(isset($_POST["Valider"])){
                $compteExistant = False;
                $req = "SELECT * FROM Client";
                $lesComptes = oci_parse($connect, $req);
                $result = oci_execute($lesComptes);
                if (!$result) {
                    $e = oci_error($lesComptes);
                    print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
                }
                while (($unCompte = oci_fetch_assoc($lesComptes)) != false) {
                    if($unCompte['EMAILC'] == htmlentities($_POST["email"]) ) {
                        $compteExistant = True;
                    }
                }
                
                if($_POST["password2"]!=$_POST["password"]) {
                    echo "Il faut que les deux mdp soit différent";
                } elseif ($compteExistant) {
                    echo "Cet email est déjà utilisé pour un compte, essayé de vous connecter ...";
                } else {
                    $nom = htmlentities($_POST["name"]);
                    $prenom = htmlentities($_POST["surname"]);
                    $genre = htmlentities($_POST["LD_genre"]);
                    $numTel = htmlentities($_POST["phone"]);
                    $dteNaissance = htmlentities($_POST["date"]);
                    $email = htmlentities($_POST["email"]);
                    $mdp = password_hash(htmlentities($_POST["password"]), PASSWORD_DEFAULT);
    
                    $req = "INSERT INTO Client (numc,nomc,prenomc,genrec,numtelC,naissancec,emailc,mdpc)
                            VALUES (seq_client.NEXTVAl,:nomc,:prenomc,:genrec,:numtelC,TO_DATE(:naissancec, 'yyyy/mm/dd'),:emailc,:mdpc)";
    
                    $leClient = oci_parse($connect, $req);
                    oci_bind_by_name($leClient,":nomc",$nom);
                    oci_bind_by_name($leClient,":prenomc",$prenom);
                    oci_bind_by_name($leClient,":genrec",$genre);
                    oci_bind_by_name($leClient,":numtelC",$numTel);
                    oci_bind_by_name($leClient,":naissancec",$dteNaissance);
                    oci_bind_by_name($leClient,":emailc",$email);
                    oci_bind_by_name($leClient,":mdpc",$mdp);

                    $result = oci_execute($leClient);

                    $req2 = "INSERT INTO Domicile VALUES (seq_domicile.NEXTVAl,:adressed,:postald,:villed,seq_client.CURRVAL,1)";

                    $adressed = htmlentities($_POST["adresse"]);
                    $postald = htmlentities($_POST["cpostal"]);
                    $villed = htmlentities($_POST["ville"]);

                    $sonDomicile = oci_parse($connect, $req2);
                    oci_bind_by_name($sonDomicile,":adressed",$adressed);
                    oci_bind_by_name($sonDomicile,":postald",$postald);
                    oci_bind_by_name($sonDomicile,":villed",$villed);

                    $result2 = oci_execute($sonDomicile);
                    
                    if (!$result) {
                        $e = oci_error($leClient);  // on récupère l'exception liée au pb d'execution de la requete (violation PK par exemple)
                        print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
                    } elseif (!$result2){
                        $e = oci_error($sonDomicile);  // on récupère l'exception liée au pb d'execution de la requete (violation PK par exemple)
                        print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);
                    } else {
                        echo "<label>Inscription réussi avec succès</label>";
                    }
                }          
            }
        ?>
            
            <label for="name">Nom:</label>
            <input class="input" type="text" id="name" name="name" required>
            <label for="surname">Prenom:</label>
            <input class="input"type="text" id="surname" name="surname" required>
            <label for="email">Email:</label>
            <input class="input" type="email" id="email" name="email" required>
            <label for="phone">Téléphone:</label>
            <input class="input" type="tel" id="phone" name="phone" required>
            <label for="Genre"> Genre :</label>
            <select class="genre" name='LD_genre' required>
                <option value='homme'>Homme</option>
                <option value='femme'>Femme</option>
            </select><BR>
            <label for="dteNaissance"> Date de naissance :</label>
            <input class="input" type="date" id="date" name="date" required>
            
            <label for="password">Mot de passe :</label>
            <input class="input" type="password" name="password"id="password" onkeyup="checkPasswordStrength()"><br>
            <meter id="passwordStrengthMeter" value="0" min="0" max="5"></meter>
            <p id="passwordStrength"></p><br>
            <label for="password2">Confirmer le mot de passe:</label>
            <input class="input" type="password" name="password2" id="ConfirmPassword">
            <BR><BR><BR>
            <h2>Votre adresse :</h2>
            <label for="name">Adresse:</label>
            <input class="input" type="text" id="adresse" name="adresse" required>
            <label for="name">Code postal:</label>
            <input class="input" type="text" id="cpostal" name="cpostal" required>
            <label for="name">Ville:</label>
            <input class="input" type="text" id="ville" name="ville" required>            
        
            <input class="input" type="submit" name="Valider" value="Valider"> 
            
            <div class="Seconnecter">
                <a href="ConnexionCompte.php" ><p>Se connecter </p></a>
            </div>
        
    </form>
    

</div>
<script>
function checkPasswordStrength() {
  // Récupérer la valeur du champ mot de passe
  var password = document.getElementById("password").value;

  // Initialiser le score à 0
  var strength = 0;

  // Si le mot de passe est vide, masquer la range et le message
  if (password.length === 0) {
    document.getElementById("passwordStrengthMeter").style.display = "none";
    document.getElementById("passwordStrength").style.display = "none";
    return;
  }

  // Afficher la range et le message
  document.getElementById("passwordStrengthMeter").style.display = "block";
  document.getElementById("passwordStrength").style.display = "block";

  // Incrémenter le score pour chaque critère rempli
  if (password.length >= 8) strength += 1;
  if (password.match(/[a-z]/)) strength += 1;
  if (password.match(/[A-Z]/)) strength += 1;
  if (password.match(/[0-9]/)) strength += 1;
  if (password.match(/[^a-zA-Z0-9]/)) strength += 1;

  // Mettre à jour la valeur de la range en fonction du score
  document.getElementById("passwordStrengthMeter").value = strength;

  // Définir la couleur de la range en fonction du score
  var passwordStrengthMeter = document.getElementById("passwordStrengthMeter");
  if (strength === 0) passwordStrengthMeter.style.color = "#CCC";
  else if (strength === 1) passwordStrengthMeter.style.color = "red";
  else if (strength === 2) passwordStrengthMeter.style.color = "orange";
  else if (strength === 3) passwordStrengthMeter.style.color = "yellow";
  else if (strength === 4) passwordStrengthMeter.style.color = "blue";
  else passwordStrengthMeter.style.color = "green";

  // Définir le message à afficher en fonction du score
  var passwordStrength;
  if (strength < 2) passwordStrength = "Faible";
  else if (strength === 2) passwordStrength = "Moyen";
  else if (strength === 3) passwordStrength = "Bon";
  else if (strength === 4) passwordStrength = "Fort";
  else passwordStrength = "Excellent";

  // Afficher le message
  document.getElementById("passwordStrength").innerHTML = passwordStrength;
}
</script>



</body>     

</html>
