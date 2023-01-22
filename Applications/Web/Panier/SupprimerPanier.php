<?php
require_once("../include/connect.inc.php");
session_start();

$tab = $_GET['msg'];
$var = $_GET['art'];

if($var === '1'){
    echo 'premier if';
    $tableau = $_SESSION['panier'];
    if($tableau['quantite'][$tab]-1===0){
        unset($tableau['refa'][$tab]);
        unset($tableau['quantite'][$tab]);
        $tableau['refa'] = array_values($tableau['refa']);
        $tableau['quantite'] = array_values($tableau['quantite']);
        $_SESSION['panier']= $tableau ;
    }else{
        $tableau['quantite'][$tab]--;
        $_SESSION['panier']= $tableau ;
    }
    header('Location: ./panier.php');
    exit();
}else{
    $tableau = $_SESSION['panier'];
    unset($tableau['refa'][$tab]);
    unset($tableau['quantite'][$tab]);
    $tableau['refa'] = array_values($tableau['refa']);
    $tableau['quantite'] = array_values($tableau['quantite']);
    $_SESSION['panier']= $tableau ;
    
    header('Location: ./panier.php');
    exit();
}





/*


$tableau = $_SESSION['panier'];
            $nbArticles=count($tableau['refa']);
            $prixSousTot = 0;
            for ($i=0 ;$i < $nbArticles ; $i++)
            {

                if(isset($_SESSION['panier'])){
                    $tableau=$_SESSION['panier'];
                    unset($tableau['refa'][$i]);
                    unset($tableau['quantite'][$i]);
                }
            }




$tableau['refa'] = Array
$tableau['refa'][$i] = 232
$Lesproduits['REFA'] = 232
*/ 
?>