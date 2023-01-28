<?php
require_once("../include/connect.inc.php");
session_start();
if($_POST['selecttaille']=='default'){
    header('Location: Produit.php?nom='.$_GET['name'].'&couleur='.$_GET['couleur'].'&msg=864');
    exit;
}

    $nom= htmlentities($_GET['name']);
    $couleur=htmlentities($_GET['couleur']);
    $taille=htmlentities($_POST['selecttaille']);


    $req2= "SELECT REFA from article where categoriea = :categ and COULEURA = :couleur and TAILLEA = :tail";
    $produit = oci_parse($connect, $req2);		

	oci_bind_by_name($produit, ":categ", $nom);
    oci_bind_by_name($produit, ":couleur", $couleur);	
    oci_bind_by_name($produit, ":tail", $taille);	
 	$result = oci_execute($produit);
    $Lesproduits=oci_fetch_assoc($produit);


    if(isset($_SESSION['panier'])){      
        $tableau=$_SESSION['panier'];
        if(in_array($Lesproduits['REFA'], $tableau['refa'])){
            $iteration=0;
            foreach($tableau['refa'] as $val){
                if ($val ==$Lesproduits['REFA']){
                    $tableau['quantite'][$iteration] = $tableau['quantite'][$iteration]+=htmlentities($_POST['selectquantite']);
                }
                $iteration++;
            }
        }else {
            array_push($tableau['refa'], $Lesproduits['REFA']);
            array_push($tableau['quantite'], htmlentities($_POST['selectquantite']));
        }
      
    }else{        
        $tableau = [
            'refa' => [$Lesproduits['REFA']],
            'quantite' => [htmlentities($_POST['selectquantite'])]
        ];
        print_r($_SESSION['panier']);
    
    }

    $_SESSION['panier']=$tableau;
    
   header('Location: Produit.php?nom='.$_GET['name'].'&couleur='.$_GET['couleur']);
    exit;

?>