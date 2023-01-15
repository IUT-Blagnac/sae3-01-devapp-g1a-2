<?php
    require_once("../Menu.php");
    require_once("../Footer.php");
    require_once("../include/connect.inc.php")


?>
<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />  
     <link rel="stylesheet" href="CategorieParArticle_css.css">           

    </head>

<body>  
<form>
   <input type="button" value="Tous les articles" onclick="window.location.href='./Categorie.php'" class="retourPageCategorie" />
</form>

<div class="div_trier">
    <?php
        include("./fonction.php");
    ?>
</div>
  

<?php
if(isset($_GET['cat'])){
    $nom = htmlentities($_GET['cat']);
    $cate =  'categoriea';
}
if(isset($_GET['scat'])){
    $nom = htmlentities($_GET['scat']);
    $cate =  'categorieArticle';
}

    
    $req1 = 'SELECT DISTINCT categoriea, souscategoriea, couleura, desca, prixunita, nbetoilesa FROM article where '.$cate.' = :cat '.$var;

    $produit = oci_parse($connect, $req1);
    oci_bind_by_name($produit, ":cat", $nom);
    $result = oci_execute($produit);

    if (!$result) {
		$e = oci_error($produit);  // on récupère l'exception liée au pb d'execution de la requete
		print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
	}
    echo " <div class='product-list'>";
    while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
        echo '<div class="product">
                <a href="Produit.php?nom='.$Lesproduits['CATEGORIEA'].'&couleur='.$Lesproduits['COULEURA'].'"><img src="../ImageArticle/'.$Lesproduits['CATEGORIEA'].'_'.$Lesproduits['SOUSCATEGORIEA'].'_'.$Lesproduits['COULEURA'].'.jpg" alt="Titre de l image 1" class="imageproduit"></a>
                <h3>'.$Lesproduits['CATEGORIEA'].' '. $Lesproduits['SOUSCATEGORIEA'] .' '.$Lesproduits['PRIXUNITA'].'</h3>
                <p>'.$Lesproduits['DESCA'].'</p>
                <div class="avisetoile">';
             $LesproduitsNBETOILESA = $Lesproduits['NBETOILESA']; 
                            for ($i = 0 ; $i < $LesproduitsNBETOILESA ; $i+=1){
                                echo '<img src="../Image/etoilepleine.png"</img>';
                                $iteration = $i;
                            }
                            if($LesproduitsNBETOILESA==0){
                                $iteration = 0;
                            }else{
                                $iteration+=1;
                            }
                            for ($i = $iteration ; $i < 5; $i+=1){
                                echo '<img src="../Image/etoilevide.png"</img>';
                            }
                            echo $LesproduitsNBETOILESA.'/5';echo '
                        </div>
             </div>';
	}
    echo '</div>';
    oci_free_statement($produit);  

?>


    
</body>
