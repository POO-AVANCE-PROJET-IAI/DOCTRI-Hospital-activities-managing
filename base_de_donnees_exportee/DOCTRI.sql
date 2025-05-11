-- phpMyAdmin SQL Dump
-- version 5.2.2-1.fc41.remi
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 11 mai 2025 à 19:26
-- Version du serveur : 10.11.10-MariaDB
-- Version de PHP : 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `DOCTRI`
--

-- --------------------------------------------------------

--
-- Structure de la table `authentication_utilisateur`
--

CREATE TABLE `authentication_utilisateur` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `authentication_utilisateur`
--

INSERT INTO `authentication_utilisateur` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`) VALUES
(1, 'pbkdf2_sha256$1000000$WG3FEI352imFWEjGejDbo1$RdpwwxbF7v2Wp1YHfK9F8hWfkd+kHdK2B6GeL8xLBlU=', '2025-05-04 18:16:42.480952', 0, 'jordanBuilder', 'jordan', 'TOMEGAH', 0, 1, '2025-05-04 18:16:41.286530', 'tomegahjordan81@gmail.com'),
(3, 'pbkdf2_sha256$1000000$JFXKPd9Q9IUrQBpSIQYQZR$zj6+cSddzpYQaJPiAnM9QLPpFvj/E8fU7mVYosvZ3YA=', '2025-05-05 01:45:36.675396', 1, 'jordanAdmin', '', '', 1, 1, '2025-05-05 01:44:25.639433', 'jordan@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `authentication_utilisateur_groups`
--

CREATE TABLE `authentication_utilisateur_groups` (
  `id` bigint(20) NOT NULL,
  `utilisateur_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `authentication_utilisateur_user_permissions`
--

