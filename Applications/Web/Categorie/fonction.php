<?php
if (isset($_POST['trier'])) {
    $_SESSION['choix'] = $_POST['trier'];
  }  
$choix = isset($_SESSION['choix']) ? $_SESSION['choix']: '';
?>
    <form method="post">
        <select name="trier" class="trier" onchange="this.form.submit()">
            <option value="option" >Notre sélection</option>
            <option value="croissant" <?php echo ($choix == 'croissant') ? 'selected' : ''; ?>>Prix croissant</option>
            <option value="decroissant" <?php echo ($choix == 'decroissant') ? 'selected' : ''; ?>>Prix décroissant</option>
        </select>
       
    <form>
</div>

    <?php

    $var ="";
    if(isset($_POST["trier"])){
        if($_POST["trier"] == "croissant"){
            $var= "order by prixunita ASC";
        }
        if($_POST["trier"] == "decroissant"){
            $var= "order by prixunita DESC";
        }
    }
?>