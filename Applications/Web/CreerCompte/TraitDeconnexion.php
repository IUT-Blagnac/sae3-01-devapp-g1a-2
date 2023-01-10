<?php
    session_start();
    session_destroy();
    header("location:ConnexionCompte.php?msg=À bientôt !");
    exit()
?>