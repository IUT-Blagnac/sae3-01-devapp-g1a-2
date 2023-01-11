<?php
    session_start();
    require_once("../Menu.php");
    require_once("../Footer.php");
    require_once("../include/connect.inc.php")


?>
<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />  
     <link rel="stylesheet" href="Categorie_css.css">           

    </head>

<body>  

<div class="div_trier">
    <?php
      include("./fonction.php");
    ?>
</div>  
<?php


$req1 = 'SELECT DISTINCT categoriea, souscategoriea, couleura, desca, prixunita FROM article '.$var;

$produit = oci_parse($connect, $req1);
$result = oci_execute($produit);

if (!$result) {
    $e = oci_error($produit);  // on récupère l'exception liée au pb d'execution de la requete
    print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
}
echo " <div class='product-list'>";
while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
    echo '<div class="product">
            <a href="Produit.php?nom='.$Lesproduits['CATEGORIEA'].'&couleur='.$Lesproduits['COULEURA'].'"><img src="../ImageArticle/'.$Lesproduits['CATEGORIEA'].'_'.$Lesproduits['SOUSCATEGORIEA'].'_'.$Lesproduits['COULEURA'].'.jpg" alt="Titre de l image 1"></a>
            <h3>'.$Lesproduits['CATEGORIEA'].' '. $Lesproduits['SOUSCATEGORIEA'] .' '.$Lesproduits['PRIXUNITA'].'</h3>
            <p>'.$Lesproduits['DESCA'].'</p>
         </div>';
}
echo '</div>';
oci_free_statement($produit);  

?>


    
</body>

