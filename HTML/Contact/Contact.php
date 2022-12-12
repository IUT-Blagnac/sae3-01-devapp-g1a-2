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


    <style>
        img {
          transition: transform 0.2s ease-in-out;

          width: 20%;
        }
      
        img:hover {
          transform: scale(2);
        }
      </style>
      
      <img src="../Image/imgmontagne.jpg">


<form>
    <label for="name">Nom:</label>
    <input type="text" id="name" name="name">
    <label for="surname">Prénom:</label>
    <input type="text" id="surname" name="surname">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email">
    <label for="message">Message:</label>
    <textarea id="message" name="message"></textarea>
    <input type="submit" value="Envoyer">
  </form>




