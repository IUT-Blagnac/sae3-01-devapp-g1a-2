<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />
    

        <link rel="stylesheet" href="../menu_css.css">  
    
    </head>

<body>
<header>


<div class="head">

  <a href="../Index/index.php"><img class="logNoskia" src="../Image/logo.png" alt="logNoskia"></a>
  <span class="title">Noskia</span>
  <input type="search" placeholder="  Rechercher" class="search-input">

  
  
  <a href="../CreerCompte/MonCompte.php"><button class="compte" ><img src="../Image/newcompte.png" alt="cpt"></button></a>

  <div class="test4">
  <a href="../Panier/panier.php"><button class="panier" ><img src="../Image/newpanier.png" alt="pan"></button></a></div>

  <div class="test5">
  <a href="../NotreEntreprise/NotreEntreprise.php"><button class="entreprise"><img src="../Image/letsgo.png" alt="entr"></button></a></div>
  
  
</div>
<nav class="menu">
            <ul>
                <li><a href="../Categorie/Categorie.php">Tous les produits</a></li>
                    <li class="deroulant"><a href="../Categorie/Categorie.php">Protection</a>
                        <ul class="sous">
                            <li><a href="../Categorie/CategorieParArticle.php?cat=Masques">Masques</a></li>
                            <li><a href="../Categorie/CategorieParArticle.php?cat=Casques">Casques</a></li>
                        </ul>
                    </li>
                <li><a href="../Categorie/CategorieParArticle.php?cat=Skis">Skis</a></li>   
                <li><a href="../Categorie/CategorieParArticle.php?cat=Snowboard">Snowboard</a></li>
                <li class="deroulant"><a href="../Categorie/Categorie.php">Vetements</a>
                    <ul class="sous">
                            <li><a href="../Categorie/CategorieParArticle.php?cat=Gants">Gants</a></li>
                            <li><a href="../Categorie/CategorieParArticle.php?cat=Vestes">Vestes</a></li>
                    </ul>
                <li><a href="../Categorie/CategorieParArticle.php?cat=Luges">Luges</a></li>
                <li><a href="../Categorie/CategorieParArticle.php?cat=Bobsleighs">Bobsleigh</a></li>
            </ul>
        </nav>


      </header>
</html>

