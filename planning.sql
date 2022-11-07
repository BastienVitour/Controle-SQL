-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 07 nov. 2022 à 15:32
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `planning`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_ecole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `nom`, `id_prof`, `id_ecole`) VALUES
(1, 'Classe 1', 1, 1),
(2, 'Classe 2', 2, 1),
(3, 'Classe 3', 3, 1),
(4, 'Classe 4', 4, 1),
(5, 'Classe 5', 5, 1),
(6, 'Classe 6', 6, 2),
(7, 'Classe 7', 7, 2),
(8, 'Classe 8', 8, 2),
(9, 'Classe 9', 9, 2),
(10, 'Classe 10', 10, 2),
(11, 'Classe 11', 11, 3),
(12, 'Classe 12', 12, 3),
(13, 'Classe 13', 13, 3),
(14, 'Classe 14', 14, 3),
(15, 'Classe 15', 15, 3);

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

CREATE TABLE `ecole` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ecole`
--

INSERT INTO `ecole` (`id`, `nom`) VALUES
(1, 'Ecole 1'),
(2, 'Ecole 2'),
(3, 'Ecole 3');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `nom`) VALUES
(1, 'Français'),
(2, 'Maths'),
(3, 'Anglais'),
(4, 'Physique-Chimie'),
(5, 'SVT'),
(6, 'Espagnol'),
(7, 'Informatique'),
(8, 'Arts Plastiques');

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

CREATE TABLE `prof` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`id`, `nom`, `id_classe`) VALUES
(1, 'Prof 1', 1),
(2, 'Prof 2', 2),
(3, 'Prof 3', 3),
(4, 'Prof 4', 4),
(5, 'Prof 5', 5),
(6, 'Prof 6', 6),
(7, 'Prof 7', 7),
(8, 'Prof 8', 8),
(9, 'Prof 9', 9),
(10, 'Prof 10', 10),
(11, 'Prof 11', 11),
(12, 'Prof 12', 12),
(13, 'Prof 13', 13),
(14, 'Prof 14', 14),
(15, 'Prof 15', 15);

-- --------------------------------------------------------

--
-- Structure de la table `prof_matiere`
--

CREATE TABLE `prof_matiere` (
  `id_prof` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prof_matiere`
--

INSERT INTO `prof_matiere` (`id_prof`, `id_matiere`) VALUES
(3, 6),
(3, 8),
(8, 1),
(8, 2),
(12, 6),
(12, 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ecole` (`id_ecole`),
  ADD KEY `id_prof` (`id_prof`);

--
-- Index pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prof`
--
ALTER TABLE `prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_classe` (`id_classe`);

--
-- Index pour la table `prof_matiere`
--
ALTER TABLE `prof_matiere`
  ADD KEY `id_matiere` (`id_matiere`),
  ADD KEY `id_prof` (`id_prof`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `ecole`
--
ALTER TABLE `ecole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `prof`
--
ALTER TABLE `prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_ecole`) REFERENCES `ecole` (`id`),
  ADD CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`id_prof`) REFERENCES `prof` (`id`);

--
-- Contraintes pour la table `prof`
--
ALTER TABLE `prof`
  ADD CONSTRAINT `prof_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id`);

--
-- Contraintes pour la table `prof_matiere`
--
ALTER TABLE `prof_matiere`
  ADD CONSTRAINT `prof_matiere_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`),
  ADD CONSTRAINT `prof_matiere_ibfk_2` FOREIGN KEY (`id_prof`) REFERENCES `prof` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
