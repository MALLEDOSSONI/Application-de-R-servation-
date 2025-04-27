-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 27 avr. 2025 à 04:59
-- Version du serveur : 8.0.41
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `booking`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambres`
--

CREATE TABLE `chambres` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `numero` varchar(10) NOT NULL,
  `type_chambre` enum('standard','deluxe','suite') DEFAULT 'standard',
  `capacite` int NOT NULL DEFAULT '2',
  `prix_nuit` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `chambres`
--

INSERT INTO `chambres` (`id`, `hotel_id`, `numero`, `type_chambre`, `capacite`, `prix_nuit`, `created_at`) VALUES
(1, 1, '101', 'standard', 2, 120.00, '2025-03-31 18:46:58'),
(2, 1, '102', 'standard', 2, 120.00, '2025-03-31 18:46:58'),
(3, 1, '201', 'deluxe', 2, 180.00, '2025-03-31 18:46:58'),
(4, 2, '101', 'deluxe', 2, 200.00, '2025-03-31 18:46:58'),
(5, 2, '102', 'deluxe', 3, 220.00, '2025-03-31 18:46:58'),
(6, 3, '201', 'suite', 2, 300.00, '2025-03-31 18:46:58'),
(7, 3, '202', 'standard', 2, 150.00, '2025-03-31 18:46:58'),
(8, 4, '301', 'standard', 2, 100.00, '2025-03-31 18:46:58'),
(9, 4, '302', 'deluxe', 2, 160.00, '2025-03-31 18:46:58'),
(10, 5, '401', 'standard', 2, 90.00, '2025-03-31 18:46:58'),
(11, 5, '402', 'standard', 3, 110.00, '2025-03-31 18:46:58');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `email`, `created_at`) VALUES
(1, 'Brehima Malle', 'brehima_m@yahoo.fr', '2025-03-31 18:46:58'),
(2, 'DAGIEU', 'mallekoukou16@gmail.com', '2025-03-31 18:46:58'),
(3, 'KAKA ', 'malle@klaconsulting-sarl.com', '2025-03-31 18:46:58'),
(4, 'adama', 'coulibalybouba1220@gmail.com', '2025-03-31 18:46:58');

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

CREATE TABLE `hotels` (
  `id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adresse` text NOT NULL,
  `ville` varchar(100) NOT NULL,
  `etoiles` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`id`, `nom`, `adresse`, `ville`, `etoiles`, `created_at`) VALUES
(1, 'Hôtel du Centre', '10 rue de Paris', 'Paris', 5, '2025-03-31 18:46:57'),
(2, 'Grand Hôtel', 'Avenue des Champs', 'Paris', 5, '2025-03-31 18:46:57'),
(3, 'Hôtel Le Palace', '123 Rue Royale', 'Paris', 5, '2025-03-31 18:46:57'),
(4, 'Hôtel du Lac', '45 Avenue des Champs', 'Lyon', 4, '2025-03-31 18:46:57'),
(5, 'Hôtel Belle Vue', '78 Boulevard Haussmann', 'Marseille', 3, '2025-03-31 18:46:57');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `chambre_id` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `statut` enum('confirmée','annulée') DEFAULT 'confirmée'
) ;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `client_id`, `chambre_id`, `date_debut`, `date_fin`, `created_at`, `statut`) VALUES
(10, 1, 3, '2025-04-28', '2025-04-30', '2025-04-27 02:52:42', 'confirmée'),
(11, 1, 4, '2025-04-30', '2025-05-04', '2025-04-27 02:59:09', 'confirmée');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_chambre` (`hotel_id`,`numero`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Index pour la table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `chambre_id` (`chambre_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambres`
--
ALTER TABLE `chambres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD CONSTRAINT `chambres_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`chambre_id`) REFERENCES `chambres` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
