<?php

session_start();

if( isset($_POST['valider']) && isset($_POST['login']) && isset($_POST['password'])){
	if(($_POST['login'] == "Achille") && ($_POST['password'] == "Talon")){ /*Possibilité de tout mettre dans le if du dessus */
		$_SESSION['acces'] = "oui";
		$_SESSION['nom'] = htmlentities($_POST['login']);		
		if(isset($_POST['souvenir'])){
			setcookie("cookIdent", $_POST['login'],time()+60*60*24*182 );
		}
		header('location: index.php');
		exit();
	}else{
		header('location:FormConnexion.php?msgErreur=Mot de passe ou login incorrect');
		exit();
	}
}else{
	header('location:FormConnexion.php?msgErreur=Veuillez remplir les champs');
	exit();

}
?>