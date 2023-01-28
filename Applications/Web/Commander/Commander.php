<?php

include_once("../Menu.php");
include_once("../Footer.php");
require_once("../include/connect.inc.php");
if(!isset($_SESSION["acces"]) ) {   
    header("location:../CreerCompte/ConnexionCompte.php?msg=Connectez vous pour passer une commande.");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="commander_css.css">
    <title>Noskia</title>
</head>
<body>
    
<div class="containeur_flex">

    <div class="containeur_comm">
         
        <div class="content">
             
             <!--<h1 class="nomComm">Commande</h1>
             <a href="../Panier/panier.php"><p class="retourPanier">Retourner au panier</p><img class="retPanier" src="../Image/deconnexion.png" alt="Logo deconnexion"></a>
             <div class="horizontal_bar_comm"></div>-->

            <div class="pdp"><img src="../Image/newcompte.png" alt="Image photo de profil"></div>
            <?php
               echo "<h1 class='nom_prenom'>Commander</h1>"
            ?>
            
            <a href="../Panier/panier.php"><p class="texte_pan">Retourner au panier</p><img class="im_pan" src="../Image/icon_command.png" alt="Logo deconnexion"></a>
            <div class="horizontal_barv1"></div>

            

<?php

$req = "SELECT * FROM Client C, Domicile D WHERE D.NUMC (+) =C.NUMC AND C.NUMC =:numc";
                  $lesComptes = oci_parse($connect, $req);
                  oci_bind_by_name($lesComptes,":numc",$_SESSION["numc"]);
                  $result = oci_execute($lesComptes);
                  if (!$result) {
                     $e = oci_error($lesComptes);
                     print htmlentities($e['message'].' pour cette requete : '.$e['sqltext']);		
                  }
                  $unCompte = oci_fetch_assoc($lesComptes);



                  

                  if(isset($_SESSION['panier'])){
                      $tableau = $_SESSION['panier'];
                      
                        $nbArticles=count($tableau['refa']);
                        $prixSousTot = 0;
                        for ($i=0 ;$i < $nbArticles ; $i++){              
                            $req2= "SELECT * from article where refa = :reference";
                            $produit = oci_parse($connect, $req2);
                            oci_bind_by_name($produit, ":reference", $tableau['refa'][$i]);
                            $result = oci_execute($produit);
                            
                            while (($Lesproduits=oci_fetch_assoc($produit))!=false){
                              $prixQuant = $Lesproduits['PRIXUNITA'] * ($tableau['quantite'][$i]);
                              $prixSousTot += $prixQuant;
                            }
                            
                            oci_free_statement($produit);  
                        }
                  }
          
          


echo'
<form action="Commander.php" method="post">

<div class="delivery-options">
                <h3>Choisissez votre mode de livraison</h3></br>
                
                    <div class="group_liv">
                        <input type="radio" id="home-delivery" name="delivery-option" value="1">
                        <label for="home-delivery">Livraison à domicile</label>
                    </div>
                    <div class="group_liv">
                        <input type="radio" id="pickup-point" name="delivery-option" value="2">
                        <label for="pickup-point">Retrait en point relais</label>
                    </div>
</div>
</br></br>
<h3>Informations de paiement</h3></br>

<div class="nomPrenom">
  <div class="form-group">
    <label for="name">Nom</label></br>
    <input type="text" class="form-control" id="name" name="name" required value='.$unCompte['NOMC'].'>
  </div>
  <div class="form-group">
    <label for="surname">Prenom</label></br>
    <input type="text" class="form-control" id="surname" name="surname" required value='.$unCompte['PRENOMC'].'>
  </div>
</div></br>

<div class="form-group">
    <label for="adress">Adresse</label></br>';
    echo"
    <input type='text' class='form-control' id='adress' name='adress' required value='".$unCompte['ADRESSED']."'>";
    echo'
</div></br>

<div class="postvillepays">
    <div class="form-group">
        <label for="postal">Code postal</label></br>
        <input type="text" class="form-control" id="postal" name="postal" required value='.$unCompte['POSTALD'].' maxlength="5" onkeyup="onlynumber(this)">
    </div>
    <div class="form-group">
        <label for="ville">Ville</label></br>
        <input type="text" class="form-control" id="ville" name="ville" required value='.$unCompte['VILLED'].'>
    </div>
    <div class="form-group">
        <label for="pays">Pays/Région</label></br>
        <input type="text" class="form-control" id="pays" name="pays" required value="France">
    </div>
</div></br>

<div class="emailtel">
  <div class="form-group">
    <label for="email">Email</label></br>
    <input type="email" class="form-control" id="email" name="email" required value='.$unCompte['EMAILC'].'>
  </div>
  <div class="form-group">
    <label for="numTel">Numéro de téléphone</label></br>
    <input type="text" class="form-control" id="tel" name="tel" required value='.$unCompte['NUMTELC'].'>
  </div>
</div></br>

<div class="groupCB">
  <div class="form-group">
    <label for="card-number">Numéro de carte</label></br>
    <input type="text" class="form-control" id="card-number" name="card-number" maxlength="16" onkeyup="addSpaces4(this)">
  </div>
  <div class="form-group">
    <label for="expiry-date">Date d expiration</label></br>
    <input type="text" class="form-control" id="expiry-date" name="expiry-date">
  </div>
  <div class="form-group">
    <label for="cvv">CVV</label></br>
    <input type="text" class="form-control" id="cvv" name="cvv" maxlength="3" onkeyup="onlynumber(this)">
  </div>
</div>';


$deliveryOpt = $_POST['delivery-option'];
if ($deliveryOpt == 1) {
  $prixLivr = 5.99;
  echo $prixLivr.' €';
} elseif ($deliveryOpt == 2) {
  $prixLivr = 2.99;
  echo $prixLivr.' €';
} else{
  $prixLivr = 0;
  echo $prixLivr.' €';
}
         
?>
<script>
function onlynumber(input) {
    input.value = input.value.replace(/[^\d]/g,'').trim();
}

function addSpaces4(input) {
    input.value = input.value.replace(/(.{4})/g, '$1 ');
}
</script>
        </div>  
    </div>






    <div class="containeur_recapi">
         
        <div class="content">
            <?php
                echo "<h1 class='recapp'>Récapitulatif</h1>"
            ?>
            <div class="horizontal_barv2"></div>

            <div class="infoRecap">
                <div class="prixSous">
                    <h4>Sous-total</h4>
                    <?php
                    if(isset($_SESSION['panier'])){
                        echo $prixSousTot.' €';
                    }else{
                        echo '0 €';
                    }
                  ?>
                </div>
                  
                <div class="prixliv">
                  <h4>Livraison</h4>
                  <?php
                  $prixLivr = 0;
                  /*if(isset($_POST['delivery-option']) && $_POST['delivery-option'] == 1){
                    $prixLivr = 5.99;
                    echo $prixLivr.' €';
                  }elseif(isset($_POST['delivery-option']) && $_POST['delivery-option'] == 2){
                    $prixLivr = 2.99;
                    echo $prixLivr.' €';
                  }else{
                    $prixLivr = 0;
                    echo $prixLivr.' €';
                  }
                  var_dump($_POST['delivery-option'] == 1);*/

                  


                  
                    
                  
                  ?>
                </div>
                  
                  <p></p>
                  <div class="horizontal_bar2v2"></div>
                  <h4 class="tot_tva">Total (TVA incluse)</h4>
                  </br>
                  <button type="submit" class="btn-primary">Payer</button>
            </div>
             
         </div>  
     </div> 
</div>
</form>

</body>
</html>



