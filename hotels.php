<?php
require_once 'includes/Database.php';
include 'includes/header.php';

$pdo = Database::getInstance()->getConnection();
$hotels = $pdo->query("SELECT * FROM hotels")->fetchAll();
?>

<div class="container mt-5">
    <h1 class="text-center mb-4">Liste des Hôtels</h1>
    <div class="row g-4">
        <?php foreach ($hotels as $hotel): ?>
            <div class="col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title"><?= htmlspecialchars($hotel['nom']) ?></h5>
                        <p class="card-text">
                            <strong>Adresse :</strong> <?= htmlspecialchars($hotel['adresse']) ?>
                        </p>
                        <a href="reservation.php?hotel_id=<?= $hotel['id'] ?>" class="btn btn-primary">Réserver</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

<?php include 'includes/footer.php'; ?>
