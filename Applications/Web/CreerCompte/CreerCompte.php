<?php 
         include_once("../Menu.php");
         include_once("../Footer.php");
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
    <form>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="surname">Prenom:</label>
        <input type="text" id="surname" name="surname" required>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <label for="phone">Téléphone:</label>
        <input type="tel" id="phone" name="phone" required>
        <label for="password">Mot de passe :</label><br>
        <input type="password" id="password" onkeyup="checkPasswordStrength()"><br>
        <meter id="passwordStrengthMeter" value="0" min="0" max="5"></meter>
        <p id="passwordStrength"></p><br>
        <label for="password2">Confirmer le mot de passe:</label><br>
        <input type="password" id="ConfirmPassword"><br>
        <input type="submit" value="Valider">
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


