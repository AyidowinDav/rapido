<?php
include "connexion.php";

// Récupérer toutes les courses avec le nom du chauffeur (jointure)
$requete = "SELECT c.course_id, c.point_depart, c.point_arrivee, c.date_heure, c.image_vehicule,
            CONCAT(ch.prenoms, ' ', ch.nom) AS chauffeur, c.statut
            FROM courses c
            LEFT JOIN chauffeurs ch ON c.chauffeur_id = ch.chauffeur_id
            ORDER BY c.date_heure DESC";

$execution = mysqli_query($connexion, $requete);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RAPIDO - Liste des Courses</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

<div class="fixed-top mb-3">
    <?php include('menu.php'); ?>
</div>

<div class="container mt-5 pt-5">
    <h4 class="pt-3 mb-3 text-primary fw-bold">Liste de toutes les Courses</h4>

    <!-- Alerte de succès pour suppression -->
    <?php if (isset($_GET['delete'])): ?>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            Course supprimée avec succès !
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <?php endif; ?>

    <table class="table table-bordered table-hover mt-3">
        <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Point de Depart</th>
                <th>Point d'Arrivee</th>
                <th>Date et Heure</th>
                <th>Chauffeur</th>
                <th>Statut</th>
                <th style="width:120px;">Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <?php while ($course = mysqli_fetch_assoc($execution)) : ?>
            <tr>
                <td><?php echo $course['course_id']; ?></td>
                <td><?php echo htmlspecialchars($course['point_depart']); ?></td>
                <td><?php echo htmlspecialchars($course['point_arrivee']); ?></td>
                <td><?php echo $course['date_heure']; ?></td>
                <td>
                    <?php 
                        echo !empty($course['chauffeur']) 
                            ? htmlspecialchars($course['chauffeur']) 
                            : 'Non affecté';
                    ?>
                </td>

                <td>
                    <?php if ($course['statut'] == 'en cours') : ?>
                        <span class="badge bg-warning text-dark">En cours</span>
                    <?php elseif ($course['statut'] == 'terminée') : ?>
                        <span class="badge bg-success">Terminée</span>
                    <?php else : ?>
                        <span class="badge bg-secondary">En attente</span>
                    <?php endif; ?>
                </td>

                <td style="width:120px; height: 50px;">
                    <?php
                        // Afficher l'image du véhicule si elle existe
                        $imagePath = $course['image_vehicule'];

                        if (!empty($imagePath) && file_exists($imagePath)) {
                            echo '<img src="' . $imagePath . '" alt="Image Vehicule" style="width:100px;">';
                        } else {
                            echo 'Aucune image';
                        }
                    ?>
                </td>

                <td>
                    <a class="btn btn-danger btn-sm"
                       onclick="return confirm('Etes-vous sur ?')"
                       href="supprimer_course.php?id=<?php echo $course['course_id']; ?>">
                       Supprimer
                    </a>
                </td>
            </tr>
        <?php endwhile; ?>
        </tbody>
    </table>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>