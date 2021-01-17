<?php

$dsn = "mysql:host=localhost;dbname=evaluation";
$user = "root";
$passwd = "mysqlroot";

$pdo = new PDO($dsn, $user, $passwd);

function fetch_dates_reponses($pdo)
{
  $query = "SELECT DISTINCT DATE(date_rep) AS date_rep FROM `reponses` ORDER BY date_rep DESC";
  $stm = $pdo->query($query);
  $res = $stm->fetchAll(PDO::FETCH_ASSOC);
  $dates = [];
  foreach ($res as $row) {
    $dates[] = $row['date_rep'];
  }
  return $dates;
}

function fetch_reponse_byid($pdo, $rep_id)
{
  $query = "SELECT r.*, 
  u.nom_prenom, u.classe, u.date_inscrit, 
  q.sujet_id, q.question, q.num_question, 
  s.nom_sujet
FROM `reponses` AS r
  INNER JOIN users as u ON r.user_id = u.id
  INNER JOIN questions AS q ON r.question_id = q.id
  INNER JOIN sujets AS s ON q.sujet_id = s.id
WHERE r.id = ?";
  $stm = $pdo->prepare($query);
  $stm->execute([$rep_id]);
  return $stm->fetch(PDO::FETCH_ASSOC);
}

function count_reponses($pdo, $est_corrige = false)
{
  $query = "SELECT COUNT(*) AS nbre_reponses
FROM reponses
WHERE est_corrige = ?";
  $stm = $pdo->prepare($query);
  $stm->execute([$est_corrige]);
  return $stm->fetch(PDO::FETCH_ASSOC)['nbre_reponses'];
}

function fetch_reponses_bypage($pdo, $est_corrige, $page = 0, $page_size = 20)
{
  $offset = $page * $page_size;
  $query = "SELECT r.*, 
  u.nom_prenom, u.classe, u.date_inscrit, 
  q.sujet_id, q.question, q.num_question, 
  s.nom_sujet
FROM `reponses` AS r
  INNER JOIN users as u ON r.user_id = u.id
  INNER JOIN questions AS q ON r.question_id = q.id
  INNER JOIN sujets AS s ON q.sujet_id = s.id
WHERE est_corrige = ?
ORDER BY r.question_id, r.user_id, r.date_rep DESC
LIMIT $offset, $page_size";
  $stm = $pdo->prepare($query);
  $stm->execute([$est_corrige]);
  return $stm->fetchAll(PDO::FETCH_ASSOC);
}

function update_note($pdo, $rep_id, $note)
{
  $query = "UPDATE reponses SET note = ? WHERE id = ?";
  $stm = $pdo->prepare($query);
  return $stm->execute([$note, $rep_id]);
}

function update_reponse($pdo, $reponse)
{
  $query = "UPDATE reponses 
SET 
  reponse = ?,
  note = ? 
WHERE id = ?";
  $stm = $pdo->prepare($query);
  return $stm->execute([$reponse['reponse'], $reponse['note'], $reponse['id']]);
}

function delete_reponse($pdo, $rep_id)
{
  $query = "DELETE FROM reponses WHERE id = ?";
  $stm = $pdo->prepare($query);
  return $stm->execute([$rep_id]);
}

//----------------------------------------------------------------
function fetch_questions($pdo)
{
  $query = "SELECT q.*, s.nom_sujet
  FROM `questions` AS q
    INNER JOIN sujets AS s ON q.sujet_id = s.id
  ORDER BY q.id";
  $stm = $pdo->query($query);
  return $stm->fetchAll(PDO::FETCH_ASSOC);
}

function fetch_question_byid($pdo, $id)
{
  $query = "SELECT q.*, s.nom_sujet
  FROM `questions` AS q
    INNER JOIN sujets AS s ON q.sujet_id = s.id
  WHERE q.id = ?";
  $stm = $pdo->prepare($query);
  $stm->execute([$id]);
  return $stm->fetch(PDO::FETCH_ASSOC);
}

function save_question($pdo, $question)
{
  $query = "UPDATE questions
  SET
    question = ?,
    reponse_modele = ?,
    num_question = ?
  WHERE id = ?";
  $stm = $pdo->prepare($query);
  return $stm->execute([
    $question['question'],
    $question['reponse_modele'],
    $question['num_question'],
    $question['id']
  ]);
}

function save_sujet($pdo, $sujet)
{
  $query = "UPDATE sujets
  SET
    nom_sujet = ?
  WHERE id = ?";
  $stm = $pdo->prepare($query);
  return $stm->execute([
    $sujet['nom_sujet'],
    $sujet['sujet_id']
  ]);
}
