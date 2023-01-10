 <?php
$user = 'mysql2013';
$pass = '58bEnXSvf4M3';

try {
 $conn = new PDO('mysql:host=localhost;dbname=mysql2013;charset=UTF8',
			$user, $pass, array(PDO::ATTR_ERRMODE =>PDO::ERRMODE_EXCEPTION));
}
catch (PDOException $e) {
	echo "Erreur: ".$e->getMessage()."<br>" ;
	die() ;
}
?>