-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 27 nov. 2025 à 10:55
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
-- Base de données : `seminaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `conference`
--

DROP TABLE IF EXISTS `conference`;
CREATE TABLE IF NOT EXISTS `conference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(250) DEFAULT NULL,
  `salle` varchar(50) DEFAULT NULL,
  `nbplaces` int DEFAULT NULL,
  `intervenant_id` int NOT NULL,
  `creneau_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_1` (`intervenant_id`),
  KEY `id_2` (`creneau_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `conference`
--

INSERT INTO `conference` (`id`, `description`, `salle`, `nbplaces`, `intervenant_id`, `creneau_id`) VALUES
(1, 'Introduction à l’IA et ses applications', 'Salle A', 50, 1, 1),
(2, 'Cybersécurité et protection des données', 'Salle B', 40, 2, 3),
(3, 'Cloud Computing et DevOps', 'Salle C', 60, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

DROP TABLE IF EXISTS `creneau`;
CREATE TABLE IF NOT EXISTS `creneau` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heure` varchar(50) DEFAULT NULL,
  `seminaire_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_1` (`seminaire_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `creneau`
--

INSERT INTO `creneau` (`id`, `heure`, `seminaire_id`) VALUES
(1, '09:00 - 10:30', 1),
(2, '11:00 - 12:30', 1),
(3, '14:00 - 15:30', 2),
(4, '16:00 - 17:30', 3);

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

DROP TABLE IF EXISTS `intervenant`;
CREATE TABLE IF NOT EXISTS `intervenant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `intervenant`
--

INSERT INTO `intervenant` (`id`, `nom`, `prenom`) VALUES
(1, 'Dupont', 'Jean'),
(2, 'Moreau', 'Claire'),
(3, 'Lopez', 'David');

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

DROP TABLE IF EXISTS `participant`;
CREATE TABLE IF NOT EXISTS `participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`id`, `nom`, `prenom`, `profession`, `ville`, `email`, `password`) VALUES
(1, 'Durand', 'Alice', 'Étudiante', 'Paris', 'alice.durand@example.com', ''),
(2, 'Martin', 'Paul', 'Développeur', 'Lyon', 'paul.martin@example.com', ''),
(3, 'Nguyen', 'Thierry', 'Consultant', 'Marseille', 'thierry.nguyen@example.com', ''),
(4, 'Bernard', 'Sophie', 'Chercheuse', 'Toulouse', 'sophie.bernard@example.com', ''),
(38, 'toto', 'tata', 'toto', 'toulon', 'tonton@tonton', '$2y$10$J7mRIJQqGAPM6mEVyPGYNehaWA6aEXPx8F63.VhUYpUhsM5cBc9DS'),
(37, 'Carretey', 'Tristan', 'test', 'La rochefoucauld', 'tristan.carretey@gmail.com', '$2y$10$AtOLuAWl9sauPpfWPwP34.O3lKHG.tYD.SormzVA3UYECQWqdJw6C');

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

DROP TABLE IF EXISTS `participer`;
CREATE TABLE IF NOT EXISTS `participer` (
  `id` int NOT NULL,
  `participant_id` int NOT NULL,
  PRIMARY KEY (`id`,`participant_id`),
  KEY `id_1` (`participant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `participer`
--

INSERT INTO `participer` (`id`, `participant_id`) VALUES
(1, 0),
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(3, 1),
(3, 38);

-- --------------------------------------------------------

--
-- Structure de la table `seminaire`
--

DROP TABLE IF EXISTS `seminaire`;
CREATE TABLE IF NOT EXISTS `seminaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intitule` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `seminaire`
--

INSERT INTO `seminaire` (`id`, `intitule`) VALUES
(1, 'Séminaire Intelligence Artificielle'),
(2, 'Séminaire Cybersécurité'),
(3, 'Séminaire Cloud Computing');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
