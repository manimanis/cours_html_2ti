<?php
session_start();

if (!isset($_POST['id_eleve'])) {
  header('location: evaluation.php');
}

$id_eleve = intval($_POST['id_eleve']);
// $id_eleve = -2;
$dsn = "mysql:host=localhost;dbname=evaluation";
$user = "root";
$passwd = "mysqlroot";

$pdo = new PDO($dsn, $user, $passwd);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

$student = [];
try {
  $stm = $pdo->prepare("SELECT * FROM users WHERE id = ?");
  $stm->execute([$id_eleve]);
  $student = $stm->fetch(PDO::FETCH_ASSOC);
} catch (Exception $e) {
  var_dump($e);
}

if (count($student) == 0) {
  header('location: evaluation.php');
}

$query = "INSERT INTO reponses (user_id, question_id, reponse, date_rep, ip_addr) VALUES (?, ?, ?, ?, ?)";
$stm = $pdo->prepare($query);

foreach ($_POST as $key => $value) {
  $value = trim($value);
  if ($value == '' || strlen($key) < 9 || substr($key, 0, 9) != 'question_') {
    continue;
  }
  $stm->execute([
    $id_eleve,
    substr($key, 9),
    $value,
    date('Y-m-d H:i:s'),
    $_SERVER['REMOTE_ADDR']
  ]);
}

$_SESSION['message'] = "Les réponses ont été ajoutées avec succès.";
header('location: evaluation.php');
