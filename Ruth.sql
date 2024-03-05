CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chambres`
--

DROP TABLE IF EXISTS `chambres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chambres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Categorie` varchar(150) DEFAULT NULL,
  `Etat` varchar(150) DEFAULT NULL,
  `Espace` varchar(150) DEFAULT NULL,
  `Prix_XAF` int DEFAULT NULL,
  `Client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Client_id` (`Client_id`),
  CONSTRAINT `chambres_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chambres`
--

LOCK TABLES `chambres` WRITE;
/*!40000 ALTER TABLE `chambres` DISABLE KEYS */;
INSERT INTO `chambres` VALUES (1,'Chambre-douche','Disponible','Terrace',5000,2),(2,'Appartement','Occupe','Vue sur Mer',5000,5),(3,'Chambre-douche','occupe','Terrace',3000,1);
/*!40000 ALTER TABLE `chambres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(150) DEFAULT NULL,
  `Prenom` varchar(150) DEFAULT NULL,
  `Tell` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Chambre-Douche','Disponible','Blacon','10000','2'),(2,'Appartement','Occupe','Vue sur l\'orizon','200000','3'),(3,'Chambre-Douche','Occupe','Vue sur la Mer','25000','1'),(4,'Chambre-Cuisine-Douche','Occupe','Discret','99000','4'),(5,'Appartement','Nettoyage','Lumineux','130000','5');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturations`
--

DROP TABLE IF EXISTS `facturations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Taxe_XAF` int DEFAULT NULL,
  `Autre_frais_XAF` int DEFAULT NULL,
  `Statut` varchar(150) DEFAULT NULL,
  `Methode_id` int DEFAULT NULL,
  `Reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Methode_id` (`Methode_id`),
  KEY `Reservation_id` (`Reservation_id`),
  CONSTRAINT `facturations_ibfk_1` FOREIGN KEY (`Methode_id`) REFERENCES `methodes` (`id`),
  CONSTRAINT `facturations_ibfk_2` FOREIGN KEY (`Reservation_id`) REFERENCES `reservations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturations`
--

LOCK TABLES `facturations` WRITE;
/*!40000 ALTER TABLE `facturations` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Jours` date DEFAULT NULL,
  `Note` int DEFAULT NULL,
  `Commentaire` varchar(150) DEFAULT NULL,
  `Reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Reservation_id` (`Reservation_id`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`Reservation_id`) REFERENCES `reservations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historiques`
--

DROP TABLE IF EXISTS `historiques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historiques` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Reservation_id` (`Reservation_id`),
  CONSTRAINT `historiques_ibfk_1` FOREIGN KEY (`Reservation_id`) REFERENCES `reservations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historiques`
--

LOCK TABLES `historiques` WRITE;
/*!40000 ALTER TABLE `historiques` DISABLE KEYS */;
/*!40000 ALTER TABLE `historiques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methodes`
--

DROP TABLE IF EXISTS `methodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `methodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methodes`
--

LOCK TABLES `methodes` WRITE;
/*!40000 ALTER TABLE `methodes` DISABLE KEYS */;
INSERT INTO `methodes` VALUES (1,'MOMO'),(2,'OM'),(3,'VISA CARD'),(4,'WESTERN UNION'),(5,'PAYPAL'),(6,'EXPRESS UNION'),(7,'EXPRESS EXCHANGE'),(8,'CREDIT CARD');
/*!40000 ALTER TABLE `methodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Arrivee` date DEFAULT NULL,
  `Depart` date DEFAULT NULL,
  `Numbre_de_personnes` int DEFAULT NULL,
  `Preferences` varchar(150) DEFAULT NULL,
  `Statut` varchar(150) DEFAULT NULL,
  `Chambre_id` int DEFAULT NULL,
  `Service_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `Preferences` (`Preferences`),
  KEY `Chambre_id` (`Chambre_id`),
  KEY `Service_id` (`Service_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`Chambre_id`) REFERENCES `chambres` (`id`),
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`Service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(150) DEFAULT NULL,
  `Details` varchar(150) DEFAULT NULL,
  `Horaire` varchar(150) DEFAULT NULL,
  `Tarif_XAF` int DEFAULT NULL,
  `Client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Client_id` (`Client_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Restaurant','Menu africains, europeens et iteliens','24h/24h',5000,2),(2,'Spa','Vires frais, epices, pret a porter...','24h/24',5000,5),(3,'Salle de sport','Gymnastique, Yoga, Danse D\'etoile, Salsa','09h/17h',3000,1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 18:38:23
