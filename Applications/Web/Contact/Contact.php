<?php 
         include_once("../Menu.php");
         include_once("../Footer.php");
?> 

<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />

        <link rel="stylesheet" href="Contact_css.css">
    
    </head>

<body>
   
<form>
    <label for="name">Nom:</label>
    <input class="contact" type="text" id="name" name="name">
    <label for="surname">Prénom:</label>
    <input class="contact" type="text" id="surname" name="surname">
    <label for="email">Email:</label>
    <input class="contact" type="email" id="email" name="email">
    <label for="message">Message:</label>
    <textarea class="contact" id="message" name="message"></textarea>
    <input class="contact" type="submit" value="Envoyer">
  </form>







