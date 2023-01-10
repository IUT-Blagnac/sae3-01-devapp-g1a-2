<?php
    session_start();
    require_once("../Menu.php");
    require_once("../Footer.php");
    require_once("../include/connect.inc.php");

    if(isset($_POST["couleurSelect"])){
        $_SESSION['changercouleur']='vrai';
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

    $req2= "SELECT DISTINCT * from article where categoriea = :categ and COULEURA = :couleur";
    $produit = oci_parse($connect, $req2);		
	$nom = htmlentities($_GET["nom"]); 
    $couleur = htmlentities($_GET["couleur"]);
	oci_bind_by_name($produit, ":categ", $nom);
    oci_bind_by_name($produit, ":couleur", $couleur);	
 	$result = oci_execute($produit);
    while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
        $LesproduitsCATEGORIEA = $Lesproduits['CATEGORIEA']; 
        $LesproduitsSOUSCATEGORIEA = $Lesproduits['SOUSCATEGORIEA']; 
        $LesproduitsDESCA = $Lesproduits['DESCA']; 
        $LesproduitsPRIXUNITA = $Lesproduits['PRIXUNITA']; 
        $LesproduitsNBETOILESA = $Lesproduits['NBETOILESA']; 
 }
oci_free_statement($produit);  



 $req2= "SELECT distinct COULEURA from article where categoriea = :categ";
 $produit = oci_parse($connect, $req2);
 oci_bind_by_name($produit, ":categ", $nom);
 $result = oci_execute($produit);

 while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
    $LesproduitsCOULEURA[] = $Lesproduits['COULEURA']; 
}
oci_free_statement($produit);  

$req2= "SELECT distinct TAILLEA from article where categoriea = :categ";
$produit = oci_parse($connect, $req2);
oci_bind_by_name($produit, ":categ", $nom);
$result = oci_execute($produit);

while (($Lesproduits=oci_fetch_assoc($produit))!=false) {
   $LesproduitsTAILLEA[] = $Lesproduits['TAILLEA']; 
}
oci_free_statement($produit);  


if (isset($_POST['couleurSelect'])) {
    $_SESSION['couleurSelect'] = $_POST['couleurSelect'];
  }  
$couleurS = isset($_SESSION['choix']) ? $_SESSION['choix']: '';


 echo '<div class="miseEnPage">
        <a href="../Categorie/Categorie.php"><img src="../Image/imageFlecheRetour.png" alt="retour page catalogue" ></a>
 
            <div class="container">
                <div>
                    <div class="titreproduit"><h1>'.$nom.'</h1></div>
                    <div class="product">
                        <a href="#"><img src="../ImageArticle/'.$nom.'_'.$LesproduitsSOUSCATEGORIEA.'_'.$couleur.'.jpg" alt="Titre de l image 1" class="imageproduit"></a>
                        <h3>'.$nom.' '. $LesproduitsSOUSCATEGORIEA .' '.$LesproduitsPRIXUNITA.'</h3>
                        <p>'.$LesproduitsDESCA.'</p>
                    </div>
                </div>
                <div>
                    <div class="couleurarticle">
                    <form  method="post" >
                        <select name="couleurSelect" id="couleurSelect" class="couleurSelect" onchange="this.form.submit()">';
                            foreach ($LesproduitsCOULEURA as $coul){
                                if($coul==$couleur){
                                    echo "<option selected value='".$coul."'>" . $coul . "</option>";
                                }else{
                                echo "<option value='".$coul."'>" . $coul . "</option>";
                                }
                            }
                    echo'</select>
                    </form>
                </div>';
                    echo ' <div class="taillearticle">
                    <select name="selecttaille" id="selecttaille" class="selecttaille">
                        <option selected>Selectionner une taille</option>';
                    foreach ($LesproduitsTAILLEA as $coul){
                        echo "<option>" . $coul . "</option>";
                    }
                
                /*
                if(isset($_POST["couleurSelect"])){
                    echo ' <div class="taillearticle">
                         <select name="selecttaille" id="selecttaille" class="selecttaille">
                             <option selected>Selectionner une taille</option>';
                         foreach ($LesproduitsTAILLEA as $coul){
                             echo "<option>" . $coul . "</option>";
                         }
                     }*/
                echo '</select>                
                    </div>
                </div>
            </div>';

            /*"<option value='".$coul."'>" . $coul . "</option>";

             if($coul==$couleur){
                                    echo "<option selected value='".$coul."'";($couleurS == $coul) ? 'selected' : ''; echo">" . $coul . "</option>";
                                }else{
                                echo "<option value='".$coul."'";($couleurS == $coul) ? 'selected' : ''; echo">" . $coul . "</option>";
                                }
            */
    ?>
