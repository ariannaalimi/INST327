CREATE DATABASE  IF NOT EXISTS `greatest_albums_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `greatest_albums_db`;
-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: localhost    Database: greatest_albums_db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `Album_Rankings`
--

DROP TABLE IF EXISTS `Album_Rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Album_Rankings` (
  `Album_Rank` int NOT NULL,
  `Album_Title` varchar(70) DEFAULT NULL,
  `Artist_ID` int NOT NULL,
  `Genre_ID` int NOT NULL,
  `Release_Year` year DEFAULT NULL,
  `Duration_In_Minutes` int DEFAULT NULL,
  `Track_Count` int DEFAULT NULL,
  `Worldwide_Sales_In_Millions` float DEFAULT NULL,
  PRIMARY KEY (`Album_Rank`),
  KEY `fk_Album_Rankings_Genres_idx` (`Genre_ID`),
  KEY `fk_Album_Rankings_Artists1_idx` (`Artist_ID`),
  CONSTRAINT `fk_Album_Rankings_Artists1` FOREIGN KEY (`Artist_ID`) REFERENCES `Artists` (`Artist_ID`),
  CONSTRAINT `fk_Album_Rankings_Genres` FOREIGN KEY (`Genre_ID`) REFERENCES `Genres` (`Genre_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album_Rankings`
--

LOCK TABLES `Album_Rankings` WRITE;
/*!40000 ALTER TABLE `Album_Rankings` DISABLE KEYS */;
INSERT INTO `Album_Rankings` VALUES (1,'What\'s Going On',37,35,1971,35,9,1.8),(2,'Pet Sounds',63,20,1966,37,13,1.6),(3,'Blue',29,5,1971,36,10,1.6),(4,'Songs in the Key of Life',59,29,1976,105,21,5.6),(5,'Abbey Road',64,31,1969,47,17,20),(6,'Nevermind',46,13,1991,49,13,30),(7,'Rumours',21,31,1977,39,11,40),(8,'Purple Rain',52,22,1984,43,9,25),(9,'Blood on the Tracks',7,8,1975,51,10,2.9),(10,'The Miseducation of Lauryn Hill',33,27,1998,77,16,20),(11,'Revolver',64,31,1966,34,14,7.2),(12,'Thriller',39,20,1982,42,9,66),(13,'I Never Loved a Man the Way I Love You',5,35,1967,41,14,0.5),(14,'Exile on Main Street',68,31,1972,67,18,1.5),(15,'It Takes a Nation of Millions To Hold Us Back',53,15,1988,57,16,1.1),(16,'London Calling',65,26,1979,65,19,1.5),(17,'My Beautiful Dark Twisted Fantasy',30,15,2010,68,13,3.6),(18,'Highway 61 Revisited',7,8,1965,51,9,1.4),(19,'To Pimp a Butterfly',32,15,2015,79,16,1.5),(20,'Kid A',55,4,2000,47,10,2.5),(21,'Born to Run',9,31,1975,39,8,8),(22,'Ready to Die',67,15,1994,76,17,6.4),(23,'The Velvet Underground & Nico',71,3,1967,48,11,0.4),(24,'Sgt. Pepper\'s Lonely Hearts Club Band',64,31,1967,39,13,32),(25,'Tapestry',10,7,1971,45,12,25),(26,'Horses',48,26,1975,42,8,0.1),(27,'Enter the Wu-Tang (36 Chambers)',74,15,1993,60,12,3.5),(28,'Voodoo',13,19,2000,79,13,1.2),(29,'The Beatles',64,31,1968,93,30,14),(30,'Are You Experienced',26,25,1967,40,17,5.1),(31,'Kind of Blue',40,16,1959,46,5,6.5),(32,'Lemonade',6,28,2016,46,12,3.7),(33,'Back to Black',4,29,2006,34,11,16),(34,'Innervisions',59,29,1973,44,9,0.7),(35,'Rubber Soul',64,31,1965,35,14,8.6),(36,'Off the Wall',39,21,1979,42,10,20),(37,'The Chronic',15,15,1992,62,16,5.4),(38,'Blonde on Blonde',7,8,1966,72,14,2.3),(39,'Remain in Light',60,3,1980,40,8,0.7),(40,'The Rise and Fall of Ziggy Stardust and the Spiders from Mars',14,12,1972,38,11,7.5),(41,'Let It Bleed',68,31,1969,42,9,3.6),(42,'OK Computer',55,1,1997,53,12,5.7),(43,'The Low End Theory',1,15,1991,45,14,1.1),(44,'Illmatic',44,15,1994,39,10,2.2),(45,'Sign o\' the Times',51,10,1987,80,16,1.9),(46,'Graceland',49,37,1986,43,11,16),(47,'Ramones',56,26,1976,29,14,0.6),(48,'Exodus',8,30,1977,37,10,1.6),(49,'Aquemini',47,15,1998,62,16,2.1),(50,'The Blueprint',25,15,2001,63,13,3.2),(51,'The Great Twenty-Eight',11,32,1982,51,28,0),(52,'Station to Station',14,3,1976,38,6,0.7),(53,'Electric Ladyland',26,25,1968,75,16,2.2),(54,'Star Time',24,35,1991,294,71,0.1),(55,'The Dark Side of the Moon',50,23,1973,42,10,50),(56,'Exile in Guyville',35,1,1993,57,18,0.5),(57,'The Band',62,31,1969,43,12,1.1),(58,'Led Zeppelin IV',34,14,1971,42,8,37),(59,'Talking Book',59,29,1972,43,10,0.7),(60,'Astral Weeks',73,6,1968,47,8,0.9),(61,'Paid in Full',19,15,1987,45,10,1),(62,'Appetite for Destruction',23,14,1987,53,12,30),(63,'Aja',58,18,1977,40,7,2.3),(64,'Stankonia',47,15,2000,73,24,5.4),(65,'Live at the Apollo',24,35,1963,40,11,0),(66,'A Love Supreme',27,16,1965,33,4,1.1),(67,'Reasonable Doubt',25,15,1996,55,14,1.1),(68,'Hounds of Love',31,3,1985,47,12,1.4),(69,'Jagged Little Pill',3,1,1995,58,13,33),(70,'Straight Outta Compton',43,15,1988,60,13,3.3),(71,'Renaissance',6,28,2022,62,16,1.3),(72,'Harvest',45,8,1972,37,10,8.5),(73,'Loveless',42,34,1991,48,11,0.1),(74,'The College Dropout',30,15,2004,76,21,5.1),(75,'Lady Soul',5,35,1968,43,14,0.5),(76,'Superfly',12,11,1972,37,9,0.5),(77,'Who\'s Next',72,31,1971,43,9,4),(78,'The Sun Sessions',18,33,1976,28,18,0),(79,'Blonde',22,28,2016,60,17,1.4),(80,'Never Mind the Bollocks Here\'s the Sex Pistols',69,26,1977,38,12,1.7),(81,'Beyonce',6,28,2013,93,20,6.3),(82,'There\'s a Riot Goin\' On',57,9,1971,47,12,1.1),(83,'Dusty in Memphis',17,35,1969,33,11,0.1),(84,'Back in Black',2,14,1980,42,10,50),(85,'Plastic Ono Band',28,31,1970,39,11,0.6),(86,'The Doors',66,25,1967,44,11,20),(87,'Bitches Brew',40,17,1970,105,6,1.1),(88,'Hunky Dory',14,12,1971,42,11,0.3),(89,'Baduizm',20,19,1997,58,14,3.4),(90,'After the Gold Rush',45,8,1970,35,11,3.4),(91,'Darkness on the Edge of Town',9,31,1978,42,10,3.5),(92,'Axis: Bold as Love',26,25,1967,39,13,1.1),(93,'Supa Dupa Fly',41,15,1997,60,17,1.1),(94,'Fun House',70,24,1970,37,7,0),(95,'Take Care',16,15,2011,83,19,6.9),(96,'Automatic for the People',54,1,1992,48,12,18),(97,'Master of Puppets',38,36,1986,55,8,10),(98,'Car Wheels on a Gravel Road',36,2,1998,51,13,0.6),(99,'Red',61,20,2012,64,16,8.9),(100,'Music From Big Pink',62,31,1968,42,11,0.6);
/*!40000 ALTER TABLE `Album_Rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artists`
--

DROP TABLE IF EXISTS `Artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artists` (
  `Artist_ID` int NOT NULL,
  `Artist` varchar(70) DEFAULT NULL,
  `Grammy_Wins` int DEFAULT NULL,
  `Grammy_Nominations` int DEFAULT NULL,
  PRIMARY KEY (`Artist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artists`
--

LOCK TABLES `Artists` WRITE;
/*!40000 ALTER TABLE `Artists` DISABLE KEYS */;
INSERT INTO `Artists` VALUES (1,'A Tribe Called Quest',0,4),(2,'AC/DC',1,10),(3,'Alanis Morissette',7,14),(4,'Amy Winehouse',6,8),(5,'Aretha Franklin',18,44),(6,'Beyonce',35,99),(7,'Bob Dylan',10,38),(8,'Bob Marley and the Wailers',0,0),(9,'Bruce Springsteen',20,51),(10,'Carole King',4,9),(11,'Chuck Berry',0,0),(12,'Curtis Mayfield',0,8),(13,'D\'Angelo',4,14),(14,'David Bowie',5,19),(15,'Dr. Dre',7,26),(16,'Drake',5,55),(17,'Dusty Springfield',0,2),(18,'Elvis Presley',3,14),(19,'Eric B. and Rakim',0,0),(20,'Erykah Badu',4,20),(21,'Fleetwood Mac',2,7),(22,'Frank Ocean',2,7),(23,'Guns N\' Roses',0,3),(24,'James Brown',3,8),(25,'Jay-Z',24,89),(26,'Jimi Hendrix',0,1),(27,'John Coltrane',1,8),(28,'John Lennon',7,34),(29,'Joni Mitchell',10,18),(30,'Kanye West',24,76),(31,'Kate Bush',0,5),(32,'Kendrick Lamar',22,57),(33,'Lauryn Hill',8,19),(34,'Led Zeppelin',1,3),(35,'Liz Phair',0,2),(36,'Lucinda Williams',3,17),(37,'Marvin Gaye',2,12),(38,'Metallica',9,22),(39,'Michael Jackson',13,38),(40,'Miles Davis',8,32),(41,'Missy Elliott',4,22),(42,'My Bloody Valentine',0,0),(43,'N.W.A.',0,0),(44,'Nas',1,17),(45,'Neil Young',2,28),(46,'Nirvana',1,6),(47,'OutKast',6,16),(48,'Patti Smith',0,0),(49,'Paul Simon',16,36),(50,'Pink Floyd',1,4),(51,'Prince',7,38),(52,'Prince and the Revolution',2,6),(53,'Public Enemy',0,6),(54,'R.E.M.',3,13),(55,'Radiohead',3,18),(56,'Ramones',0,0),(57,'Sly and the Family Stone',0,0),(58,'Steely Dan',3,9),(59,'Stevie Wonder',25,74),(60,'Talking Heads',0,2),(61,'Taylor Swift',14,58),(62,'The Band',0,0),(63,'The Beach Boys',0,0),(64,'The Beatles',7,25),(65,'The Clash',1,1),(66,'The Doors',0,0),(67,'The Notorious B.I.G.',0,4),(68,'The Rolling Stones',3,15),(69,'The Sex Pistols',0,0),(70,'The Stooges',0,0),(71,'The Velvet Underground & Nico',1,1),(72,'The Who',0,2),(73,'Van Morrison',2,7),(74,'Wu-Tang Clan',0,1);
/*!40000 ALTER TABLE `Artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genres`
--

DROP TABLE IF EXISTS `Genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genres` (
  `Genre_ID` int NOT NULL,
  `Genre` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`Genre_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genres`
--

LOCK TABLES `Genres` WRITE;
/*!40000 ALTER TABLE `Genres` DISABLE KEYS */;
INSERT INTO `Genres` VALUES (1,'Alternative Rock'),(2,'Americana'),(3,'Art Rock'),(4,'Electronic Rock'),(5,'Folk'),(6,'Folk Jazz'),(7,'Folk Pop'),(8,'Folk Rock'),(9,'Funk'),(10,'Funk/Pop'),(11,'Funk/Soul'),(12,'Glam Rock'),(13,'Grunge'),(14,'Hard Rock'),(15,'Hip-Hop'),(16,'Jazz'),(17,'Jazz Fusion'),(18,'Jazz Rock'),(19,'Neo-Soul'),(20,'Pop'),(21,'Pop/R&B'),(22,'Pop/Rock'),(23,'Progressive Rock'),(24,'Proto-Punk'),(25,'Psychedelic Rock'),(26,'Punk Rock'),(27,'R&B/Hip-Hop'),(28,'R&B/Pop'),(29,'R&B/Soul'),(30,'Reggae'),(31,'Rock'),(32,'Rock & Roll'),(33,'Rockabilly'),(34,'Shoegaze'),(35,'Soul'),(36,'Thrash Metal'),(37,'Worldbeat');
/*!40000 ALTER TABLE `Genres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 17:45:59
