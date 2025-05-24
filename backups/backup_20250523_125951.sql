-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: mercapp
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mercapp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mercapp` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mercapp`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add factura',6,'add_factura'),(22,'Can change factura',6,'change_factura'),(23,'Can delete factura',6,'delete_factura'),(24,'Can view factura',6,'view_factura'),(25,'Can add producto',7,'add_producto'),(26,'Can change producto',7,'change_producto'),(27,'Can delete producto',7,'delete_producto'),(28,'Can view producto',7,'view_producto'),(29,'Can add proveedor',8,'add_proveedor'),(30,'Can change proveedor',8,'change_proveedor'),(31,'Can delete proveedor',8,'delete_proveedor'),(32,'Can view proveedor',8,'view_proveedor'),(33,'Can add user',9,'add_customuser'),(34,'Can change user',9,'change_customuser'),(35,'Can delete user',9,'delete_customuser'),(36,'Can view user',9,'view_customuser'),(37,'Can add user',10,'add_customcliente'),(38,'Can change user',10,'change_customcliente'),(39,'Can delete user',10,'delete_customcliente'),(40,'Can view user',10,'view_customcliente'),(41,'Can add order',11,'add_order'),(42,'Can change order',11,'change_order'),(43,'Can delete order',11,'delete_order'),(44,'Can view order',11,'view_order'),(45,'Can add order product',12,'add_orderproduct'),(46,'Can change order product',12,'change_orderproduct'),(47,'Can delete order product',12,'delete_orderproduct'),(48,'Can view order product',12,'view_orderproduct'),(49,'Can add registro actividad',13,'add_registroactividad'),(50,'Can change registro actividad',13,'change_registroactividad'),(51,'Can delete registro actividad',13,'delete_registroactividad'),(52,'Can view registro actividad',13,'view_registroactividad'),(53,'Can add resumen compra',14,'add_resumencompra'),(54,'Can change resumen compra',14,'change_resumencompra'),(55,'Can delete resumen compra',14,'delete_resumencompra'),(56,'Can view resumen compra',14,'view_resumencompra');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb3_spanish2_ci,
  `object_repr` varchar(200) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb3_spanish2_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_libreria_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_libreria_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `libreria_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(10,'libreria','customcliente'),(9,'libreria','customuser'),(6,'libreria','factura'),(11,'libreria','order'),(12,'libreria','orderproduct'),(7,'libreria','producto'),(8,'libreria','proveedor'),(13,'libreria','registroactividad'),(14,'libreria','resumencompra'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-22 20:52:06.024635'),(2,'contenttypes','0002_remove_content_type_name','2025-05-22 20:52:06.155032'),(3,'auth','0001_initial','2025-05-22 20:52:06.667350'),(4,'auth','0002_alter_permission_name_max_length','2025-05-22 20:52:06.790289'),(5,'auth','0003_alter_user_email_max_length','2025-05-22 20:52:06.807910'),(6,'auth','0004_alter_user_username_opts','2025-05-22 20:52:06.851143'),(7,'auth','0005_alter_user_last_login_null','2025-05-22 20:52:06.871972'),(8,'auth','0006_require_contenttypes_0002','2025-05-22 20:52:06.944403'),(9,'auth','0007_alter_validators_add_error_messages','2025-05-22 20:52:06.970834'),(10,'auth','0008_alter_user_username_max_length','2025-05-22 20:52:07.036413'),(11,'auth','0009_alter_user_last_name_max_length','2025-05-22 20:52:07.110936'),(12,'auth','0010_alter_group_name_max_length','2025-05-22 20:52:07.387432'),(13,'auth','0011_update_proxy_permissions','2025-05-22 20:52:07.425245'),(14,'auth','0012_alter_user_first_name_max_length','2025-05-22 20:52:07.462964'),(15,'libreria','0001_initial','2025-05-22 20:52:09.712781'),(16,'admin','0001_initial','2025-05-22 20:52:09.959881'),(17,'admin','0002_logentry_remove_auto_add','2025-05-22 20:52:09.977147'),(18,'admin','0003_logentry_add_action_flag_choices','2025-05-22 20:52:10.020905'),(19,'sessions','0001_initial','2025-05-22 20:52:10.135163');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb3_spanish2_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dqkf2rxivi9sdtsndqc1a3yrr06etxxp','.eJxVjDsOwjAQBe_iGln-EH8o6XMGa727wQFkS3FSIe4OkVJA-2bmvUSCbS1p67ykmcRFaHH63TLgg-sO6A711iS2ui5zlrsiD9rl2Iif18P9OyjQy7cG5QnPJgTw5Hii6KM2kx4GS97a7I1DVECOLGTl0GmmGKImjANHzizeH-oXOHM:1uIDwj:cqHsB04WBva78Kr-jBE_qCKefrwdKJAScL95c_4ovEA','2025-06-05 21:59:25.007411'),('excpd4ekbkj4sxe64ikfxs1r9abs5fva','.eJxVjDsOwjAQBe_iGln-EH8o6XMGa727wQFkS3FSIe4OkVJA-2bmvUSCbS1p67ykmcRFaHH63TLgg-sO6A711iS2ui5zlrsiD9rl2Iif18P9OyjQy7cG5QnPJgTw5Hii6KM2kx4GS97a7I1DVECOLGTl0GmmGKImjANHzizeH-oXOHM:1uIWA4:_Ijhn3kHEkY0E0BbhW30Wf98xqoMNaZrUCUcT56mCG0','2025-06-06 17:26:24.994835'),('gqwxbdoykyv6phnhenmk6hrreef6kk2y','.eJxVjDsOwjAQBe_iGln-EH8o6XMGa727wQFkS3FSIe4OkVJA-2bmvUSCbS1p67ykmcRFaHH63TLgg-sO6A711iS2ui5zlrsiD9rl2Iif18P9OyjQy7cG5QnPJgTw5Hii6KM2kx4GS97a7I1DVECOLGTl0GmmGKImjANHzizeH-oXOHM:1uIDv1:oUZsvg1ESznHwu_jWjk7NZtnyPmFN5Hk3d6ug3IRF8c','2025-06-05 21:57:39.760649'),('n4lmw0yhxpsyadkbdts24gg4xr9pxhw1','.eJxVjDsOwjAQBe_iGln-EH8o6XMGa727wQFkS3FSIe4OkVJA-2bmvUSCbS1p67ykmcRFaHH63TLgg-sO6A711iS2ui5zlrsiD9rl2Iif18P9OyjQy7cG5QnPJgTw5Hii6KM2kx4GS97a7I1DVECOLGTl0GmmGKImjANHzizeH-oXOHM:1uIDAl:Wj8F8k3oFINGRsv4rQnIglGWJf0ZjvJ_u_hyMkpb56s','2025-06-05 21:09:51.018443'),('smj8mak1eoybl1vlch6ma7x9apijqdcw','.eJxVjDsOwjAQBe_iGln-EH8o6XMGa727wQFkS3FSIe4OkVJA-2bmvUSCbS1p67ykmcRFaHH63TLgg-sO6A711iS2ui5zlrsiD9rl2Iif18P9OyjQy7cG5QnPJgTw5Hii6KM2kx4GS97a7I1DVECOLGTl0GmmGKImjANHzizeH-oXOHM:1uIWPK:NlbyNhwN1Eq-p9-91yje0CaAU-hY_YJURIxchp77bs0','2025-06-06 17:42:10.587111');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_customcliente`
