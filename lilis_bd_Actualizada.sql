-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-10-2025 a las 15:57:38
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lilis_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_permission`
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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Categoria', 7, 'add_categoria'),
(26, 'Can change Categoria', 7, 'change_categoria'),
(27, 'Can delete Categoria', 7, 'delete_categoria'),
(28, 'Can view Categoria', 7, 'view_categoria'),
(29, 'Can add producto', 8, 'add_producto'),
(30, 'Can change producto', 8, 'change_producto'),
(31, 'Can delete producto', 8, 'delete_producto'),
(32, 'Can view producto', 8, 'view_producto'),
(33, 'Can add Proveedor', 9, 'add_proveedor'),
(34, 'Can change Proveedor', 9, 'change_proveedor'),
(35, 'Can delete Proveedor', 9, 'delete_proveedor'),
(36, 'Can view Proveedor', 9, 'view_proveedor'),
(37, 'Can add Región', 10, 'add_region'),
(38, 'Can change Región', 10, 'change_region'),
(39, 'Can delete Región', 10, 'delete_region'),
(40, 'Can view Región', 10, 'view_region');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$brPyXMn577mkyULYv8vLSG$ZvcpOcS7W3MVfBi9lcrlLXyOxomC5wsENhHFSe9qZT8=', '2025-10-07 17:38:16.669244', 1, 'adminlilis', '', '', 'adminlilis@correo.com', 1, 1, '2025-10-07 01:45:17.970544');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Chocolates'),
(2, 'Galletas'),
(3, 'Alfajores'),
(7, 'Bomboneria'),
(6, 'Confiteria'),
(8, 'Categoria Profe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_spanish2_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_spanish2_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-10-07 14:16:30.267257', '1', 'Chocolates', 1, '[{\"added\": {}}]', 7, 1),
(2, '2025-10-07 14:16:38.236090', '2', 'Galletas', 1, '[{\"added\": {}}]', 7, 1),
(3, '2025-10-07 14:16:43.520608', '3', 'Alfajores', 1, '[{\"added\": {}}]', 7, 1),
(4, '2025-10-07 14:16:57.162632', '4', 'Confitería', 1, '[{\"added\": {}}]', 7, 1),
(5, '2025-10-07 14:17:10.183827', '5', 'Bombonería', 1, '[{\"added\": {}}]', 7, 1),
(6, '2025-10-07 14:19:05.455502', '1', 'Chocolate bitter - Chocolates', 1, '[{\"added\": {}}]', 8, 1),
(7, '2025-10-07 14:20:04.589341', '2', 'Chocolate con almendras - Chocolates', 1, '[{\"added\": {}}]', 8, 1),
(8, '2025-10-07 14:21:22.046234', '3', 'Chocolate blanco - Chocolates', 1, '[{\"added\": {}}]', 8, 1),
(9, '2025-10-07 14:22:13.572825', '4', 'Galleta de avena - Galletas', 1, '[{\"added\": {}}]', 8, 1),
(10, '2025-10-07 14:22:54.034001', '5', 'Galleta chips - Galletas', 1, '[{\"added\": {}}]', 8, 1),
(11, '2025-10-07 14:23:34.976465', '6', 'Galleta de mantequilla - Galletas', 1, '[{\"added\": {}}]', 8, 1),
(12, '2025-10-07 14:24:17.539332', '7', 'Alfajor de papaya - Alfajores', 1, '[{\"added\": {}}]', 8, 1),
(13, '2025-10-07 14:25:11.944473', '8', 'Alfajor de nuez - Alfajores', 1, '[{\"added\": {}}]', 8, 1),
(14, '2025-10-07 14:26:45.657696', '9', 'Alfajor vegano - Alfajores', 1, '[{\"added\": {}}]', 8, 1),
(15, '2025-10-07 14:27:41.258183', '10', 'Bombón trufa - Bombonería', 1, '[{\"added\": {}}]', 8, 1),
(16, '2025-10-07 14:28:40.143269', '11', 'Bombón café - Bombonería', 1, '[{\"added\": {}}]', 8, 1),
(17, '2025-10-07 14:29:24.286584', '12', 'Calugas de manjar de cabra - Confitería', 1, '[{\"added\": {}}]', 8, 1),
(18, '2025-10-07 14:30:09.789382', '13', 'Cuchuflí chocolate - Confitería', 1, '[{\"added\": {}}]', 8, 1),
(19, '2025-10-07 14:31:11.625354', '14', 'Gomitas frutales - Confitería', 1, '[{\"added\": {}}]', 8, 1),
(20, '2025-10-07 14:47:59.873656', '5', 'Bombonería', 3, '', 7, 1),
(21, '2025-10-07 14:47:59.873704', '4', 'Confitería', 3, '', 7, 1),
(22, '2025-10-07 14:48:11.904630', '6', 'Confiteria', 1, '[{\"added\": {}}]', 7, 1),
(23, '2025-10-07 14:48:16.304797', '7', 'Bomboneria', 1, '[{\"added\": {}}]', 7, 1),
(24, '2025-10-07 14:49:36.751371', '15', 'Bombón trufa - Bomboneria', 1, '[{\"added\": {}}]', 8, 1),
(25, '2025-10-07 14:50:22.008461', '16', 'Bombón café - Bomboneria', 1, '[{\"added\": {}}]', 8, 1),
(26, '2025-10-07 14:50:58.983699', '17', 'Calugas de manjar de cabra - Confiteria', 1, '[{\"added\": {}}]', 8, 1),
(27, '2025-10-07 14:51:46.385389', '18', 'Cuchuflí chocolate - Confiteria', 1, '[{\"added\": {}}]', 8, 1),
(28, '2025-10-07 14:52:40.896872', '19', 'Gomitas frutales - Confiteria', 1, '[{\"added\": {}}]', 8, 1),
(29, '2025-10-07 16:18:39.965042', '1', 'Región de Coquimbo', 1, '[{\"added\": {}}]', 10, 1),
(30, '2025-10-07 16:18:54.380891', '2', 'Región de Valparaíso', 1, '[{\"added\": {}}]', 10, 1),
(31, '2025-10-07 16:19:07.033808', '3', 'Región Metropolitana', 1, '[{\"added\": {}}]', 10, 1),
(32, '2025-10-07 16:19:22.371653', '4', 'Región del Maule', 1, '[{\"added\": {}}]', 10, 1),
(33, '2025-10-07 16:19:47.454716', '5', 'Región de O\'Higgins', 1, '[{\"added\": {}}]', 10, 1),
(34, '2025-10-07 16:21:47.612126', '1', 'Agrícola Papayas del Valle Ltda. - Materia Prima', 1, '[{\"added\": {}}]', 9, 1),
(35, '2025-10-07 16:26:28.413162', '2', 'Chocolates Premium S.A. - Materia Prima', 1, '[{\"added\": {}}]', 9, 1),
(36, '2025-10-07 16:28:04.085751', '3', 'Empaques Sustentables Chile S.A. - Embalaje', 1, '[{\"added\": {}}]', 9, 1),
(37, '2025-10-07 16:29:25.813687', '4', 'Lácteos del Sur SpA - Materia Prima', 1, '[{\"added\": {}}]', 9, 1),
(38, '2025-10-07 16:30:32.047763', '5', 'Harinas Selectas Ltda. - Materia Prima', 1, '[{\"added\": {}}]', 9, 1),
(39, '2025-10-07 16:31:49.238940', '6', 'Frutos Secos del Norte S.A. - Materia Prima', 1, '[{\"added\": {}}]', 9, 1),
(40, '2025-10-07 16:33:07.147800', '7', 'Equipos Panadería Moderna Ltda. - Equipamiento', 1, '[{\"added\": {}}]', 9, 1),
(41, '2025-10-07 16:34:53.530876', '8', 'Transporte Rápido y Seguro SpA - Servicios', 1, '[{\"added\": {}}]', 9, 1),
(42, '2025-10-07 16:36:15.230790', '9', 'Mieles Puras del Valle Central - Materia Prima', 1, '[{\"added\": {}}]', 9, 1),
(43, '2025-10-07 16:37:26.676211', '10', 'Azúcares Especiales Chile S.A. - Materia Prima', 1, '[{\"added\": {}}]', 9, 1),
(44, '2025-10-07 21:49:14.923630', '8', 'Categoria Profe', 1, '[{\"added\": {}}]', 7, 1),
(45, '2025-10-07 21:49:58.924015', '20', 'Producto Profe - Categoria Profe', 1, '[{\"added\": {}}]', 8, 1),
(46, '2025-10-07 21:50:22.943599', '6', 'Region Profe', 1, '[{\"added\": {}}]', 10, 1),
(47, '2025-10-07 21:51:38.655173', '11', 'Inacap SPA - Embalaje', 1, '[{\"added\": {}}]', 9, 1),
(48, '2025-10-09 00:22:44.541911', '1', 'Región de Coquimbo', 1, '[{\"added\": {}}]', 10, 1),
(49, '2025-10-09 00:22:58.403440', '2', 'Región de Valparaíso', 1, '[{\"added\": {}}]', 10, 1),
(50, '2025-10-09 00:23:08.507774', '3', 'Región Metropolitana', 1, '[{\"added\": {}}]', 10, 1),
(51, '2025-10-09 00:23:20.881568', '4', 'Región del Maule', 1, '[{\"added\": {}}]', 10, 1),
(52, '2025-10-09 00:23:42.571085', '5', 'Región de O\'Higgins', 1, '[{\"added\": {}}]', 10, 1),
(53, '2025-10-09 00:26:11.250703', '1', 'Proveedor Andino S.A. - 76.543.210-5', 1, '[{\"added\": {}}]', 9, 1),
(54, '2025-10-09 00:27:33.976670', '2', 'Empaques Sustentables Chile S.A. - 89.456.123-0', 1, '[{\"added\": {}}]', 9, 1),
(55, '2025-10-09 00:29:01.636562', '3', 'Chocolates Premium S.A. - 96.987.654-3', 1, '[{\"added\": {}}]', 9, 1),
(56, '2025-10-09 00:30:36.105591', '4', 'Lácteos del Sur SpA - 92.654.321-8', 1, '[{\"added\": {}}]', 9, 1),
(57, '2025-10-09 00:32:09.751886', '5', 'Harinas Selectas Ltda. - 85.321.987-4', 1, '[{\"added\": {}}]', 9, 1),
(58, '2025-10-09 00:34:01.249775', '6', 'Frutos Secos del Norte S.A. - 78.555.222-1', 1, '[{\"added\": {}}]', 9, 1),
(59, '2025-10-09 00:35:49.463449', '7', 'Equipos Panadería Moderna Ltda. - 91.444.333-9', 1, '[{\"added\": {}}]', 9, 1),
(60, '2025-10-09 00:37:18.214671', '8', 'Transporte Rápido y Seguro SpA - 83.777.888-5', 1, '[{\"added\": {}}]', 9, 1),
(61, '2025-10-09 00:38:37.594896', '9', 'Mieles Puras del Valle Central - 87.222.111-3', 1, '[{\"added\": {}}]', 9, 1),
(62, '2025-10-09 00:39:57.458077', '10', 'Azúcares Especiales Chile S.A. - 94.333.444-2', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'catalogo', 'categoria'),
(8, 'catalogo', 'producto'),
(9, 'proveedores', 'proveedor'),
(10, 'proveedores', 'region');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-10-06 19:19:53.212775'),
(2, 'auth', '0001_initial', '2025-10-06 19:19:53.656145'),
(3, 'admin', '0001_initial', '2025-10-06 19:19:53.800720'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-10-06 19:19:53.804902'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-06 19:19:53.809277'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-10-06 19:19:53.863582'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-10-06 19:19:53.892075'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-10-06 19:19:53.920636'),
(9, 'auth', '0004_alter_user_username_opts', '2025-10-06 19:19:53.926366'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-10-06 19:19:53.956584'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-10-06 19:19:53.957663'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-10-06 19:19:53.962393'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-10-06 19:19:53.992435'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-10-06 19:19:54.022300'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-10-06 19:19:54.049552'),
(16, 'auth', '0011_update_proxy_permissions', '2025-10-06 19:19:54.054717'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-10-06 19:19:54.083284'),
(18, 'catalogo', '0001_initial', '2025-10-06 19:19:54.145015'),
(19, 'sessions', '0001_initial', '2025-10-06 19:19:54.178188'),
(21, 'proveedores', '0001_initial', '2025-10-09 00:16:51.682918');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_spanish2_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('niv8wvqnyuka005u39le8q0t2hffd8vp', '.eJxVjDsOwjAQBe_iGln-fyjpOYO1Xq9xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWkq7MwkO_1uGfBBfQflDv02c5z7ukyZ7wo_6ODXudDzcrh_Bw1G-9ZE0qHLUchahAcvKAejnMCgqs5R-4okgzWKYrUoPRmq0ZMGHYIlJ9j7A-qjN-g:1v5woG:Gcj3aOV-s_udoldh9CliwtnRyRhjp3KZZQr1DzF0-cM', '2025-10-21 01:48:12.825190'),
('10nkttsxat267e5kjkwmucyciyisidt1', '.eJxVjDsOwjAQBe_iGln-fyjpOYO1Xq9xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWkq7MwkO_1uGfBBfQflDv02c5z7ukyZ7wo_6ODXudDzcrh_Bw1G-9ZE0qHLUchahAcvKAejnMCgqs5R-4okgzWKYrUoPRmq0ZMGHYIlJ9j7A-qjN-g:1v6Bdg:5gg_C7u-K1TVFkRPizFliJjwVy19jPhATxdBxiOWkd0', '2025-10-21 17:38:16.670587');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `ingredientes` longtext COLLATE utf8mb4_spanish2_ci NOT NULL,
  `tiempo_produccion` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_spanish2_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Producto_categoria_id_d52b184f` (`categoria_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `ingredientes`, `tiempo_produccion`, `descripcion`, `imagen`, `categoria_id`) VALUES
(1, 'Chocolate bitter', 'Cacao, manteca de cacao, azúcar.', '2 horas', 'Chocolate amargo 70% cacao.', 'chocolate_bitter.jpg', 1),
(2, 'Chocolate con almendras', 'Cacao, almendras, leche, azúcar.', '2 horas', 'Chocolate con trozos de almendras chilenas.', 'chocolate_almendras.jpg', 1),
(3, 'Chocolate blanco', 'Manteca de cacao, leche, azúcar.', '1.5 horas', 'Chocolate blanco artesanal.', 'chocolate_blanco.jpg', 1),
(4, 'Galleta de avena', 'Avena, pasas, harina, huevo, azúcar.', '40 minutos', 'Galleta casera de avena con pasas.', 'galleta_avena.jpg', 2),
(5, 'Galleta chips', 'Harina, mantequilla, azúcar, chips de chocolate.', '35 minutos', 'Galleta de mantequilla con chips de chocolate.', 'galleta_chips.jpg', 2),
(6, 'Galleta de mantequilla', 'Harina, mantequilla, azúcar.', '30 minutos', 'Clásica galleta de mantequilla.', 'galleta_mantequilla.jpg', 2),
(7, 'Alfajor de papaya', 'Harina, huevo, papaya, azúcar, leche.', '2 horas', 'Alfajor relleno con papaya chilena.', 'alfajor_papaya.jpg', 3),
(8, 'Alfajor de nuez', 'Harina, huevo, nueces, azúcar, leche condensada.', '2.5 horas', 'Alfajor relleno con crema de nuez chilena.', 'alfajor_nuez.jpg', 3),
(9, 'Alfajor vegano', 'Harina de almendras, leche de coco, endulzante natural, cacao.', '3 horas', 'Alfajor sin productos de origen animal, relleno de manjar vegano.', 'alfajor_vegano.jpg', 3),
(19, 'Gomitas frutales', 'Gelatina, jugo de frutas natural, azúcar, colorantes vegetales.', '45 minutos', 'Gomitas suaves con sabores frutales naturales.', 'gomitas.jpg', 6),
(15, 'Bombón trufa', 'Chocolate, crema, cacao en polvo.', '1 hora', 'Bombón relleno de ganache de chocolate.', 'bombon_trufa.jpg', 7),
(16, 'Bombón café', 'Chocolate, café, crema, azúcar.', '1 hora', 'Bombón con relleno de café.', 'bombon_cafe.jpg', 7),
(17, 'Calugas de manjar de cabra', 'Leche de cabra, azúcar, mantequilla.', '1.5 horas', 'Dulces de leche de cabra con caramelo.', 'calugas.jpg', 6),
(18, 'Cuchuflí chocolate', 'Harina, huevo, chocolate, azúcar, vainilla.', '1 hora', 'Cuchuflí relleno de chocolate artesanal.', 'cuchufli.jpg', 6),
(20, 'Producto Profe', 'p, r, o, f,e', '2 horas', 'muy rico', 'default.jpg', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rut_nif` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombre_fantasia` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `sitio_web` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ciudad` varchar(128) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `pais` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `condiciones_pago` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `moneda` varchar(8) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `contacto_principal_nombre` varchar(120) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `contacto_principal_email` varchar(254) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `contacto_principal_telefono` varchar(30) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `observaciones` longtext COLLATE utf8mb4_spanish2_ci,
  `region_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut_nif` (`rut_nif`),
  KEY `proveedor_region_id_b8d977c0` (`region_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `rut_nif`, `razon_social`, `nombre_fantasia`, `email`, `telefono`, `sitio_web`, `direccion`, `ciudad`, `pais`, `condiciones_pago`, `moneda`, `contacto_principal_nombre`, `contacto_principal_email`, `contacto_principal_telefono`, `estado`, `observaciones`, `region_id`) VALUES
(1, '76.543.210-5', 'Proveedor Andino S.A.', 'AndinoPro', 'contacto@andinopro.cl', '+56 2 2345 6789', 'https://andinopro.cl', 'Av. Industrial 123, Parque Industrial', 'La Serena', 'Chile', '30_dias', 'CLP', 'Juan Pérez', 'juan.perez@andinopro.cl', '+56 9 8765 4321', 'ACTIVO', 'Proveedor preferente para frutas secas', 1),
(2, '89.456.123-0', 'Empaques Sustentables Chile S.A.', 'EcoPack', 'contacto@ecopack.cl', '+56 32 2456 890', 'https://ecopack.cl', 'Camino La Pólvora 2890', 'Valparaíso', 'Chile', '30_dias', 'CLP', 'María González', 'maria.gonzalez@ecopack.cl', '+56 9 7654 3210', 'ACTIVO', 'Especialistas en packaging biodegradable', 2),
(3, '96.987.654-3', 'Chocolates Premium S.A.', 'ChocoPremium', 'pedidos@chocopremium.cl', '+56 2 2345 6789', 'https://chocopremium.cl', 'Av. Industrial 2450', 'Santiago', 'Chile', '60_dias', 'CLP', 'Carlos López', 'carlos.lopez@chocopremium.cl', '+56 9 6543 2109', 'ACTIVO', 'Chocolate belga de alta calidad', 3),
(4, '92.654.321-8', 'Lácteos del Sur SpA', 'LactSur', 'produccion@lactsur.cl', '+56 71 234 8765', 'https://lactsur.cl', 'Ruta 5 Sur Km 420', 'Talca', 'Chile', '30_dias', 'CLP', 'Ana Silva', 'ana.silva@lactsur.cl', '+56 9 5432 1098', 'ACTIVO', 'Manjar artesanal de leche de cabra', 4),
(5, '85.321.987-4', 'Harinas Selectas Ltda.', 'HarinaSelect', 'ventas@harinaselect.cl', '+56 72 234 5678', 'https://harinaselect.cl', 'Av. Los Placeres 1250', 'Rancagua', 'Chile', '30_dias', 'CLP', 'Pedro Martínez', 'pedro.martinez@harinaselect.cl', '+56 9 4321 0987', 'ACTIVO', 'Harinas orgánicas sin gluten', 5),
(6, '78.555.222-1', 'Frutos Secos del Norte S.A.', 'NutNorth', 'info@nutnorth.cl', '+56 51 876 5432', 'https://nutnorth.cl', 'Calle Los Almendros 450', 'Ovalle', 'Chile', '30_dias', 'CLP', 'Laura Rojas', 'laura.rojas@nutnorth.cl', '+56 9 3210 9876', 'ACTIVO', 'Nueces y almendras de exportación', 1),
(7, '91.444.333-9', 'Equipos Panadería Moderna Ltda.', 'PanaderíaTech', 'soporte@panaderiatech.cl', '+56 2 2876 5432', 'https://panaderiatech.cl', 'Av. Tecnológica 789', 'Santiago', 'Chile', '90_dias', 'CLP', 'Roberto Díaz', 'roberto.diaz@panaderiatech.cl', '+56 9 2109 8765', 'ACTIVO', 'Equipos industriales para panadería', 3),
(8, '83.777.888-5', 'Transporte Rápido y Seguro SpA', 'RapidLogistic', 'despachos@rapidlogistic.cl', '+56 32 987 6543', 'https://rapidlogistic.cl', 'Terminal Logístico 225', 'Llay Llay', 'Chile', 'contado', 'CLP', 'Diego Soto', 'diego.soto@rapidlogistic.cl', '+56 9 1098 7654', 'ACTIVO', 'Servicio express 24/7', 2),
(9, '87.222.111-3', 'Mieles Puras del Valle Central', 'MielValle', 'ventas@mielvalle.cl', '+56 71 987 6543', 'https://mielvalle.cl', 'Camino Los Olivos 123', 'Curicó', 'Chile', '30_dias', 'CLP', 'Claudia Muñoz', 'claudia.munoz@mielvalle.cl', '+56 9 0987 6543', 'ACTIVO', 'Miel orgánica certificada', 4),
(10, '94.333.444-2', 'Azúcares Especiales Chile S.A.', 'AzúcarSpecial', 'pedidos@azucarspecial.cl', '+56 72 888 7766', 'https://azucarspecial.cl', 'Zona Industrial 550', 'Rengo', 'Chile', '60_dias', 'CLP', 'Fernando Vega', 'fernando.vega@azucarspecial.cl', '+56 9 9876 5432', 'ACTIVO', 'Endulzantes naturales y stevia', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `codigo` varchar(5) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `nombre`, `codigo`) VALUES
(1, 'Región de Coquimbo', 'IV'),
(2, 'Región de Valparaíso', 'V'),
(3, 'Región Metropolitana', 'RM'),
(4, 'Región del Maule', 'VII'),
(5, 'Región de O\'Higgins', 'VI');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
