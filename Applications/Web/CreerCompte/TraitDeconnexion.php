<?php
    session_start();
    /*session_destroy();*/
    unset($_SESSION['acces']);
    unset($_SESSION['nom']);
    unset($_SESSION['prenom']);
    unset($_SESSION['numc']);
    header("location:ConnexionCompte.php?msg=À bientôt !");
    exit()
?>