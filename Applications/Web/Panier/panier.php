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
         </div>
      </div>


      <div class="containeur_recap">
         
        <div class="content">
            <h1 class="recap">Récapitulatif</h1>
            <div class="horizontal_bar_recap"></div>
            <div class="test6">
              <h4>Sous-total</h4>
              <h4>Livraison</h4>
            </div>
              <div class="horizontal_bar_recap2"></div>
              <h4 class="tot_tva">Total (TVA incluse)</h4>
            

              <div class="butt">
              <button class="commander">Commander</button>
              <button class="paypal">Paypal</button>
              </div>

        </div>

        
      </div>

      
</div>
      
      


</body>     

</html>