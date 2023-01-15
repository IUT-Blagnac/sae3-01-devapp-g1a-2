<?php
    /*session_start();*/
    require_once("../Menu.php");
    require_once("../Footer.php");
    require_once("../include/connect.inc.php")


?>
<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />  
     <link rel="stylesheet" href="rechercheParNom_css.css">           

    </head>

<body>  
<form>
   <input type="button" value="Tous les articles" onclick="window.location.href='./Categorie.php'" class="retourPageCategorie" />
</form>

<div class="div_trier">
    <?php
      /*include("./fonction.php");*/
    $var=null 
    ?>
</div>  
<?php


$req1 = 'SELECT DISTINCT categoriea, souscategoriea, couleura, desca, prixunita FROM article where UPPER(categoriea) LIKE UPPER(:cat) '.$var;
$recherche = '%'.htmlentities($_POST['search-input-barre']).'%';
$produit = oci_parse($connect, $req1);
oci_bind_by_name($produit, ":cat",$recherche );
$result = oci_execute($produit);

if (!$result) {
    $e = oci_error($produit);  // on récupère l'exception liée au pb d'execution de la requete
    print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
}
$iteration =0;
echo '  <div class="conteneur_nom_recherche">
            <p class="nom_recherche">Votre recherche : '.$_POST['search-input-barre'].'</p>
        </div> ';
echo " <div class='product-list'>";
while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
    $iteration+=1;
    echo '<div class="product">
            <a href="Produit.php?nom='.$Lesproduits['CATEGORIEA'].'&couleur='.$Lesproduits['COULEURA'].'">
            <img src="../ImageArticle/'.$Lesproduits['CATEGORIEA'].'_'.$Lesproduits['SOUSCATEGORIEA'].'_'.$Lesproduits['COULEURA'].'.jpg" alt="Titre de l image 1"></a>
            <h3>'.$Lesproduits['CATEGORIEA'].' '. $Lesproduits['SOUSCATEGORIEA'] .' '.$Lesproduits['PRIXUNITA'].'</h3>
            <p>'.$Lesproduits['DESCA'].'</p>
         </div>';
}
echo '</div>';
if($iteration==0){
    echo '<h2 class="pas_de_correspondance">La recherche ne correspond à aucun article disponible.</h2>';
}
oci_free_statement($produit);  

?>


    
</body>

