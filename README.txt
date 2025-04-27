README

BooKING

BooKING est une plateforme de réservation d'hôtels permettant aux utilisateurs de rechercher des hôtels, de sélectionner des chambres disponibles et de réserver en ligne. Ce projet utilise PHP, MySQL, Bootstrap et JavaScript pour offrir une expérience utilisateur fluide et intuitive.



Fonctionnalités
- Affichage de la liste des hôtels disponibles.
- Sélection dynamique des chambres en fonction de l'hôtel et des dates choisies.
- Validation des réservations pour éviter les conflits de dates.
- Affichage d'un message de confirmation après une réservation réussie.
- Gestion des erreurs pour les champs obligatoires et les conflits de réservation.


Structure du projet

APPL-BooKING/
├── assets/
│   ├── css/
│   │   └── style.css          # Fichier CSS personnalisé
│   ├── js/
│   │   └── script.js          # Fichier JavaScript pour la logique dynamique
├── includes/
│   ├── header.php             # En-tête commun
│   ├── footer.php             # Pied de page commun
│   └── Database.php           # Classe pour la connexion à la base de données
├── api/
│   └── get_chambres.php       # API pour récupérer les chambres disponibles
├── index.php                  # Page d'accueil
├── hotels.php                 # Liste des hôtels
├── reservation.php            # Formulaire de réservation
├── traitement_reservation.php # Traitement des réservations
└── README.md                  # Documentation du projet




Installation

1. Configurer la base de données :
   - Créez une base de données MySQL nommée "booking".
   - Importez le fichier SQL suivant pour créer les tables nécessaires :
  	sql
     CREATE TABLE hotels (
         id INT AUTO_INCREMENT PRIMARY KEY,
         nom VARCHAR(255) NOT NULL,
         adresse VARCHAR(255) NOT NULL
     );

     CREATE TABLE chambres (
         id INT AUTO_INCREMENT PRIMARY KEY,
         hotel_id INT NOT NULL,
         numero VARCHAR(50) NOT NULL,
         FOREIGN KEY (hotel_id) REFERENCES hotels(id)
     );

     CREATE TABLE reservations (
         id INT AUTO_INCREMENT PRIMARY KEY,
         chambre_id INT NOT NULL,
         date_debut DATE NOT NULL,
         date_fin DATE NOT NULL,
         FOREIGN KEY (chambre_id) REFERENCES chambres(id)
     );


2. Configurer la connexion à la base de données :
   - Modifiez le fichier Database.php pour y ajouter vos informations de connexion :
     php
     private $host = 'localhost';
     private $db_name = 'booking';
     private $username = 'root';
     private $password = '';
 

3. Démarrer le serveur local :
   - Placez le projet dans le dossier "htdocs" de XAMPP.
   - Lancez Apache et MySQL via le panneau de contrôle XAMPP.
   - Accédez au projet via `http://localhost/APPL-BooKING`.



Utilisation

1. Page d'accueil ("index.php") :
   - Présente une introduction à la plateforme.

2. Liste des hôtels ("hotels.php") :
   - Affiche tous les hôtels disponibles avec leurs adresses.
   - Chaque hôtel a un bouton "Réserver" qui redirige vers le formulaire de réservation.

3. Formulaire de réservation ("reservation.php") :
   - Permet de sélectionner un hôtel, une chambre et des dates.
   - Affiche un message de confirmation après une réservation réussie.

4. API des chambres ("api/get_chambres.php") :
   - Retourne les chambres disponibles pour un hôtel donné et des dates spécifiques.



Personnalisation

- Styles :
  - Modifiez le fichier style.css pour personnaliser l'apparence du site.
- Scripts :
  - Ajoutez ou modifiez la logique JavaScript dans script.js.


Dépendances

- Frontend :
  - [Bootstrap 5](https://getbootstrap.com/) pour la mise en page et les composants.
- Backend :
  - PHP 7.4 ou supérieur.
  - MySQL pour la gestion des données.



Améliorations futures

- Ajouter un système d'authentification pour les utilisateurs.
- Implémenter une gestion des administrateurs pour ajouter/modifier des hôtels et des chambres.
- Ajouter une fonctionnalité de recherche avancée pour les hôtels.
- Intégrer un système de paiement en ligne.



Support

Pour toute question ou problème, veuillez contacter : Brehima Malle brehima_m@yahoo.fr.


Licence

Ce projet est sous licence OpenSource. Vous êtes libre de l'utiliser, de le modifier et de le distribuer.