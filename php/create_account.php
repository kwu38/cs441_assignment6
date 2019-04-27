<?php
$passcode = $_POST["passcode"];
$fn = $_POST["fn"];
$ln = $_POST["ln"];
$email = $_POST["email"];

$dbname = "kwu38_food";
$dbuser = "kwu38";
$dbpwd = "1357";
$host = "mysql.cs.binghamton.edu";
$cid = mysqli_connect($host, $dbuser, $dbpwd, $dbname);

if($cid){
	$sql = "select * from users where username = \"{$_POST["username"]}\"";
	$result = mysqli_query($cid, $sql);
	if($result){
		$sql = "insert into users (fn, ln, email, passcode) values (\"{$_POST["fn"]}\", \"{$_POST["ln"]}\", \"{$_POST["email"]}\", \"{$_POST["passcode"]}\")";	
	}

}
?>