CREATE TABLE `authentication_utilisateur_user_permissions` (
  `id` bigint(20) NOT NULL,
  `utilisateur_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_utilisateur'),
(22, 'Can change user', 6, 'change_utilisateur'),
(23, 'Can delete user', 6, 'delete_utilisateur'),
(24, 'Can view user', 6, 'view_utilisateur'),
(25, 'Can add patient', 7, 'add_patient'),
(26, 'Can change patient', 7, 'change_patient'),
(27, 'Can delete patient', 7, 'delete_patient'),
(28, 'Can view patient', 7, 'view_patient'),
(29, 'Can add type acte', 8, 'add_typeacte'),
(30, 'Can change type acte', 8, 'change_typeacte'),
(31, 'Can delete type acte', 8, 'delete_typeacte'),
(32, 'Can view type acte', 8, 'view_typeacte'),
(33, 'Can add acte', 9, 'add_acte'),
(34, 'Can change acte', 9, 'change_acte'),
(35, 'Can delete acte', 9, 'delete_acte'),
(36, 'Can view acte', 9, 'view_acte'),
(37, 'Can add medecin', 10, 'add_medecin'),
(38, 'Can change medecin', 10, 'change_medecin'),
(39, 'Can delete medecin', 10, 'delete_medecin'),
(40, 'Can view medecin', 10, 'view_medecin'),
(41, 'Can add affecter specialite', 11, 'add_affecterspecialite'),
(42, 'Can change affecter specialite', 11, 'change_affecterspecialite'),
(43, 'Can delete affecter specialite', 11, 'delete_affecterspecialite'),
(44, 'Can view affecter specialite', 11, 'view_affecterspecialite'),
(45, 'Can add specialite', 12, 'add_specialite'),
(46, 'Can change specialite', 12, 'change_specialite'),
(47, 'Can delete specialite', 12, 'delete_specialite'),
(48, 'Can view specialite', 12, 'view_specialite'),
(49, 'Can add consultation', 13, 'add_consultation'),
(50, 'Can change consultation', 13, 'change_consultation'),
(51, 'Can delete consultation', 13, 'delete_consultation'),
(52, 'Can view consultation', 13, 'view_consultation'),
(53, 'Can add facture', 14, 'add_facture'),
(54, 'Can change facture', 14, 'change_facture'),
(55, 'Can delete facture', 14, 'delete_facture'),
(56, 'Can view facture', 14, 'view_facture'),
(57, 'Can add facture detail', 15, 'add_facturedetail'),
(58, 'Can change facture detail', 15, 'change_facturedetail'),
(59, 'Can delete facture detail', 15, 'delete_facturedetail'),
(60, 'Can view facture detail', 15, 'view_facturedetail'),
(61, 'Can add ordonnance', 16, 'add_ordonnance'),
(62, 'Can change ordonnance', 16, 'change_ordonnance'),
(63, 'Can delete ordonnance', 16, 'delete_ordonnance'),
(64, 'Can view ordonnance', 16, 'view_ordonnance'),
(65, 'Can add medicament', 17, 'add_medicament'),
(66, 'Can change medicament', 17, 'change_medicament'),
(67, 'Can delete medicament', 17, 'delete_medicament'),
(68, 'Can view medicament', 17, 'view_medicament'),
(69, 'Can add ordonnance detail', 18, 'add_ordonnancedetail'),
(70, 'Can change ordonnance detail', 18, 'change_ordonnancedetail'),
(71, 'Can delete ordonnance detail', 18, 'delete_ordonnancedetail'),
(72, 'Can view ordonnance detail', 18, 'view_ordonnancedetail');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-05-05 01:46:49.882602', '1', 'Dr. LABAH', 1, '[{\"added\": {}}]', 10, 3),
(2, '2025-05-05 01:47:34.752964', '2', 'Dr. ASSION', 1, '[{\"added\": {}}]', 10, 3),
(3, '2025-05-05 01:48:31.285930', '3', 'Dr. DEGBOVI', 1, '[{\"added\": {}}]', 10, 3),
(4, '2025-05-05 01:53:23.577751', '3', 'Spécialité: Médecine Générale - GEN', 1, '[{\"added\": {}}]', 12, 3),
(5, '2025-05-05 01:53:50.184398', '4', 'Spécialité: Pédiatrie - PED', 1, '[{\"added\": {}}]', 12, 3),
(6, '2025-05-05 01:54:08.382182', '5', 'Spécialité: Gynécologie-Obstétrique - GYN', 1, '[{\"added\": {}}]', 12, 3),
(7, '2025-05-05 03:53:08.553423', '1', 'TypeActe object (1)', 1, '[{\"added\": {}}]', 8, 3),
(8, '2025-05-05 03:54:17.789610', '2', 'TypeActe object (2)', 1, '[{\"added\": {}}]', 8, 3),
(9, '2025-05-05 03:54:29.588711', '3', 'TypeActe object (3)', 1, '[{\"added\": {}}]', 8, 3),
(10, '2025-05-05 03:56:11.170743', '1', 'Acte object (1)', 1, '[{\"added\": {}}]', 9, 3),
(11, '2025-05-05 03:58:28.359369', '2', 'Acte object (2)', 1, '[{\"added\": {}}]', 9, 3),
(12, '2025-05-05 03:59:01.855653', '3', 'Acte object (3)', 1, '[{\"added\": {}}]', 9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(6, 'authentication', 'utilisateur'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(9, 'tomegah_acte', 'acte'),
(13, 'tomegah_consultation', 'consultation'),
(14, 'tomegah_facture', 'facture'),
(15, 'tomegah_facture_detail', 'facturedetail'),
(10, 'tomegah_medecin', 'medecin'),
(17, 'tomegah_medicament', 'medicament'),
(16, 'tomegah_ordonnance', 'ordonnance'),
(18, 'tomegah_ordonnance_detail', 'ordonnancedetail'),
(7, 'tomegah_patient', 'patient'),
(11, 'tomegah_specialite', 'affecterspecialite'),
(12, 'tomegah_specialite', 'specialite'),
(8, 'tomegah_type_acte', 'typeacte');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-05-04 17:28:09.985952'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-05-04 17:28:11.396018'),
(3, 'auth', '0001_initial', '2025-05-04 17:28:16.048240'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-05-04 17:28:17.045455'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-05-04 17:28:17.101226'),
(6, 'auth', '0004_alter_user_username_opts', '2025-05-04 17:28:17.211016'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-05-04 17:28:17.364481'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-05-04 17:28:17.472202'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-05-04 17:28:17.582093'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-05-04 17:28:17.624990'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-05-04 17:28:17.675639'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-05-04 17:28:18.380157'),
(13, 'auth', '0011_update_proxy_permissions', '2025-05-04 17:28:18.458611'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-05-04 17:28:18.517481'),
(15, 'authentication', '0001_initial', '2025-05-04 17:28:26.228954'),
(16, 'admin', '0001_initial', '2025-05-04 17:28:28.687753'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-05-04 17:28:28.746972'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-04 17:28:28.826798'),
(19, 'sessions', '0001_initial', '2025-05-04 17:28:30.146680'),
(20, 'tomegah_patient', '0001_initial', '2025-05-04 17:28:31.279566'),
(21, 'tomegah_type_acte', '0001_initial', '2025-05-05 00:37:16.478475'),
(22, 'tomegah_medecin', '0001_initial', '2025-05-05 00:37:17.087927'),
(23, 'tomegah_specialite', '0001_initial', '2025-05-05 00:37:20.528239'),
(24, 'tomegah_acte', '0001_initial', '2025-05-05 00:37:20.954299'),
(25, 'tomegah_acte', '0002_initial', '2025-05-05 00:37:22.965268'),
(26, 'tomegah_medecin', '0002_initial', '2025-05-05 00:37:23.008105'),
(27, 'tomegah_consultation', '0001_initial', '2025-05-05 04:02:53.007877'),
(28, 'tomegah_consultation', '0002_consultation_agepatient_and_more', '2025-05-09 22:48:01.086233'),
(29, 'tomegah_facture', '0001_initial', '2025-05-10 16:12:22.453653'),
(30, 'tomegah_facture_detail', '0001_initial', '2025-05-10 16:12:24.537791'),
(31, 'tomegah_facture', '0002_remove_facture_reste_a_payer', '2025-05-10 21:30:07.344595'),
(32, 'tomegah_facture', '0003_alter_facture_etat_facture', '2025-05-10 21:33:49.314056'),
(33, 'tomegah_facture', '0004_alter_facture_etat_facture', '2025-05-11 00:16:19.875285'),
(34, 'tomegah_medicament', '0001_initial', '2025-05-11 18:09:44.520816'),
(35, 'tomegah_ordonnance', '0001_initial', '2025-05-11 18:09:48.462809'),
(36, 'tomegah_ordonnance_detail', '0001_initial', '2025-05-11 18:09:52.531332'),
(37, 'tomegah_medicament', '0002_medicament_dosage_medicament_forme_and_more', '2025-05-11 19:03:34.393019');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('llrua39d3lha0505afrtbqlcq5br6mld', '.eJxVjLsOwjAMAP_FM4rcB3HSkZ1viOw4kAJKpKadEP-OKnWA9e50bwi8rTlsLS1hVphggNMvE47PVHahDy73amIt6zKL2RNz2GauVdPrcrR_g8wtwwREka3qiHKLgtqRWvbWe05qxVHve3UanWqXRsaBxIo9E6YhOiQkhM8XCOY4Ow:1uBktk:1cYRWSsUjbDwfY3Iy5ok9I_DMaesUPIZ76Rko4eSCYU', '2025-05-19 01:45:36.774190');

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_acte_acte`
--

CREATE TABLE `tomegah_acte_acte` (
  `id` bigint(20) NOT NULL,
  `code_acte` varchar(10) NOT NULL,
  `libelle_acte` varchar(100) NOT NULL,
  `montant_acte` int(11) NOT NULL,
  `Specialite_id` bigint(20) NOT NULL,
  `type_acte_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tomegah_acte_acte`
--

INSERT INTO `tomegah_acte_acte` (`id`, `code_acte`, `libelle_acte`, `montant_acte`, `Specialite_id`, `type_acte_id`) VALUES
(1, 'A001', 'Consultation générale', 7500, 3, 1),
(2, 'A002', 'Chirurgie abdominale', 1500, 5, 2),
(3, 'A003', 'Radiologie thoracique', 20000, 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_consultation_consultation`
--

CREATE TABLE `tomegah_consultation_consultation` (
  `id` bigint(20) NOT NULL,
  `codeconsultation` varchar(10) NOT NULL,
  `dateconsultation` date NOT NULL,
  `datefinvaliditeconsultation` date NOT NULL,
  `acte_id` bigint(20) DEFAULT NULL,
  `medecin_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) NOT NULL,
  `utilisateur_id` bigint(20) DEFAULT NULL,
  `agePatient` int(11) DEFAULT NULL,
  `temperaturePatient` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tomegah_consultation_consultation`
--

INSERT INTO `tomegah_consultation_consultation` (`id`, `codeconsultation`, `dateconsultation`, `datefinvaliditeconsultation`, `acte_id`, `medecin_id`, `patient_id`, `utilisateur_id`, `agePatient`, `temperaturePatient`) VALUES
(2, 'jokopk', '2025-05-20', '2025-05-25', 2, 2, 2, 1, 30, 37.00),
(3, '101', '2025-05-10', '2025-05-15', NULL, NULL, 2, 1, 18, 37.02),
(4, '65jio', '2025-05-22', '2025-05-25', 1, 1, 2, 1, 20, 38.00);

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_facture_detail_facturedetail`
--

CREATE TABLE `tomegah_facture_detail_facturedetail` (
  `id` bigint(20) NOT NULL,
  `code_detailfacture` varchar(20) NOT NULL,
  `montant_facturedetail` int(11) NOT NULL,
  `acte_id` bigint(20) NOT NULL,
  `facture_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_facture_facture`
--

CREATE TABLE `tomegah_facture_facture` (
  `id` bigint(20) NOT NULL,
  `code_facture` varchar(20) NOT NULL,
  `typefacture` varchar(100) NOT NULL,
  `dateenreg_facture` date NOT NULL,
  `datepaiement_facture` date DEFAULT NULL,
  `montant_facture` int(11) NOT NULL,
  `montant_payefacture` int(11) NOT NULL,
  `etat_facture` varchar(15) NOT NULL,
  `consultation_id` bigint(20) DEFAULT NULL,
  `medecin_id` bigint(20) DEFAULT NULL,
  `utilisateur_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tomegah_facture_facture`
--

INSERT INTO `tomegah_facture_facture` (`id`, `code_facture`, `typefacture`, `dateenreg_facture`, `datepaiement_facture`, `montant_facture`, `montant_payefacture`, `etat_facture`, `consultation_id`, `medecin_id`, `utilisateur_id`) VALUES
(13, '3291aa37-5062-4558-8', 'Chirurgie', '2025-05-20', NULL, 1500, 1500, 'pA', 2, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_medecin_medecin`
--

CREATE TABLE `tomegah_medecin_medecin` (
  `id` bigint(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `datenaissance` date NOT NULL,
  `civilite` varchar(3) NOT NULL,
  `titre_medecin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tomegah_medecin_medecin`
--

INSERT INTO `tomegah_medecin_medecin` (`id`, `code`, `nom`, `prenom`, `datenaissance`, `civilite`, `titre_medecin`) VALUES
(1, 'LE-123', 'LABAH', 'Elie', '2004-07-08', 'M', 'Géneraliste'),
(2, 'AL-123', 'ASSION', 'Laura', '2005-07-20', 'ML', 'Gynécologue'),
(3, 'DM-123', 'DEGBOVI', 'Maxime', '2004-04-10', 'M', 'Pédiatre');

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_medicament_medicament`
--

CREATE TABLE `tomegah_medicament_medicament` (
  `id` bigint(20) NOT NULL,
  `code_medicament` varchar(20) NOT NULL,
  `libelle_medicament` varchar(100) NOT NULL,
  `dosage` varchar(20) DEFAULT NULL,
  `forme` varchar(20) NOT NULL,
  `voie_administration` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tomegah_medicament_medicament`
--

INSERT INTO `tomegah_medicament_medicament` (`id`, `code_medicament`, `libelle_medicament`, `dosage`, `forme`, `voie_administration`) VALUES
(1, 'f55a7ed5-fe2e-49e6-a', 'Paracétamol', '500Mg', 'Comprimé', 'Orale'),
(2, '071fc724-fada-4605-b', 'Doliprane', '500Mg', 'Comprimé', 'Orale');

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_ordonnance_detail_ordonnancedetail`
--

CREATE TABLE `tomegah_ordonnance_detail_ordonnancedetail` (
  `id` bigint(20) NOT NULL,
  `code_ordonnancedetail` varchar(20) NOT NULL,
  `posologie_medicament` varchar(1000) NOT NULL,
  `medicament_id` bigint(20) DEFAULT NULL,
  `ordonnance_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_ordonnance_ordonnance`
--

CREATE TABLE `tomegah_ordonnance_ordonnance` (
  `id` bigint(20) NOT NULL,
  `code_ordonnance` varchar(20) NOT NULL,
  `date_ordonnance` date NOT NULL,
  `consultation_id` bigint(20) NOT NULL,
  `medecin_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_patient_patient`
--

CREATE TABLE `tomegah_patient_patient` (
  `id` bigint(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `datenaissance` date NOT NULL,
  `civilite` varchar(3) NOT NULL,
  `dateenreg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tomegah_patient_patient`
--

INSERT INTO `tomegah_patient_patient` (`id`, `code`, `nom`, `prenom`, `datenaissance`, `civilite`, `dateenreg`) VALUES
(2, 'ipojip', 'jpojjp', 'jopjo', '2004-07-20', 'M', '2025-05-10');

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_specialite_affecterspecialite`
--

CREATE TABLE `tomegah_specialite_affecterspecialite` (
  `id` bigint(20) NOT NULL,
  `date_affectation` date NOT NULL,
  `medecin_id` bigint(20) NOT NULL,
  `specialite_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_specialite_specialite`
--

CREATE TABLE `tomegah_specialite_specialite` (
  `id` bigint(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  `libelle` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tomegah_specialite_specialite`
--

INSERT INTO `tomegah_specialite_specialite` (`id`, `code`, `libelle`) VALUES
(3, 'GEN', 'Médecine Générale'),
(4, 'PED', 'Pédiatrie'),
(5, 'GYN', 'Gynécologie-Obstétrique');

-- --------------------------------------------------------

--
-- Structure de la table `tomegah_type_acte_typeacte`
--

CREATE TABLE `tomegah_type_acte_typeacte` (
  `id` bigint(20) NOT NULL,
  `code` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tomegah_type_acte_typeacte`
--

INSERT INTO `tomegah_type_acte_typeacte` (`id`, `code`, `libelle`) VALUES
(1, 1, 'Consultation'),
(2, 2, 'Chirurgie'),
(3, 3, 'Radiologie');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authentication_utilisateur`
--
ALTER TABLE `authentication_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `authentication_utilisateur_groups`
--
ALTER TABLE `authentication_utilisateur_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authentication_utilisate_utilisateur_id_group_id_c8f16c6c_uniq` (`utilisateur_id`,`group_id`),
  ADD KEY `authentication_utili_group_id_71af78d6_fk_auth_grou` (`group_id`);

--
-- Index pour la table `authentication_utilisateur_user_permissions`
--
ALTER TABLE `authentication_utilisateur_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authentication_utilisate_utilisateur_id_permissio_f8cf8835_uniq` (`utilisateur_id`,`permission_id`),
  ADD KEY `authentication_utili_permission_id_5d74a090_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_authentic` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `tomegah_acte_acte`
--
ALTER TABLE `tomegah_acte_acte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_acte` (`code_acte`),
  ADD KEY `tomegah_acte_acte_Specialite_id_45df68dd_fk_tomegah_s` (`Specialite_id`),
  ADD KEY `tomegah_acte_acte_type_acte_id_39981b59_fk_tomegah_t` (`type_acte_id`);

--
-- Index pour la table `tomegah_consultation_consultation`
--
ALTER TABLE `tomegah_consultation_consultation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codeconsultation` (`codeconsultation`),
  ADD KEY `tomegah_consultation_medecin_id_d22c8a1d_fk_tomegah_m` (`medecin_id`),
  ADD KEY `tomegah_consultation_patient_id_abc39a90_fk_tomegah_p` (`patient_id`),
  ADD KEY `tomegah_consultation_utilisateur_id_e4fa5471_fk_authentic` (`utilisateur_id`),
  ADD KEY `tomegah_consultation_acte_id_c0ecd150_fk_tomegah_a` (`acte_id`);

--
-- Index pour la table `tomegah_facture_detail_facturedetail`
--
ALTER TABLE `tomegah_facture_detail_facturedetail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_detailfacture` (`code_detailfacture`),
  ADD KEY `tomegah_facture_deta_acte_id_64c9abf2_fk_tomegah_a` (`acte_id`),
  ADD KEY `tomegah_facture_deta_facture_id_36e1a08a_fk_tomegah_f` (`facture_id`);

--
-- Index pour la table `tomegah_facture_facture`
--
ALTER TABLE `tomegah_facture_facture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_facture` (`code_facture`),
  ADD KEY `tomegah_facture_fact_consultation_id_8d8d8050_fk_tomegah_c` (`consultation_id`),
  ADD KEY `tomegah_facture_fact_medecin_id_29925d5d_fk_tomegah_m` (`medecin_id`),
  ADD KEY `tomegah_facture_fact_utilisateur_id_83493812_fk_authentic` (`utilisateur_id`);

--
-- Index pour la table `tomegah_medecin_medecin`
--
ALTER TABLE `tomegah_medecin_medecin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `tomegah_medicament_medicament`
--
ALTER TABLE `tomegah_medicament_medicament`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_medicament` (`code_medicament`);

--
-- Index pour la table `tomegah_ordonnance_detail_ordonnancedetail`
--
ALTER TABLE `tomegah_ordonnance_detail_ordonnancedetail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_ordonnancedetail` (`code_ordonnancedetail`),
  ADD KEY `tomegah_ordonnance_d_medicament_id_b9deb066_fk_tomegah_m` (`medicament_id`),
  ADD KEY `tomegah_ordonnance_d_ordonnance_id_3c933cbd_fk_tomegah_o` (`ordonnance_id`);

--
-- Index pour la table `tomegah_ordonnance_ordonnance`
--
ALTER TABLE `tomegah_ordonnance_ordonnance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_ordonnance` (`code_ordonnance`),
  ADD KEY `tomegah_ordonnance_o_consultation_id_45a4e488_fk_tomegah_c` (`consultation_id`),
  ADD KEY `tomegah_ordonnance_o_medecin_id_f739969f_fk_tomegah_m` (`medecin_id`);

--
-- Index pour la table `tomegah_patient_patient`
--
ALTER TABLE `tomegah_patient_patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `tomegah_specialite_affecterspecialite`
--
ALTER TABLE `tomegah_specialite_affecterspecialite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tomegah_specialite_affec_medecin_id_specialite_id_eb47b0e0_uniq` (`medecin_id`,`specialite_id`),
  ADD KEY `tomegah_specialite_a_specialite_id_eb17219b_fk_tomegah_s` (`specialite_id`);

--
-- Index pour la table `tomegah_specialite_specialite`
--
ALTER TABLE `tomegah_specialite_specialite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `tomegah_type_acte_typeacte`
--
ALTER TABLE `tomegah_type_acte_typeacte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `authentication_utilisateur`
--
ALTER TABLE `authentication_utilisateur`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `authentication_utilisateur_groups`
--
ALTER TABLE `authentication_utilisateur_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `authentication_utilisateur_user_permissions`
--
ALTER TABLE `authentication_utilisateur_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `tomegah_acte_acte`
--
ALTER TABLE `tomegah_acte_acte`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tomegah_consultation_consultation`
--
ALTER TABLE `tomegah_consultation_consultation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tomegah_facture_detail_facturedetail`
--
ALTER TABLE `tomegah_facture_detail_facturedetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tomegah_facture_facture`
--
ALTER TABLE `tomegah_facture_facture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `tomegah_medecin_medecin`
--
ALTER TABLE `tomegah_medecin_medecin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tomegah_medicament_medicament`
--
ALTER TABLE `tomegah_medicament_medicament`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tomegah_ordonnance_detail_ordonnancedetail`
--
ALTER TABLE `tomegah_ordonnance_detail_ordonnancedetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tomegah_ordonnance_ordonnance`
--
ALTER TABLE `tomegah_ordonnance_ordonnance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tomegah_patient_patient`
--
ALTER TABLE `tomegah_patient_patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tomegah_specialite_affecterspecialite`
--
ALTER TABLE `tomegah_specialite_affecterspecialite`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tomegah_specialite_specialite`
--
ALTER TABLE `tomegah_specialite_specialite`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `tomegah_type_acte_typeacte`
--
ALTER TABLE `tomegah_type_acte_typeacte`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `authentication_utilisateur_groups`
--
ALTER TABLE `authentication_utilisateur_groups`
  ADD CONSTRAINT `authentication_utili_group_id_71af78d6_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `authentication_utili_utilisateur_id_2ef44d9e_fk_authentic` FOREIGN KEY (`utilisateur_id`) REFERENCES `authentication_utilisateur` (`id`);

--
-- Contraintes pour la table `authentication_utilisateur_user_permissions`
--
ALTER TABLE `authentication_utilisateur_user_permissions`
  ADD CONSTRAINT `authentication_utili_permission_id_5d74a090_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `authentication_utili_utilisateur_id_895c8d25_fk_authentic` FOREIGN KEY (`utilisateur_id`) REFERENCES `authentication_utilisateur` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_utilisateur` (`id`);

--
-- Contraintes pour la table `tomegah_acte_acte`
--
ALTER TABLE `tomegah_acte_acte`
  ADD CONSTRAINT `tomegah_acte_acte_Specialite_id_45df68dd_fk_tomegah_s` FOREIGN KEY (`Specialite_id`) REFERENCES `tomegah_specialite_specialite` (`id`),
  ADD CONSTRAINT `tomegah_acte_acte_type_acte_id_39981b59_fk_tomegah_t` FOREIGN KEY (`type_acte_id`) REFERENCES `tomegah_type_acte_typeacte` (`id`);

--
-- Contraintes pour la table `tomegah_consultation_consultation`
--
ALTER TABLE `tomegah_consultation_consultation`
  ADD CONSTRAINT `tomegah_consultation_acte_id_c0ecd150_fk_tomegah_a` FOREIGN KEY (`acte_id`) REFERENCES `tomegah_acte_acte` (`id`),
  ADD CONSTRAINT `tomegah_consultation_medecin_id_d22c8a1d_fk_tomegah_m` FOREIGN KEY (`medecin_id`) REFERENCES `tomegah_medecin_medecin` (`id`),
  ADD CONSTRAINT `tomegah_consultation_patient_id_abc39a90_fk_tomegah_p` FOREIGN KEY (`patient_id`) REFERENCES `tomegah_patient_patient` (`id`),
  ADD CONSTRAINT `tomegah_consultation_utilisateur_id_e4fa5471_fk_authentic` FOREIGN KEY (`utilisateur_id`) REFERENCES `authentication_utilisateur` (`id`);

--
-- Contraintes pour la table `tomegah_facture_detail_facturedetail`
--
ALTER TABLE `tomegah_facture_detail_facturedetail`
  ADD CONSTRAINT `tomegah_facture_deta_acte_id_64c9abf2_fk_tomegah_a` FOREIGN KEY (`acte_id`) REFERENCES `tomegah_acte_acte` (`id`),
  ADD CONSTRAINT `tomegah_facture_deta_facture_id_36e1a08a_fk_tomegah_f` FOREIGN KEY (`facture_id`) REFERENCES `tomegah_facture_facture` (`id`);

--
-- Contraintes pour la table `tomegah_facture_facture`
--
ALTER TABLE `tomegah_facture_facture`
  ADD CONSTRAINT `tomegah_facture_fact_consultation_id_8d8d8050_fk_tomegah_c` FOREIGN KEY (`consultation_id`) REFERENCES `tomegah_consultation_consultation` (`id`),
  ADD CONSTRAINT `tomegah_facture_fact_medecin_id_29925d5d_fk_tomegah_m` FOREIGN KEY (`medecin_id`) REFERENCES `tomegah_medecin_medecin` (`id`),
  ADD CONSTRAINT `tomegah_facture_fact_utilisateur_id_83493812_fk_authentic` FOREIGN KEY (`utilisateur_id`) REFERENCES `authentication_utilisateur` (`id`);

--
-- Contraintes pour la table `tomegah_ordonnance_detail_ordonnancedetail`
--
ALTER TABLE `tomegah_ordonnance_detail_ordonnancedetail`
  ADD CONSTRAINT `tomegah_ordonnance_d_medicament_id_b9deb066_fk_tomegah_m` FOREIGN KEY (`medicament_id`) REFERENCES `tomegah_medicament_medicament` (`id`),
  ADD CONSTRAINT `tomegah_ordonnance_d_ordonnance_id_3c933cbd_fk_tomegah_o` FOREIGN KEY (`ordonnance_id`) REFERENCES `tomegah_ordonnance_ordonnance` (`id`);

--
-- Contraintes pour la table `tomegah_ordonnance_ordonnance`
--
ALTER TABLE `tomegah_ordonnance_ordonnance`
  ADD CONSTRAINT `tomegah_ordonnance_o_consultation_id_45a4e488_fk_tomegah_c` FOREIGN KEY (`consultation_id`) REFERENCES `tomegah_consultation_consultation` (`id`),
  ADD CONSTRAINT `tomegah_ordonnance_o_medecin_id_f739969f_fk_tomegah_m` FOREIGN KEY (`medecin_id`) REFERENCES `tomegah_medecin_medecin` (`id`);

--
-- Contraintes pour la table `tomegah_specialite_affecterspecialite`
--
ALTER TABLE `tomegah_specialite_affecterspecialite`
  ADD CONSTRAINT `tomegah_specialite_a_medecin_id_075faa32_fk_tomegah_m` FOREIGN KEY (`medecin_id`) REFERENCES `tomegah_medecin_medecin` (`id`),
  ADD CONSTRAINT `tomegah_specialite_a_specialite_id_eb17219b_fk_tomegah_s` FOREIGN KEY (`specialite_id`) REFERENCES `tomegah_specialite_specialite` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
