-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 24 fév. 2026 à 20:53
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rapido`
--

-- --------------------------------------------------------

--
-- Structure de la table `chauffeurs`
--

DROP TABLE IF EXISTS `chauffeurs`;
CREATE TABLE IF NOT EXISTS `chauffeurs` (
  `chauffeur_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenoms` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`chauffeur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `chauffeurs`
--

INSERT INTO `chauffeurs` (`chauffeur_id`, `nom`, `prenoms`, `telephone`, `sexe`, `disponible`) VALUES
(1, 'Toni', 'Ben', '+2290154444444', 'Masculin', 1),
(2, 'Momo', 'Baké', '+2290164545454', 'Feminin', 0);

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `point_depart` varchar(255) NOT NULL,
  `point_arrivee` varchar(255) NOT NULL,
  `date_heure` datetime NOT NULL,
  `chauffeur_id` int DEFAULT NULL,
  `statut` enum('en attente','en cours','terminée','') NOT NULL,
  `image_vehicule` varchar(255) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `fk1` (`chauffeur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`course_id`, `point_depart`, `point_arrivee`, `date_heure`, `chauffeur_id`, `statut`, `image_vehicule`) VALUES
(1, 'Porto-Novo', 'Cotonou', '2026-02-24 20:23:47', NULL, 'en attente', ''),
(2, 'Cotonou', 'Porto-Novo', '2026-02-24 20:23:47', NULL, 'en attente', '');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`chauffeur_id`) REFERENCES `chauffeurs` (`chauffeur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
