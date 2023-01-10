<?php
session_destroy();
	header('location:FormConnexion.php?msgErreur=déconnexion');
	exit();

?>