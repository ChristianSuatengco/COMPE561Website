-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzarestaurantdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerFirstName` varchar(45) NOT NULL,
  `CustomerLastName` varchar(45) NOT NULL,
  `CustomerEmail` varchar(45) NOT NULL,
  `CustomerPhoneNumber` bigint(100) NOT NULL,
  `CustomerAddress` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1111,'Christian','Suatengco','christiansuatengco@gmail.com',8586995480,'10545 Angeton Court');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `OrderTime` time NOT NULL,
  `CustomerID` int(10) NOT NULL,
  `DeliveryType` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_customers_CustomerID_idx` (`CustomerID`),
  CONSTRAINT `FK_customers_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1111,'2021-12-09','09:03:34',1111,'PickUp');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderitems` (
  `OrderID` int(11) NOT NULL,
  `FoodID` int(10) NOT NULL,
  `Crust` varchar(45) NOT NULL,
  `Sauce` varchar(45) NOT NULL,
  `Cheese` varchar(45) DEFAULT 'Normal',
  `Quantity` int(10) DEFAULT '1',
  PRIMARY KEY (`FoodID`),
  KEY `FK_order_OrderID_idx` (`OrderID`),
  CONSTRAINT `FK_order_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `order` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1111,1,'ThinCrust','TomatoSauce','Normal',1);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toppings`
--

DROP TABLE IF EXISTS `toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `toppings` (
  `OrderID` int(11) NOT NULL,
  `FoodID` int(10) NOT NULL,
  `ToppingID` varchar(45) NOT NULL,
  `ToppingDescription` varchar(45) NOT NULL,
  KEY `FK_toppings_OrderID_idx` (`OrderID`),
  KEY `FK_orderitems_FoodID_idx` (`FoodID`),
  CONSTRAINT `FK_orderitems_FoodID` FOREIGN KEY (`FoodID`) REFERENCES `orderitems` (`foodid`),
  CONSTRAINT `FK_toppings_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `order` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings`
--

LOCK TABLES `toppings` WRITE;
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-13 15:10:12
