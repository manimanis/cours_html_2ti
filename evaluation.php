<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Evaluation</title>
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>

<body>
  <main class="container">
    <h1>Evaluation Web</h1>

    <p>Sélectionner votre nom :</p>
    <?php
    $dsn = "mysql:host=localhost;dbname=evaluation";
    $user = "root";
    $passwd = "mysqlroot";

    $pdo = new PDO($dsn, $user, $passwd);

    $stm = $pdo->query("SELECT * FROM users");

    $students = $stm->fetchAll(PDO::FETCH_ASSOC);

    if (isset($_SESSION['message'])) {
      echo "<p>{$_SESSION['message']}</p>";
      unset($_SESSION['message']);
    }
    ?>


    <form action="liste_questions.php" method="post">
      <div class="my-2">
        <label for="id_eleve">Nom & Prénom</label>
        <select name="id_eleve" id="id_eleve" class="form-control">
          <option value="-1">-</option>
          <?php foreach ($students as $index => $student) : ?>
            <option value="<?= $student['id'] ?>"><?= ($index + 1) ." - ". $student['nom_prenom'] ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="my-2"><button class="btn btn-primary">Sélectionner</button></div>
    </form>
  </main>
</body>

</html>