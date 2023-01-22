<?php 
         include_once("../Menu.php");
         include_once("../Footer.php");
         require_once("../include/connect.inc.php")
?>







<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />

        <link rel="stylesheet" href="panier_css.css">
    
    </head>

<body>

<div class="containeur_flex">

  <div class="containeur_panier">
         
      <div class="content">
            <div class="pdp"><img src="../Image/newpanier.png" alt="Image photo de profil"></div>
            <h1 class="monPanier">Mon Panier</h1>

            <div class="horizontal_bar_panier"></div>

        <?php

        if(isset($_SESSION['panier'])){
            $tableau = $_SESSION['panier'];
            if($tableau['refa']==null){
              echo'Le panier est vide !';

            }
              $nbArticles=count($tableau['refa']);
              $prixSousTot = 0;
              for ($i=0 ;$i < $nbArticles ; $i++){              
                  $req2= "SELECT * from article where refa = :reference";
                  $produit = oci_parse($connect, $req2);
                  oci_bind_by_name($produit, ":reference", $tableau['refa'][$i]);
                  $result = oci_execute($produit);
              
                  while (($Lesproduits=oci_fetch_assoc($produit))!=false){

                    echo'<div class="boxRecap">';

                      echo'<div class="img_info">';
                        echo'<img class="imagProduit" src="../ImageArticle/'.$Lesproduits['CATEGORIEA'].'_'.$Lesproduits['SOUSCATEGORIEA'].'_'.$Lesproduits['COULEURA'].'.jpg" alt="Titre de l image 1">';
        
                            echo $Lesproduits['CATEGORIEA'].' '.$Lesproduits['SOUSCATEGORIEA'];
                            echo'<br>';
                            echo 'Couleur: '.$Lesproduits['COULEURA'];
                            echo'<br>';
                            echo 'Taille: '.$Lesproduits['TAILLEA'];
                            echo'<br>';                  
                            echo'Quantité: '.$tableau['quantite'][$i];
                            echo'<br>';
                            $prixQuant = $Lesproduits['PRIXUNITA'] * ($tableau['quantite'][$i]);   
                            echo $prixQuant.' €';     
                            echo'
                             <form method="POST" action="SupprimerPanier.php?msg='.$i.'&art=1">
                              <input type="submit" value="Supprimer 1 article" class="boutonsupprimer"/>
                            </form>
                            <form method="POST" action="SupprimerPanier.php?msg='.$i.'&art=tous">
                              <input type="submit" value="Supprimer tout" class="boutonsupprimer2"/>
                            </form>
                            ';
                      echo'</div>';

                            /*var_dump($tableau);
                            echo'</br>';
                            var_dump($Lesproduits);*/
    
                    echo'</div>';
                    echo'</br>';
                    /*$nbQuant = count*/
                  
                    
                    $prixSousTot += $prixQuant;
                  }
                  oci_free_statement($produit);  
                }
                
            }else {
              echo'Le panier est vide !';
            }
          
        
        ?>

      </div>
    </div>
  


      <div class="containeur_recap">
         
        <div class="content">
            <h1 class="recap">Récapitulatif</h1>
            <div class="horizontal_bar_recap"></div>
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
              
              <h4>Livraison</h4>
              <p></p>
            
              <div class="horizontal_bar_recap2"></div>
              <h4 class="tot_tva">Total (TVA incluse)</h4>
                
              <?php
               if(isset($_SESSION['panier'])){
                $tableau = $_SESSION['panier'];
                if($tableau['refa']==null){
                 echo' <form method="POST" action="../Commander/Commander.php">
                     <input disabled type="submit" value="Passer la commande" class="commandesanshover"/>
                     </form>';
                }else{
                     echo' <form method="POST" action="../Commander/Commander.php">
                     <input type="submit" value="Passer la commande" class="commande"/>
                     </form>';
                }
               } 
              ?>
              <!--<div class="butt">
                  <button class="commander">Commander</button></br></br>
                  <button class="paypal">Paypal</button>
              </div>-->

        </div>  
      </div> 
</div>
      
</body>     

</html>