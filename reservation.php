<?php
require_once 'includes/Database.php';
include 'includes/header.php';

$pdo = Database::getInstance()->getConnection();
$hotels = $pdo->query("SELECT * FROM hotels")->fetchAll();
?>

<div class="container mt-5">
    <h1>Réserver une chambre</h1>
     <!-- Afficher un message de confirmation si la réservation a réussi -->
     <?php if (isset($_GET['success']) && $_GET['success'] == 1): ?>
        <div class="alert alert-success text-center" role="alert">
            Votre réservation a été enregistrée avec succès !
        </div>
    <?php endif; ?>
        <form action="traitement_reservation.php" method="post">
        <div class="mb-3">
            <label for="nom">Nom</label>
            <input type="text" name="nom" id="nom" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="hotelSelect">Hôtel</label>
            <select name="hotel_id" id="hotelSelect" class="form-control" required>
                <option value="">Choisissez un hôtel</option>
                <?php foreach ($hotels as $hotel): ?>
                    <option value="<?= $hotel['id'] ?>"><?= htmlspecialchars($hotel['nom']) ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="chambreSelect">Chambre</label>
            <select name="chambre_id" id="chambreSelect" class="form-control" required disabled>
                <option value="">Sélectionnez un hôtel d'abord</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="dateDebut">Date d'arrivée</label>
            <input type="date" name="date_debut" id="dateDebut" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="dateFin">Date de départ</label>
            <input type="date" name="date_fin" id="dateFin" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Réserver</button>
    </form>
</div>

<?php include 'includes/footer.php'; ?>
