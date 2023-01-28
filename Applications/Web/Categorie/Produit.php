<?php
   /* session_start();*/
    require_once("../Menu.php");
    require_once("../Footer.php");
    require_once("../include/connect.inc.php");

    if(isset($_POST["couleurSelect"])){
        header("Location: ./Produit.php?nom=".$_GET["nom"]."&couleur=".$_POST["couleurSelect"]);
    } 
   

?>
<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />  
     <link rel="stylesheet" href="Produit_css.css">           

    </head>

<body>  


<?php
/*recuperer la categorie, la description, le prix, la souscategorie*/
    $req2= "SELECT DISTINCT * from article where categoriea = :categ and COULEURA = :couleur";
    $produit = oci_parse($connect, $req2);		
	$nom = htmlentities($_GET["nom"]); 
    $couleur = htmlentities($_GET["couleur"]);
	oci_bind_by_name($produit, ":categ", $nom);
    oci_bind_by_name($produit, ":couleur", $couleur);	
 	$result = oci_execute($produit);
    while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
        $LesproduitsCATEGORIEA = $Lesproduits['CATEGORIEA']; 
        $LesproduitsCATEGORIEARTICLE = $Lesproduits['CATEGORIEARTICLE']; 
        $LesproduitsSOUSCATEGORIEA = $Lesproduits['SOUSCATEGORIEA']; 
        $LesproduitsDESCA = $Lesproduits['DESCA']; 
        $LesproduitsPRIXUNITA = $Lesproduits['PRIXUNITA']; 
 }
oci_free_statement($produit);  


/* recuperer que les couleurs */
 $req2= "SELECT distinct COULEURA from article where categoriea = :categ";
 $produit = oci_parse($connect, $req2);
 oci_bind_by_name($produit, ":categ", $nom);
 $result = oci_execute($produit);

 while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
    $LesproduitsCOULEURA[] = $Lesproduits['COULEURA']; 
}
oci_free_statement($produit);  

/* requete pour a taille et le stock*/
$req2= "SELECT distinct TAILLEA, stocka from article where categoriea = :categ";
$produit = oci_parse($connect, $req2);
oci_bind_by_name($produit, ":categ", $nom);
$result = oci_execute($produit);

while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
   $LesproduitsTAILLEA[] = $Lesproduits['TAILLEA']; 
   $LesproduitsSTOCKA[] = $Lesproduits['STOCKA']; 
}
oci_free_statement($produit);  
/* requete pour le nombre d'etoile*/
$req2= "SELECT distinct NBETOILESA from article where categoriea = :categ and couleura =:coul";
$produit = oci_parse($connect, $req2);
oci_bind_by_name($produit, ":categ", $nom);
oci_bind_by_name($produit, ":coul", $couleur);
$result = oci_execute($produit);

while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
    $LesproduitsNBETOILESA = $Lesproduits['NBETOILESA']; 
}
oci_free_statement($produit);  

