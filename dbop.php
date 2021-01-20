<?php

$dsn = "mysql:host=localhost;dbname=evaluation";
$user = "root";
$passwd = "mysqlroot";

$pdo = new PDO($dsn, $user, $passwd);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

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

//----------------------------------------------------
function fetch_users($pdo)
{
  $query = "SELECT id, nom_prenom FROM users";
  $stm = $pdo->query($query);
  return $stm->fetchAll(PDO::FETCH_ASSOC);
}

function fetch_user_byid($pdo, $id)
{
  $query = "SELECT id, nom_prenom
  FROM users
  WHERE id = ?";
  $stm = $pdo->prepare($query);
  $stm->execute([$id]);
  return $stm->fetch(PDO::FETCH_ASSOC);
}

//----------------------------------------------------
function fetch_logins($pdo) {
  $query = "SELECT l.id AS login_id, l.user_id, u.nom_prenom, l.date_login, l.date_expire, l.ip_addr, l.granted 
  FROM logins AS l
    INNER JOIN users AS u ON l.user_id = u.id";
  $stm = $pdo->query($query);
  return $stm->fetchAll(PDO::FETCH_ASSOC);
}

function insert_login($pdo, $login)
{
  $query = "INSERT INTO logins (`user_id`, date_login, date_expire,	ip_addr, granted) 
  VALUES (?, ?, ?, ?, ?)";
  try {
    $stm = $pdo->prepare($query);
    $res = $stm->execute([
      $login['user_id'],
      $login['date_login'],
      $login['date_expire'],
      $login['ip_addr'],
      $login['granted']
    ]);
  } catch (Exception $e) {
    var_dump($e);
  }
  return $res;
}

function delete_obsolete_logins($pdo, $ip_addr, $login_id) {
  $query = "DELETE FROM logins WHERE ip_addr = ? AND id != ?";
  $stm = $pdo->prepare($query);
  $res = $stm->execute([$ip_addr, $login_id]);
  return $res;
}

function delete_login($pdo, $login_id)
{
  $query = "DELETE FROM logins WHERE id = ?";
  $stm = $pdo->prepare($query);
  $res = $stm->execute([$login_id]);
  return $res;
}

function fetch_login_byid($pdo, $id)
{
  $query = "SELECT *
  FROM logins
  WHERE id = ?";
  $stm = $pdo->prepare($query);
  $stm->execute([$id]);
  return $stm->fetch(PDO::FETCH_ASSOC);
}

/**
 * Return last login from one IP Address
 */
function fetch_login_byipaddr($pdo, $ip_addr, $date) {
  $query = "SELECT *
  FROM logins AS l1
  WHERE 
    ? BETWEEN date_login AND date_expire AND
    ip_addr = ? AND
    date_login = (SELECT MAX(date_login) FROM logins AS l2 WHERE l2.ip_addr = l1.ip_addr)";
  $stm = $pdo->prepare($query);
  $stm->execute([$date, $ip_addr]);
  return $stm->fetch(PDO::FETCH_ASSOC);  
}
//--------------------------------------------------------
function fetch_student_questions($pdo, $user_id) {
  $query = "SELECT q.id, s.nom_sujet, q.question, r.id AS rep_id, r.reponse, r.note, r.est_corrige, r.date_correction
  FROM questions AS q
    INNER JOIN sujets AS s ON q.sujet_id = s.id
    INNER JOIN questions_users AS qu ON q.id = qu.question_id
    LEFT JOIN reponses AS r ON r.question_id = qu.question_id AND r.user_id = qu.user_id
  WHERE qu.user_id = ?";
  $stm = $pdo->prepare($query);
  $stm->execute([$user_id]);
  return $stm->fetchAll(PDO::FETCH_ASSOC); 
}

function fetch_student_answer_byid($pdo, $id) {
  $query = "SELECT * FROM reponses WHERE id = ?";
  $stm = $pdo->prepare($query);
  $stm->execute([$id]);
  return $stm->fetch(PDO::FETCH_ASSOC);
}

function fetch_student_answer_byquestionid($pdo, $user_id, $question_id) {
  $query = "SELECT * FROM reponses WHERE question_id = ? and `user_id` = ?";
  $stm = $pdo->prepare($query);
  $stm->execute([$question_id, $user_id]);
  return $stm->fetch(PDO::FETCH_ASSOC);
}

function insert_student_answer($pdo, $reponse) {
  $query = "INSERT INTO reponses (`user_id`, question_id, reponse, note, date_rep, est_corrige,	date_correction, ip_addr) 
  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
  $stm = $pdo->prepare($query);
  $stm->execute([
    $reponse['user_id'],
    $reponse['question_id'],
    $reponse['reponse'],
    $reponse['note'],
    $reponse['date_rep'],
    $reponse['est_corrige'],
    $reponse['date_correction'],
    $reponse['ip_addr']
  ]);
  return $pdo->lastInsertId();
}

function update_student_answer($pdo, $reponse) {
  $query = "UPDATE reponses 
  SET 
    reponse = ?, 
    note = ?, 
    date_rep = ?, 
    est_corrige = ?,	
    date_correction = ?, 
    ip_addr = ? 
  WHERE id = ?";
  $stm = $pdo->prepare($query);
  return $stm->execute([
    $reponse['reponse'],
    $reponse['note'],
    $reponse['date_rep'],
    $reponse['est_corrige'],
    $reponse['date_correction'],
    $reponse['ip_addr'],
    $reponse['id']
  ]);
}