--

DROP TABLE IF EXISTS `libreria_customcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_customcliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `roleCliente` varchar(10) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `CC` varchar(10) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(250) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellido` varchar(250) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `CC` (`CC`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_customcliente`
--

LOCK TABLES `libreria_customcliente` WRITE;
/*!40000 ALTER TABLE `libreria_customcliente` DISABLE KEYS */;
INSERT INTO `libreria_customcliente` VALUES (1,'pbkdf2_sha256$1000000$XRcNoGxRYHFp0U2HDKKOqZ$KgqbgtN4MkLSPS+Fo132By2teWDHP2ledKIOVKizz08=','2025-05-22 21:09:24.975254',0,'1111111111','','',0,1,'2025-05-22 20:53:19.518719','user','Cliente@gmail.com','91847812','1111111111','Prueba','Cliente');
/*!40000 ALTER TABLE `libreria_customcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_customcliente_groups`
--

DROP TABLE IF EXISTS `libreria_customcliente_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_customcliente_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customcliente_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libreria_customcliente_g_customcliente_id_group_i_57b4cd4c_uniq` (`customcliente_id`,`group_id`),
  KEY `libreria_customcliente_groups_group_id_12f6e96a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `libreria_customclien_customcliente_id_583af723_fk_libreria_` FOREIGN KEY (`customcliente_id`) REFERENCES `libreria_customcliente` (`id`),
  CONSTRAINT `libreria_customcliente_groups_group_id_12f6e96a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_customcliente_groups`
--

LOCK TABLES `libreria_customcliente_groups` WRITE;
/*!40000 ALTER TABLE `libreria_customcliente_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `libreria_customcliente_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_customcliente_user_permissions`
--

DROP TABLE IF EXISTS `libreria_customcliente_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_customcliente_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customcliente_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libreria_customcliente_u_customcliente_id_permiss_3c63c150_uniq` (`customcliente_id`,`permission_id`),
  KEY `libreria_customclien_permission_id_c836d9bc_fk_auth_perm` (`permission_id`),
  CONSTRAINT `libreria_customclien_customcliente_id_5eddf0b2_fk_libreria_` FOREIGN KEY (`customcliente_id`) REFERENCES `libreria_customcliente` (`id`),
  CONSTRAINT `libreria_customclien_permission_id_c836d9bc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_customcliente_user_permissions`
--

LOCK TABLES `libreria_customcliente_user_permissions` WRITE;
/*!40000 ALTER TABLE `libreria_customcliente_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `libreria_customcliente_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_customuser`
--

DROP TABLE IF EXISTS `libreria_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `cec` varchar(10) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(250) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellido` varchar(250) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cec` (`cec`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_customuser`
--

LOCK TABLES `libreria_customuser` WRITE;
/*!40000 ALTER TABLE `libreria_customuser` DISABLE KEYS */;
INSERT INTO `libreria_customuser` VALUES (1,'pbkdf2_sha256$1000000$FgardYe8e7BXl2VC75kgMm$SmGuqT1anu0VTFYwWwGtged6R/PyOugElm9FQeQNuqA=','2025-05-23 17:42:10.542983',0,'1051472774','','','2025-05-22 20:54:15.812295','admin','milenaholguin95@gmail.com','1204701279','1051472774','Thiago Lopez','__',' No activo',1,0);
/*!40000 ALTER TABLE `libreria_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_customuser_groups`
--

DROP TABLE IF EXISTS `libreria_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libreria_customuser_groups_customuser_id_group_id_00351eff_uniq` (`customuser_id`,`group_id`),
  KEY `libreria_customuser_groups_group_id_071f7f88_fk_auth_group_id` (`group_id`),
  CONSTRAINT `libreria_customuser__customuser_id_3af84ce6_fk_libreria_` FOREIGN KEY (`customuser_id`) REFERENCES `libreria_customuser` (`id`),
  CONSTRAINT `libreria_customuser_groups_group_id_071f7f88_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_customuser_groups`
--

LOCK TABLES `libreria_customuser_groups` WRITE;
/*!40000 ALTER TABLE `libreria_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `libreria_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_customuser_user_permissions`
--

DROP TABLE IF EXISTS `libreria_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libreria_customuser_user_customuser_id_permission_e5838e6e_uniq` (`customuser_id`,`permission_id`),
  KEY `libreria_customuser__permission_id_1ff0bbce_fk_auth_perm` (`permission_id`),
  CONSTRAINT `libreria_customuser__customuser_id_4221e7cc_fk_libreria_` FOREIGN KEY (`customuser_id`) REFERENCES `libreria_customuser` (`id`),
  CONSTRAINT `libreria_customuser__permission_id_1ff0bbce_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_customuser_user_permissions`
--

LOCK TABLES `libreria_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `libreria_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `libreria_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_factura`
--

DROP TABLE IF EXISTS `libreria_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_factura` (
  `imagen` varchar(100) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `descripcion` longtext COLLATE utf8mb3_spanish2_ci NOT NULL,
  `numero_factura` int NOT NULL AUTO_INCREMENT,
  `fecha_publicacion` datetime(6) NOT NULL,
  `habilitada` tinyint(1) NOT NULL,
  PRIMARY KEY (`numero_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_factura`
--

LOCK TABLES `libreria_factura` WRITE;
/*!40000 ALTER TABLE `libreria_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `libreria_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_order`
--

DROP TABLE IF EXISTS `libreria_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `libreria_order_user_id_dab8c87f_fk_libreria_customcliente_id` (`user_id`),
  CONSTRAINT `libreria_order_user_id_dab8c87f_fk_libreria_customcliente_id` FOREIGN KEY (`user_id`) REFERENCES `libreria_customcliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_order`
--

LOCK TABLES `libreria_order` WRITE;
/*!40000 ALTER TABLE `libreria_order` DISABLE KEYS */;
INSERT INTO `libreria_order` VALUES (1,'2025-05-22 20:57:25.760109','2025-05-22 20:57:55.641077',0,1),(2,'2025-05-22 20:57:59.807597','2025-05-22 20:58:27.953800',0,1),(3,'2025-05-22 20:58:30.078097','2025-05-22 21:09:38.581006',0,1),(4,'2025-05-22 21:09:40.445522','2025-05-22 21:09:40.445564',1,1);
/*!40000 ALTER TABLE `libreria_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_orderproduct`
--

DROP TABLE IF EXISTS `libreria_orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_orderproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `libreria_orderproduct_order_id_3d703383_fk_libreria_order_id` (`order_id`),
  KEY `libreria_orderproduc_product_id_734f2894_fk_libreria_` (`product_id`),
  CONSTRAINT `libreria_orderproduc_product_id_734f2894_fk_libreria_` FOREIGN KEY (`product_id`) REFERENCES `libreria_producto` (`id`),
  CONSTRAINT `libreria_orderproduct_order_id_3d703383_fk_libreria_order_id` FOREIGN KEY (`order_id`) REFERENCES `libreria_order` (`id`),
  CONSTRAINT `libreria_orderproduct_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_orderproduct`
--

LOCK TABLES `libreria_orderproduct` WRITE;
/*!40000 ALTER TABLE `libreria_orderproduct` DISABLE KEYS */;
INSERT INTO `libreria_orderproduct` VALUES (1,1,1,1),(2,8,1,1),(3,10,1,2),(4,1,2,1),(5,1,2,1),(6,1,2,2),(7,5,3,1),(8,5,3,1),(9,4,3,2);
/*!40000 ALTER TABLE `libreria_orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_producto`
--

DROP TABLE IF EXISTS `libreria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb3_spanish2_ci NOT NULL,
  `origen` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `unidad` double NOT NULL,
  `stock` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `publicado` tinyint(1) NOT NULL,
  `medida` varchar(50) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tipoproducto` varchar(20) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_producto`
--

LOCK TABLES `libreria_producto` WRITE;
/*!40000 ALTER TABLE `libreria_producto` DISABLE KEYS */;
INSERT INTO `libreria_producto` VALUES (1,'productos/Aguacate.jpg','Aguacate','NA','NA',1,979,12000.00,1,'KILO','frutas',1),(2,'productos/Maracuya.jpg','MARACUYA','NA','NA',1,985,12000.00,1,'KILO','frutas',1),(3,'productos/mango.jpg','Mango','maguitoss','na',2,10000,3400.00,1,'kilos','hortalizas',1);
/*!40000 ALTER TABLE `libreria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_proveedor`
--

DROP TABLE IF EXISTS `libreria_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_proveedor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `correo` varchar(254) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_proveedor`
--

LOCK TABLES `libreria_proveedor` WRITE;
/*!40000 ALTER TABLE `libreria_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `libreria_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_registroactividad`
--

DROP TABLE IF EXISTS `libreria_registroactividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_registroactividad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `accion` varchar(255) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `detalle` longtext COLLATE utf8mb3_spanish2_ci,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `libreria_registroact_usuario_id_e332a7f9_fk_libreria_` (`usuario_id`),
  CONSTRAINT `libreria_registroact_usuario_id_e332a7f9_fk_libreria_` FOREIGN KEY (`usuario_id`) REFERENCES `libreria_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_registroactividad`
--

LOCK TABLES `libreria_registroactividad` WRITE;
/*!40000 ALTER TABLE `libreria_registroactividad` DISABLE KEYS */;
INSERT INTO `libreria_registroactividad` VALUES (1,'2025-05-22 20:55:57.457978','Registro de producto','Se agregó un nuevo producto: Aguacate',1),(2,'2025-05-22 20:56:31.979816','Registro de producto','Se agregó un nuevo producto: MARACUYA',1),(3,'2025-05-23 17:38:16.586857','Registro de producto','Se agregó un nuevo producto: Mango',1);
/*!40000 ALTER TABLE `libreria_registroactividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_resumencompra`
--

DROP TABLE IF EXISTS `libreria_resumencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_resumencompra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `total_con_iva` decimal(10,2) NOT NULL,
  `fecha_compra` datetime(6) NOT NULL,
  `cliente_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `libreria_resumencomp_cliente_id_88907a3f_fk_libreria_` (`cliente_id`),
  CONSTRAINT `libreria_resumencomp_cliente_id_88907a3f_fk_libreria_` FOREIGN KEY (`cliente_id`) REFERENCES `libreria_customcliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_resumencompra`
--

LOCK TABLES `libreria_resumencompra` WRITE;
/*!40000 ALTER TABLE `libreria_resumencompra` DISABLE KEYS */;
INSERT INTO `libreria_resumencompra` VALUES (1,228000.00,43320.00,271320.00,'2025-05-22 20:57:55.478539',1),(2,36000.00,6840.00,42840.00,'2025-05-22 20:58:27.840095',1),(3,168000.00,31920.00,199920.00,'2025-05-22 21:09:38.491192',1);
/*!40000 ALTER TABLE `libreria_resumencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria_resumencompra_orderproduct_set`
--

DROP TABLE IF EXISTS `libreria_resumencompra_orderproduct_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria_resumencompra_orderproduct_set` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resumencompra_id` bigint NOT NULL,
  `orderproduct_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libreria_resumencompra_o_resumencompra_id_orderpr_f967722c_uniq` (`resumencompra_id`,`orderproduct_id`),
  KEY `libreria_resumencomp_orderproduct_id_8f0ce075_fk_libreria_` (`orderproduct_id`),
  CONSTRAINT `libreria_resumencomp_orderproduct_id_8f0ce075_fk_libreria_` FOREIGN KEY (`orderproduct_id`) REFERENCES `libreria_orderproduct` (`id`),
  CONSTRAINT `libreria_resumencomp_resumencompra_id_952d761c_fk_libreria_` FOREIGN KEY (`resumencompra_id`) REFERENCES `libreria_resumencompra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_resumencompra_orderproduct_set`
--

LOCK TABLES `libreria_resumencompra_orderproduct_set` WRITE;
/*!40000 ALTER TABLE `libreria_resumencompra_orderproduct_set` DISABLE KEYS */;
INSERT INTO `libreria_resumencompra_orderproduct_set` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6),(7,3,7),(8,3,8),(9,3,9);
/*!40000 ALTER TABLE `libreria_resumencompra_orderproduct_set` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-23 12:59:52
