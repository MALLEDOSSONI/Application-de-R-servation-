<?php
require_once 'includes/Database.php';

$pdo = Database::getInstance()->getConnection();

// Récupérer les données du formulaire
$nom = $_POST['nom'] ?? '';
$email = $_POST['email'] ?? '';
$hotel_id = $_POST['hotel_id'] ?? '';
$chambre_id = $_POST['chambre_id'] ?? '';
$date_debut = $_POST['date_debut'] ?? '';
$date_fin = $_POST['date_fin'] ?? '';

// Validation des champs
if (empty($nom) || empty($email) || empty($hotel_id) || empty($chambre_id) || empty($date_debut) || empty($date_fin)) {
    die('Tous les champs sont obligatoires.');
}

if ($date_debut >= $date_fin || $date_debut < date('Y-m-d')) {
    die('Les dates de réservation sont invalides.');
}

// Vérifier la disponibilité de la chambre
$stmt = $pdo->prepare("
    SELECT COUNT(*) FROM reservations 
    WHERE chambre_id = ? AND date_debut < ? AND date_fin > ?
");
$stmt->execute([$chambre_id, $date_fin, $date_debut]);
if ($stmt->fetchColumn() > 0) {
    die('Cette chambre est déjà réservée pour les dates sélectionnées.');
}

// Insérer le client s'il n'existe pas
$stmt = $pdo->prepare("SELECT id FROM clients WHERE email = ?");
$stmt->execute([$email]);
$client = $stmt->fetch();

if (!$client) {
    $stmt = $pdo->prepare("INSERT INTO clients (nom, email) VALUES (?, ?)");
    $stmt->execute([$nom, $email]);
    $client_id = $pdo->lastInsertId();
} else {
    $client_id = $client['id'];
}

// Insérer la réservation
$stmt = $pdo->prepare("INSERT INTO reservations (client_id, chambre_id, date_debut, date_fin) VALUES (?, ?, ?, ?)");
$stmt->execute([$client_id, $chambre_id, $date_debut, $date_fin]);

header('Location: reservation.php?success=1');