$couleurS = isset($_SESSION['choix']) ? $_SESSION['choix']: '';
echo '
 <div class="miseEnPage">
                 <a href="../Categorie/Categorie.php"><img src="../Image/imageFlecheRetour.png" alt="retour page catalogue" class="img_retour_menu"></a>
            <div class="container">                    
                    <div class="product">
                        <a href="#"><img src="../ImageArticle/'.$nom.'_'.$LesproduitsSOUSCATEGORIEA.'_'.$couleur.'.jpg" alt="Titre de l image 1" class="imageproduit"></a>
                    </div>                
                <div class="description_a_droite_image">
                    <div class="titreproduit">
                        <h1>'.$nom.' '.$couleur.'</h1>
                    </div>
                    <div class="prixetetoile">
                        <div class="affichageprixarticle">
                            <p>'.$LesproduitsPRIXUNITA.'€</p>
                        </div>
                        <div class="avisetoile">';
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
                    </div>
                    <div class="description_produit">
                        <p>'.$LesproduitsDESCA.'</p>
                    </div>
                    <div class="couleurarticle">
                        <form  method="post" >
                        Couleur :</br>
                            <select name="couleurSelect" id="couleurSelect" class="couleurSelect" onchange="this.form.submit()">';
                                foreach ($LesproduitsCOULEURA as $coul){
                                    if($coul==$couleur){
                                        echo "<option selected value='".$coul."'>" . $coul . "</option>";
                                    }else{
                                    echo "<option value='".$coul."'>" . $coul . "</option>";
                                    }
                                }echo'
                            </select>
                        </form>
                    </div>
                    <form method="post" action="AjoutPanier.php?name='.$nom.'&couleur='.$couleur.'">
                        Taille :</br>'; echo '
                        <div class="taillearticle">
                            <select name="selecttaille" id="selecttaille" class="selecttaille" ">
                                <option selected value="default">Selectionner une taille</option>';
                                foreach ($LesproduitsTAILLEA as $coul){
                                    echo "<option>" . $coul . "</option>";
                                }  echo '
                            </select>  
                        </div>
                            <div class="quantiteArticle">
                                Quantité :</br>
                                <select name="selectquantite" id="selectquantite" class="selectquantite" ">
                                    <option selected value="1">1</option>';
                                    for($i=2;$i<11;$i+=1){
                                        echo "<option value='".$i."'>" . $i . "</option>";
                                    }  echo '
                            </select>  
                        </div>                            
                        <input type="submit" class="bouttonpanier" value="Ajouter au panier"/> ';
                        if(isset($_GET['msg'])){
                            ?>
                            <script>
                                window.alert('Veuillez sélectionner une taille!');
                                var currentUrl = window.location.href;
                                var nouveauMot = currentUrl.split('&msg');
                                history.pushState(null, null, nouveauMot[0]);
                            </script>
                            <?php
                            }echo '
                    </form>
                </div>
            </div>
        </div>';
?>
<h2 class="Produit_similaire">Produit similaire</h2>
<?php

    $req1 = 'SELECT DISTINCT categoriea, souscategoriea, couleura, desca, prixunita FROM article where categorieArticle = :cat ORDER BY DBMS_RANDOM.RANDOM() ';

    $produit = oci_parse($connect, $req1);
    oci_bind_by_name($produit, ":cat", $LesproduitsCATEGORIEARTICLE);
    $result = oci_execute($produit);
    

    if (!$result) {
		$e = oci_error($produit);  // on récupère l'exception liée au pb d'execution de la requete
		print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
	}
    echo " <div class='list_produit_similaire'>";
        $iteration=0;
    while (($Lesproduits=oci_fetch_assoc($produit))!=false && $iteration<5) {
        echo '<div class="image_similaire">
                <a href="Produit.php?nom='.$Lesproduits['CATEGORIEA'].'&couleur='.$Lesproduits['COULEURA'].'"><img src="../ImageArticle/'.$Lesproduits['CATEGORIEA'].'_'.$Lesproduits['SOUSCATEGORIEA'].'_'.$Lesproduits['COULEURA'].'.jpg" alt="Titre de l image 1"></a>
                <h3>'.$Lesproduits['CATEGORIEA'].' '. $Lesproduits['SOUSCATEGORIEA'] .' '.$Lesproduits['PRIXUNITA'].'€</h3>
                <p>'.$Lesproduits['DESCA'].'</p>
                
             </div>';
             $iteration++;
	}
    echo '</div>';
    oci_free_statement($produit);  
    ?>

<script>
$(document).ready(function() {
  $("body").delay(5000).fadeOut(1000);
  setTimeout(function(){ location.href='your_page.html'; }, 6000);
});

$.ajax({
  url: 'Produit.php',
  type: 'POST',
  data: { name: 'John', location: 'Boston' },
  success: function (data) {
    // Code à exécuter en cas de réussite
    console.log(data);
  },
  error: function (xhr, status, error) {
    // Code à exécuter en cas d'erreur
    console.log(error);
  }
});
</script>

</body>
</html>