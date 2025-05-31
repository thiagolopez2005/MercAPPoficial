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
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
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
  `object_id` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
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
  `app_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
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
  `app` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-29 22:31:33.607225'),(2,'contenttypes','0002_remove_content_type_name','2025-05-29 22:31:34.271400'),(3,'auth','0001_initial','2025-05-29 22:31:34.759741'),(4,'auth','0002_alter_permission_name_max_length','2025-05-29 22:31:34.876934'),(5,'auth','0003_alter_user_email_max_length','2025-05-29 22:31:34.886325'),(6,'auth','0004_alter_user_username_opts','2025-05-29 22:31:34.898423'),(7,'auth','0005_alter_user_last_login_null','2025-05-29 22:31:34.913549'),(8,'auth','0006_require_contenttypes_0002','2025-05-29 22:31:34.918509'),(9,'auth','0007_alter_validators_add_error_messages','2025-05-29 22:31:34.930224'),(10,'auth','0008_alter_user_username_max_length','2025-05-29 22:31:34.957297'),(11,'auth','0009_alter_user_last_name_max_length','2025-05-29 22:31:34.967934'),(12,'auth','0010_alter_group_name_max_length','2025-05-29 22:31:35.182552'),(13,'auth','0011_update_proxy_permissions','2025-05-29 22:31:35.194075'),(14,'auth','0012_alter_user_first_name_max_length','2025-05-29 22:31:35.202835'),(15,'libreria','0001_initial','2025-05-29 22:31:38.225604'),(16,'admin','0001_initial','2025-05-29 22:31:38.485092'),(17,'admin','0002_logentry_remove_auto_add','2025-05-29 22:31:38.502021'),(18,'admin','0003_logentry_add_action_flag_choices','2025-05-29 22:31:38.536403'),(19,'sessions','0001_initial','2025-05-29 22:31:38.596691'),(20,'libreria','0002_order_pagada','2025-05-30 13:08:05.489588');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
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
INSERT INTO `django_session` VALUES ('3nkomkv78s2gg9l14hey204tjj80hby2','.eJxVi0EOwiAQRe_C2jSFMhRc2oOQGRgCsdakwMp4d2vShSZ_9f57L-Gxt-x75d2XKK5CissvIwx33r7HWmjnveBwojosvbbnY1kLb41vp_hXZ6z5SAklgdUJJAZwUR0zrBIrnhM7bd1EIDWHZEdQMlk008xxJACjSSoU7w9SKjct:1uL0A0:P9nwpXuBlOlShhHViROjBqr9RZDbcFAsOG9gEWhWfBU','2025-06-13 13:52:36.581102'),('7fl7cdzi1jcb2d5sjp99chdkpbp3ln98','.eJxVjEEOwiAQRe_C2hBKmaG4dO8ZyMAMUjVtUtqV8e7apAvd_vfef6lI21rj1mSJI6uz6tTpd0uUHzLtgO803Wad52ldxqR3RR-06evM8rwc7t9BpVa_de-sR-DAg_NkBWiAQNhnK5aheHICnUcniAAmsysJSobQYzCYjA_q_QHK1Dcx:1uLQKe:F46Te3DcpWRjCPv2-0sPHwuVoUNdUpktDNLTyvOAtSE','2025-06-14 17:49:20.295447'),('8fj4ey9qxj4yvqgt0e7m65xv04y3s75b','.eJxVjEEOwiAQRe_C2hBKmaG4dO8ZyMAMUjVtUtqV8e7apAvd_vfef6lI21rj1mSJI6uz6tTpd0uUHzLtgO803Wad52ldxqR3RR-06evM8rwc7t9BpVa_de-sR-DAg_NkBWiAQNhnK5aheHICnUcniAAmsysJSobQYzCYjA_q_QHK1Dcx:1uKlnu:h5HLfDTxLWv7CsHOh-01vePf4pZlj43KO_-ZCAS7OF0','2025-06-12 22:32:50.233170'),('anpzofi3x0jzhm9leq1px50fn2i61yfm','.eJxVjDsOwjAQBe_iGlmLHX9CSZ8zWLtrLw6gRIqTCnF3iJQC2jcz76USbmtNWytLGrO6KKNOvxshP8q0g3zH6TZrnqd1GUnvij5o08Ocy_N6uH8HFVv91ggiHXXckwUDoYdiyPoozrAR5ykLWnbGMxfkQHJ2kWzMDAExCIB6fwD5HDir:1uL2Px:SxAWlRTuNlYYA6qwBBrWhEtZby4B8roGAJ22RjA2yCQ','2025-06-13 16:17:13.123173'),('ekhyiioazqds2oontcpb02zu00recxwv','.eJxVjDsOwjAQBe_iGlmLHX9CSZ8zWLtrLw6gRIqTCnF3iJQC2jcz76USbmtNWytLGrO6KKNOvxshP8q0g3zH6TZrnqd1GUnvij5o08Ocy_N6uH8HFVv91ggiHXXckwUDoYdiyPoozrAR5ykLWnbGMxfkQHJ2kWzMDAExCIB6fwD5HDir:1uL2oa:A2QfHmFZBQ3DWh4hbpmduI1xRQVopk0b0H9vQXEKs4s','2025-06-13 16:42:40.324275'),('flz1lgwzhnuf8q6smuso3okpjh7b7au4','.eJxVi0EOwiAQRe_C2jSFMhRc2oOQGRgCsdakwMp4d2vShSZ_9f57L-Gxt-x75d2XKK5CissvIwx33r7HWmjnveBwojosvbbnY1kLb41vp_hXZ6z5SAklgdUJJAZwUR0zrBIrnhM7bd1EIDWHZEdQMlk008xxJACjSSoU7w9SKjct:1uL4Gq:JF0_x53vwyLzOEIu-Fw9eEaG0WppLRUgGV7wIuQsz3k','2025-06-13 18:15:56.670947'),('ni2h7pe5cd1rrqglm6ynnt5sfck1rn9d','.eJxVi0EOwiAQRe_C2jSFMhRc2oOQGRgCsdakwMp4d2vShSZ_9f57L-Gxt-x75d2XKK5CissvIwx33r7HWmjnveBwojosvbbnY1kLb41vp_hXZ6z5SAklgdUJJAZwUR0zrBIrnhM7bd1EIDWHZEdQMlk008xxJACjSSoU7w9SKjct:1uKz8T:plh_NzTBQ9oNyJWR6I24YPqD9WQIv6Ae5aKTQAACu_4','2025-06-13 12:46:57.326628'),('nt3acadw9v9pnjwt9sod9yleq6sp55ba','.eJxVjEEOwiAQRe_C2hBKmaG4dO8ZyMAMUjVtUtqV8e7apAvd_vfef6lI21rj1mSJI6uz6tTpd0uUHzLtgO803Wad52ldxqR3RR-06evM8rwc7t9BpVa_de-sR-DAg_NkBWiAQNhnK5aheHICnUcniAAmsysJSobQYzCYjA_q_QHK1Dcx:1uL4Qy:RIhvSyiqPUuqtAnSsuiGEqZ9RkgiQldw9ACU2rGI_-Q','2025-06-13 18:26:24.737414'),('nwixp4q0g8gz655ulosghzkk6p8ostv8','.eJxVjEEOwiAQRe_C2hBKmaG4dO8ZyMAMUjVtUtqV8e7apAvd_vfef6lI21rj1mSJI6uz6tTpd0uUHzLtgO803Wad52ldxqR3RR-06evM8rwc7t9BpVa_de-sR-DAg_NkBWiAQNhnK5aheHICnUcniAAmsysJSobQYzCYjA_q_QHK1Dcx:1uL7c0:fKUi0lpZh-CpP5hYSpNYvX5KLmiaDeqAM0meJTiEtoo','2025-06-13 21:50:00.969208'),('p0xjgh1zr0fy75k2miv0te5g6m283nqq','.eJxVjEEOwiAQRe_C2hBKmaG4dO8ZyMAMUjVtUtqV8e7apAvd_vfef6lI21rj1mSJI6uz6tTpd0uUHzLtgO803Wad52ldxqR3RR-06evM8rwc7t9BpVa_de-sR-DAg_NkBWiAQNhnK5aheHICnUcniAAmsysJSobQYzCYjA_q_QHK1Dcx:1uL0gL:kjT3MoEEkRIpZ5JOIwzCG2p6jBLl2unqcmpns_gc43Y','2025-06-13 14:26:01.459792');
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
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `roleCliente` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `CC` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellido` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `CC` (`CC`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_customcliente`
--

LOCK TABLES `libreria_customcliente` WRITE;
/*!40000 ALTER TABLE `libreria_customcliente` DISABLE KEYS */;
INSERT INTO `libreria_customcliente` VALUES (1,'pbkdf2_sha256$1000000$xcSAC0pDW8rZeSxSk1iVtw$Uc5U7lSxtzwrR1FL0tzRvcA17rsaPCb3eggxp1RnmUk=','2025-05-31 17:48:38.685435',0,'1051472770','','',0,1,'2025-05-30 12:44:16.991961','user','karen.holguin@soy.sena.edu.co','3234188256','1051472774','Karen Milena','Holguin Lopez'),(2,'pbkdf2_sha256$1000000$1u5bcvU8OYwLaupp7ZYNiv$+hgkS1BQM8fapG9NpJhNjZqXQT58eMr9pCqnhHFo64Y=',NULL,0,'1051466277','','',0,1,'2025-05-30 17:30:43.954663','user','karen.holguin@inchcaaae.com','3234188256','1051466277','jose','Hermandez');
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
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `cec` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellido` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cec` (`cec`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_customuser`
--

LOCK TABLES `libreria_customuser` WRITE;
/*!40000 ALTER TABLE `libreria_customuser` DISABLE KEYS */;
INSERT INTO `libreria_customuser` VALUES (1,'pbkdf2_sha256$1000000$G7j6uAQSCrPjf2aWVpnFok$EnYbzCB1CbUZMFcKPHcxxvJPlju4Y9I4Im/VUkzU5K8=','2025-05-31 17:49:20.287715',0,'1051472774','','','2025-05-29 22:32:41.029112','admin','milenaholguin95@gmail.com','jasdhkasjd','1051472774','Thiago','Lopez',' No activo',1,0),(2,'pbkdf2_sha256$1000000$GK4yKSxkqGfjRraLlj12oj$O+5E131Mt0tmB9flKFa0C1LDouIXPzkpdLs0fzqrzWc=','2025-05-30 19:29:25.336602',0,'1111111111','','','2025-05-30 16:16:52.540641','emple','EMPLE@gmail.com','039480923','1111111111','EMPLE','EMPLE',' No activo',1,0);
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
  `imagen` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `descripcion` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `numero_factura` int NOT NULL AUTO_INCREMENT,
  `fecha_publicacion` datetime(6) NOT NULL,
  `habilitada` tinyint(1) NOT NULL,
  PRIMARY KEY (`numero_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_factura`
--

LOCK TABLES `libreria_factura` WRITE;
/*!40000 ALTER TABLE `libreria_factura` DISABLE KEYS */;
INSERT INTO `libreria_factura` VALUES ('facturas/Captura_de_pantalla_2025-04-02_144755.png','Compra de papa, cebolla, zanahoria',1,'2025-05-30 17:32:45.000000',1),('facturas/Captura_de_pantalla_2025-03-16_181900.png','compra de hortalizas',2,'2025-05-30 17:33:58.000000',1),('facturas/zanahoria.jpg','cliente andres pago 30 productos',3,'2025-05-30 21:58:17.000000',0);
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
  `pagada` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `libreria_order_user_id_dab8c87f_fk_libreria_customcliente_id` (`user_id`),
  CONSTRAINT `libreria_order_user_id_dab8c87f_fk_libreria_customcliente_id` FOREIGN KEY (`user_id`) REFERENCES `libreria_customcliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_order`
--

LOCK TABLES `libreria_order` WRITE;
/*!40000 ALTER TABLE `libreria_order` DISABLE KEYS */;
INSERT INTO `libreria_order` VALUES (1,'2025-05-30 12:59:47.297332','2025-05-30 13:12:42.545217',0,1,0),(2,'2025-05-30 12:59:47.301996','2025-05-30 13:14:07.330895',0,1,0),(3,'2025-05-30 12:59:47.303411','2025-05-30 13:28:38.346670',0,1,0),(4,'2025-05-30 13:28:43.305917','2025-05-30 14:21:45.207198',0,1,0),(5,'2025-05-30 18:16:21.249428','2025-05-30 18:17:17.833499',0,1,0),(6,'2025-05-30 18:18:55.836587','2025-05-30 21:49:05.993081',0,1,0),(7,'2025-05-31 17:48:41.406411','2025-05-31 17:48:41.406473',1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_orderproduct`
--

LOCK TABLES `libreria_orderproduct` WRITE;
/*!40000 ALTER TABLE `libreria_orderproduct` DISABLE KEYS */;
INSERT INTO `libreria_orderproduct` VALUES (3,4,1,11),(4,3,2,7),(6,3,2,11),(7,1,2,13),(8,3,2,9),(10,5,3,5),(12,4,3,6),(15,2,3,9),(17,3,3,11),(38,7,4,8),(39,6,4,11),(40,1,5,13),(41,1,5,11),(42,1,5,8),(43,10,6,1),(44,5,7,3);
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
  `imagen` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `origen` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `unidad` double NOT NULL,
  `stock` int NOT NULL,
  `precio` decimal(10,1) NOT NULL,
  `publicado` tinyint(1) NOT NULL,
  `medida` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tipoproducto` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_producto`
--

LOCK TABLES `libreria_producto` WRITE;
/*!40000 ALTER TABLE `libreria_producto` DISABLE KEYS */;
INSERT INTO `libreria_producto` VALUES (1,'productos/Aguacate_LUTxsf6.jpg','Aguacate','Delicioso Aguacate cultivado y traido de Yopal','Yopal',1,90,6500.0,0,'unidad','frutas',0),(2,'productos/Maracuya_YIXg8Zp.jpg','Maracuya','Maracuya fresca, cultivada desde el Casanare','Casanare',5,100,4500.0,1,'bandejas','frutas',1),(3,'productos/Yuca_34286rl.jpg','Yuca','Yuca fresca','Boyacá',4,100,6700.0,1,'bandeja','tuberculos',1),(4,'productos/Platano_Maduro.jpg','Platano','Platano fresco de los llanos','yopal',8,100,7800.0,1,'ramo','frutas',1),(5,'productos/papa.jpg','papa','Deliciosa papa cultivada en Boyacá','Boyacá, Aquitania',1,9995,13000.0,1,'Bulto','verduras',1),(6,'productos/btocoli.jpg','Brocoli','Delicioso Brocoli','Pereida',1,996,5000.0,1,'unidad','hortalizas',1),(7,'productos/lechuga.jpg','Lechuga','Deliciosa lechuga','Nariño',1,997,6000.0,1,'unidad','hortalizas',1),(8,'productos/zanahoria.jpg','Zahaoria','Deliciosa Zanahoria','Santander',1,992,4500.0,1,'Bolsa','tuberculos',1),(9,'productos/tomate.jpg','Toamte rojo','Delicioso Tomate Rojo','Bopyacá, Tibasosa',1,95,3400.0,1,'bolsa','verduras',1),(10,'productos/apio.jpg','Apio','Apio fresco','Pasto',1,100,2300.0,1,'Unidad','tuberculos',1),(11,'productos/sandia.jpg','Sandia','Deliciosa Sandia','Bogotá',1,83,9000.0,1,'kilos','frutas',1),(12,'productos/Piña_Ip6NRL7.jpg','Piña','Dliciosa Piña fresca y de gran tamaño','Villa de leyva',1,100,6000.0,1,'Unidad','frutas',1),(13,'productos/naranja.jpg','Naranja','Deliciosa Naranja fresca','Boyacá, Sogamoso',1,98,3000.0,1,'Bolsa, kilo','frutas',1);
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
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellido` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `correo` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_proveedor`
--

LOCK TABLES `libreria_proveedor` WRITE;
/*!40000 ALTER TABLE `libreria_proveedor` DISABLE KEYS */;
INSERT INTO `libreria_proveedor` VALUES (1,'jose','Hermandez','120890491280','karen.holguin@inchcape.com',0),(2,'camilo','chaparro','237052935709','stefanolopez5002@gmail.com',0);
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
  `accion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `detalle` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `libreria_registroact_usuario_id_e332a7f9_fk_libreria_` (`usuario_id`),
  CONSTRAINT `libreria_registroact_usuario_id_e332a7f9_fk_libreria_` FOREIGN KEY (`usuario_id`) REFERENCES `libreria_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_registroactividad`
--

LOCK TABLES `libreria_registroactividad` WRITE;
/*!40000 ALTER TABLE `libreria_registroactividad` DISABLE KEYS */;
INSERT INTO `libreria_registroactividad` VALUES (1,'2025-05-29 22:37:35.091569','Registro de producto','Se agregó un nuevo producto: Aguacate',1),(2,'2025-05-29 22:38:28.967441','Registro de producto','Se agregó un nuevo producto: Maracuya',1),(3,'2025-05-29 22:39:24.471886','Registro de producto','Se agregó un nuevo producto: Yuca',1),(4,'2025-05-29 22:41:35.534950','Registro de producto','Se agregó un nuevo producto: Platano',1),(5,'2025-05-29 22:42:49.197310','Registro de producto','Se agregó un nuevo producto: papa',1),(6,'2025-05-30 12:23:39.721763','Registro de producto','Se agregó un nuevo producto: Brocoli',1),(7,'2025-05-30 12:24:27.074262','Registro de producto','Se agregó un nuevo producto: Lechuga',1),(8,'2025-05-30 12:25:35.306649','Registro de producto','Se agregó un nuevo producto: Zahaoria',1),(9,'2025-05-30 12:26:35.672845','Registro de producto','Se agregó un nuevo producto: Toamte rojo',1),(10,'2025-05-30 12:27:20.690612','Registro de producto','Se agregó un nuevo producto: Apio',1),(11,'2025-05-30 12:30:17.416191','Registro de producto','Se agregó un nuevo producto: Sandia',1),(12,'2025-05-30 12:31:08.334027','Registro de producto','Se agregó un nuevo producto: Piña',1),(13,'2025-05-30 12:32:13.291782','Registro de producto','Se agregó un nuevo producto: Naranja',1),(14,'2025-05-30 17:28:32.477597','Registro de proveedor','Se registró un nuevo proveedor: jose Hermandez',1),(15,'2025-05-30 17:28:50.346948','Registro de proveedor','Se registró un nuevo proveedor: camilo chaparro',1),(16,'2025-05-30 18:15:17.667577','Marcar compra como pagada','La compra del cliente \'Karen Milena\' fue marcada como pagada.',1),(17,'2025-05-30 21:52:54.685541','Habilitación de producto','El producto \'Aguacate\' ha sido inhabilitado.',1),(18,'2025-05-30 21:53:12.229231','Retiro de publicidad de producto','El producto \'Aguacate\' ha sido retirado de la publicidad.',1),(19,'2025-05-31 17:49:26.904239','Marcar compra como pagada','La compra del cliente \'Karen Milena\' fue marcada como pagada.',1),(20,'2025-05-31 17:49:32.002446','Marcar compra como pagada','La compra del cliente \'Karen Milena\' fue marcada como pagada.',1);
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
  `total` decimal(10,1) NOT NULL,
  `iva` decimal(10,1) NOT NULL,
  `total_con_iva` decimal(10,1) NOT NULL,
  `fecha_compra` datetime(6) NOT NULL,
  `pagada` tinyint(1) NOT NULL,
  `metodo_pago` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `referencia_pago` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `forma_entrega` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `direccion_entrega` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `cliente_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `libreria_resumencomp_cliente_id_88907a3f_fk_libreria_` (`cliente_id`),
  CONSTRAINT `libreria_resumencomp_cliente_id_88907a3f_fk_libreria_` FOREIGN KEY (`cliente_id`) REFERENCES `libreria_customcliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_resumencompra`
--

LOCK TABLES `libreria_resumencompra` WRITE;
/*!40000 ALTER TABLE `libreria_resumencompra` DISABLE KEYS */;
INSERT INTO `libreria_resumencompra` VALUES (1,36000.0,6840.0,42840.0,'2025-05-30 13:12:42.390581',1,'neki','M7654765','sede','',1),(2,58200.0,11058.0,69258.0,'2025-05-30 13:14:07.239474',1,'neki','M7654765','sede','',1),(3,118800.0,22572.0,141372.0,'2025-05-30 13:28:38.266417',0,'neki','M9757868','sede','',1),(4,85500.0,16245.0,101745.0,'2025-05-30 14:21:44.829184',1,'efectivo','','sede','',1),(5,16500.0,3135.0,19635.0,'2025-05-30 18:17:17.776300',0,'neki','M9757868','sede','',1),(6,55000.0,10450.0,65450.0,'2025-05-30 21:49:05.945634',0,'efectivo','','domicilio','ÑHHÑÑKLlkdlaksjdl',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria_resumencompra_orderproduct_set`
--

LOCK TABLES `libreria_resumencompra_orderproduct_set` WRITE;
/*!40000 ALTER TABLE `libreria_resumencompra_orderproduct_set` DISABLE KEYS */;
INSERT INTO `libreria_resumencompra_orderproduct_set` VALUES (1,1,3),(2,2,4),(3,2,6),(4,2,7),(5,2,8),(6,3,10),(7,3,12),(8,3,15),(9,3,17),(10,4,38),(11,4,39),(12,5,40),(13,5,41),(14,5,42),(15,6,43);
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

-- Dump completed on 2025-05-31 13:25:28
