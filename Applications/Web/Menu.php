<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />
    

        <link rel="stylesheet" href="../menu_css.css">  
    
    </head>

<body>
<style>
  @font-face {
    font-family: 'grottamedium';
    src: url('../font/grotta-medium-webfont.woff2') format('woff2'),
        url('../font/grotta-medium-webfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }
  * {
    font-family: 'grottamedium';
  } 
</style>
<header>
<div class="header">
  <a href="../Index/index.php"><img src="../Image/logo.png" alt="Logo" class="logo"></a>
  <span class="title">Noskia</span>
  <input type="text" placeholder="Rechercher" class="search-input">
  <button class="btn btn-primary">Rechercher</button>
  <!-- mettre image de recherche qui est dans ../Image/logorecherche.png -->

  <div class ="entreprisediv">
    <a href="../NotreEntreprise/NotreEntreprise.php"><img src="../Image/entreprise.jpg" alt="entreprise" class="entreprise"><p>Notre entreprise</p></a>
  </div>
  <div class ="comptediv">
    <a href="../CreerCompte/ConnexionCompte.php"><img src="../Image/compte.png" alt="compte" class="compte"><p>Mon compte</p></a>
  </div>

  <div class ="panierdiv">
    <a href="../Index/index.php"><img src="../Image/panier.png" alt="panier" class="panier"><p>Panier</p></a>
  </div>

</div>

        <nav class="menu">
            <ul>
                <li><a href="../Index/index.php">Accueil</a></li>
                    <li class="deroulant"><a href="#">Categorie</a>
                        <ul class="sous">
                            <li><a href="#">Protection</a></li>
                            <li><a href="#">Equipement</a></li>
                            <li><a href="#">Skis</a></li>
                            <li><a href="#">Snowboard</a></li>
                            <li><a href="#">Vetements</a></li>
                            <li><a href="#">Luges</a></li>
                            <li><a href="#">Bobsleigh</a></li>
                        </ul>
                    </li>
                <li><a href="../NotreEntreprise/NotreEntreprise.php">Notre Entreprise</a></li>   
                <li><a href="../Contact/Contact.php">Contact</a></li>
                <li><a href="../CreerCompte/CreerCompte.php">Connexion/Deconnexion</a></li>
            </ul>
        </nav>
      </header>
</html>