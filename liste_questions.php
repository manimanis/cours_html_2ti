<?php
if (!isset($_POST['id_eleve'])) {
  header('location: evaluation.php');
}

$id_eleve = intval($_POST['id_eleve']);
if ($id_eleve <= 0) {
  header('location: evaluation.php');
}

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

if ($student === FALSE) {
  header('location: evaluation.php');
}

$query = "SELECT * 
FROM questions_users AS qu
  INNER JOIN questions AS q ON qu.question_id = q.id
  INNER JOIN sujets AS s ON q.sujet_id = s.id
WHERE qu.user_id = ?";
$stm = $pdo->prepare($query);
$stm->execute([$id_eleve]);
$questions = $stm->fetchAll(PDO::FETCH_ASSOC);

$query = "SELECT * 
FROM questions_users AS qu
  INNER JOIN (SELECT user_id, question_id, COUNT(question_id) AS nbre_reponses FROM reponses GROUP BY user_id, question_id) AS t ON qu.question_id = t.question_id AND qu.user_id = t.user_id
WHERE qu.user_id = ?";
$stm = $pdo->prepare($query);
$stm->execute([$id_eleve]);
$reponses = $stm->fetchAll(PDO::FETCH_ASSOC);

function find_by_question_id($reponses, $question_id)
{
  foreach ($reponses as $reponse) {
    if ($reponse['question_id'] == $question_id) {
      return $reponse;
    }
  }
  return [
    'question_id' => $question_id,
    'nbre_reponses' => 0
  ];
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Evaluation</title>
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <style>
    .topic {
      font-size: x-large;
      color: #673ab7;
    }

    .question {
      font-size: large;
      color: #795548;
    }
  </style>
</head>

<body>
  <main class="container">
    <h1>Evaluation Web</h1>
    <h2 class="text-center"><?= $student['nom_prenom'] ?></h2>
    <form action="repondre.php" method="post">
      <div class="my-2">
        <ol type="i">
          <?php
          $last_sujet = '';
          $html = '';
          $closing_sujet = '';
          foreach ($questions as $question) {
            if ($last_sujet != $question['nom_sujet']) {
              $html .= $closing_sujet;
              $html .= '<li class="topic">' . $question['nom_sujet'];
              $html .= '<ol class="my-3">';
              $closing_sujet = '</ol></li>';
            }
            $rep = find_by_question_id($reponses, $question['question_id']);
            $html .= '<li class="my-2 question ' . ($rep['nbre_reponses'] == 0 ? "" : "text-success") . '">' . $question['question'] . " (" . $rep['nbre_reponses'] . " answers)" .
              '<textarea name="question_' . $question['question_id'] . '" class="form-control"></textarea></li>';

            $last_sujet = $question['nom_sujet'];
          }
          $html .= $closing_sujet;
          echo $html;
          ?>
        </ol>
        <input type="hidden" name="id_eleve" value="<?= $id_eleve ?>">
      </div>
      <div class="my-2">
        <button class="btn btn-primary">Envoyer</button>
      </div>
    </form>

  </main>
</body>

</html>