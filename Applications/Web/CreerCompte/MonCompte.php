<?php 
   session_start();
   include_once("../Menu.php");
   include_once("../Footer.php");
   if(!isset($_SESSION["acces"]) && !$_SESSION["acces"] == "OK") {
      header("location:ConnexionCompte.php?msg=Vous n'êtes pas connecté.");
      
   } else {
      echo "Bonjour ".$_SESSION["nom"]." !";
   }
?>