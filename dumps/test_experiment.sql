# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.13-0ubuntu0.16.04.2)
# Database: meshnetconf
# Generation Time: 2016-11-24 14:49:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table buildings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `buildings`;

CREATE TABLE `buildings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude2` double DEFAULT NULL,
  `longitude2` double DEFAULT NULL,
  `latitude3` double DEFAULT NULL,
  `longitude3` double DEFAULT NULL,
  `scale_by` enum('unscaled','gps') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unscaled',
  PRIMARY KEY (`id`),
  UNIQUE KEY `buildings_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;

INSERT INTO `buildings` (`id`, `created_at`, `updated_at`, `name`, `latitude`, `longitude`, `latitude2`, `longitude2`, `latitude3`, `longitude3`, `scale_by`)
VALUES
	(1,'2016-10-27 00:05:27','2016-10-30 15:32:23','Einsteinstraße 62',51.965828,7.603257,51.966257,7.603248,51.966254,7.603458,'gps'),
	(2,'2016-10-27 09:15:04','2016-10-27 09:15:04','Hörsaalgebäude',51.965629,7.602536,51.966119,7.602526,51.966121,7.602995,'gps'),
	(5,'2016-10-27 10:31:25','2016-10-27 10:31:25','Random Building',51.963726,7.604054,51.963903,7.604471,51.963816,7.60457,'gps'),
	(6,'2016-10-30 13:34:02','2016-10-30 14:06:08','1x1 Building',51.965828,7.603256,51.966257,7.603249,51.966255,7.603456,'gps'),
	(7,'2016-10-30 15:28:49','2016-10-30 15:28:49','Random Building 2',51.963894,7.604614,51.964082,7.604473,51.964124,7.604624,'gps'),
	(8,'2016-11-08 12:01:48','2016-11-08 12:01:48','Orleans-Ring 10',51.966347,7.603327,51.966664,7.603327,51.966645,7.603862,'gps');

/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table experiments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `experiments`;

CREATE TABLE `experiments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ext_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `analysis` longtext COLLATE utf8_unicode_ci,
  `config` longtext COLLATE utf8_unicode_ci,
  `raw_experiment` text COLLATE utf8_unicode_ci,
  `mapping_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `experiments_mapping_id_foreign` (`mapping_id`),
  CONSTRAINT `experiments_mapping_id_foreign` FOREIGN KEY (`mapping_id`) REFERENCES `mappings` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `experiments` WRITE;
/*!40000 ALTER TABLE `experiments` DISABLE KEYS */;

INSERT INTO `experiments` (`id`, `created_at`, `updated_at`, `name`, `ext_id`, `analysis`, `config`, `raw_experiment`, `mapping_id`)
VALUES
	(4,'2016-11-24 11:40:44','2016-11-24 11:59:55','Large Experiment',NULL,'parsedExperiments/4.json','{\"selectedBuildings\":[{\"id\":1,\"alias\":\"Einsteinstrasse62\"},{\"id\":8,\"alias\":\"OrleansRing10\"}],\"nodes\":{\"raw\":[{\"name\":\"COMSYS-NODE-01\",\"level\":\"8\",\"building\":\"Einsteinstrasse62\",\"room\":\"802b\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0007303770\",\"locationZ\":\"8.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.6\",\"10.0.0.1\",\"10.0.1.1\",\"10.0.2.1\"],\"macAddresses\":[\"00:0D:B9:1A:4D:24\",\"00:1F:1F:28:20:42\",\"00:80:48:66:DE:03\",\"00:80:48:66:DE:04\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-02\",\"level\":\"8\",\"building\":\"Einsteinstrasse62\",\"room\":\"802b\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0007709430\",\"locationZ\":\"8.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.5\",\"10.0.0.2\",\"10.0.1.2\",\"10.0.2.2\"],\"macAddresses\":[\"00:0D:B9:14:D9:28\",\"00:1F:1F:28:20:3B\",\"00:80:48:60:7B:DF\",\"00:80:48:60:7B:EC\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-03\",\"level\":\"8\",\"building\":\"Einsteinstrasse62\",\"room\":\"808\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0009332080\",\"locationZ\":\"8.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.4\",\"10.0.0.3\",\"10.0.1.3\",\"10.0.2.3\"],\"macAddresses\":[\"00:0D:B9:22:F8:68\",\"00:0E:2E:4C:97:47\",\"00:80:48:6B:F5:D8\",\"00:80:48:6B:F2:2B\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-04\",\"level\":\"8\",\"building\":\"Einsteinstrasse62\",\"room\":\"Lichthof\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0008115090\",\"locationZ\":\"8.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.20\",\"10.0.0.4\",\"10.0.1.4\",\"10.0.2.4\"],\"macAddresses\":[\"00:0D:B9:22:F9:80\",\"00:1F:1F:28:3E:0E\",\"00:80:48:6B:F5:D2\",\"00:80:48:6B:F5:D3\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-05\",\"level\":\"7\",\"building\":\"Einsteinstrasse62\",\"room\":\"Lichthof\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0007952830\",\"locationZ\":\"7.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.19\",\"10.0.0.5\",\"10.0.1.5\",\"10.0.2.5\"],\"macAddresses\":[\"00:0D:B9:1A:4A:2C\",\"00:1F:1F:09:08:14\",\"00:80:48:66:DE:19\",\"00:80:48:66:DE:18\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-07\",\"level\":\"8\",\"building\":\"Einsteinstrasse62\",\"room\":\"802\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0006735850\",\"locationZ\":\"8.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.21\",\"10.0.0.7\",\"10.0.1.7\",\"10.0.2.7\"],\"macAddresses\":[\"00:0D:B9:22:F5:08\",\"00:1F:1F:28:3D:4B\",\"00:80:48:6B:F2:14\",\"00:80:48:6B:F2:16\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-08\",\"level\":\"8\",\"building\":\"Einsteinstrasse62\",\"room\":\"818\",\"locationX\":\"0.0014900000\",\"locationY\":\"0.0005843400\",\"locationZ\":\"8.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.22\",\"10.0.0.8\",\"10.0.1.8\",\"10.0.2.8\"],\"macAddresses\":[\"00:0D:B9:22:F5:0C\",\"00:1F:1F:28:3D:1E\",\"00:80:48:6B:F2:17\",\"00:80:48:6B:F2:18\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-10\",\"level\":\"7\",\"building\":\"Einsteinstrasse62\",\"room\":\"704\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0008520750\",\"locationZ\":\"7.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.24\",\"10.0.0.10\",\"10.0.1.10\",\"10.0.2.10\"],\"macAddresses\":[\"00:0D:B9:22:8F:F4\",\"00:1F:1F:28:20:2F\",\"00:80:48:6B:F5:BA\",\"00:80:48:6B:F5:D1\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-11\",\"level\":\"5\",\"building\":\"Einsteinstrasse62\",\"room\":\"Lichthof\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0008033960\",\"locationZ\":\"5.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.25\",\"10.0.0.11\",\"10.0.1.11\",\"10.0.2.11\"],\"macAddresses\":[\"00:0D:B9:22:8F:E8\",\"00:1F:1F:09:06:F6\",\"00:80:48:6B:F5:C2\",\"00:80:48:6B:F5:C7\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-12\",\"level\":\"4\",\"building\":\"Einsteinstrasse62\",\"room\":\"Lichthof\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0008115090\",\"locationZ\":\"4.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.26\",\"10.0.0.12\",\"10.0.1.12\",\"10.0.2.12\"],\"macAddresses\":[\"00:0D:B9:1A:4D:48\",\"00:1F:1F:09:09:EA\",\"00:80:48:66:E4:73\",\"00:80:48:66:E4:74\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-13\",\"level\":\"2\",\"building\":\"Einsteinstrasse62\",\"room\":\"Lichthof\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0008115090\",\"locationZ\":\"2.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.27\",\"10.0.0.13\",\"10.0.1.13\",\"10.0.2.13\"],\"macAddresses\":[\"00:0D:B9:1A:4D:00\",\"00:1F:1F:28:20:61\",\"00:80:48:66:DE:07\",\"00:80:48:66:DE:0D\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-14\",\"level\":\"1\",\"building\":\"Einsteinstrasse62\",\"room\":\"Seminarraum\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0007466040\",\"locationZ\":\"1.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.30\",\"10.0.0.14\",\"10.0.1.14\",\"10.0.2.14\"],\"macAddresses\":[\"00:0D:B9:1A:4D:78\",\"00:1F:1F:09:06:47\",\"00:80:48:66:DE:15\",\"00:80:48:66:DE:14\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-16\",\"level\":\"6\",\"building\":\"Einsteinstrasse62\",\"room\":\"Lichthof\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0008115090\",\"locationZ\":\"6.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.28\",\"10.0.0.16\",\"10.0.1.16\",\"10.0.2.16\"],\"macAddresses\":[\"00:0D:B9:22:F5:30\",\"00:1F:1F:09:09:63\",\"00:80:48:6B:F2:24\",\"00:80:48:6B:F2:26\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-17\",\"level\":\"3\",\"building\":\"Einsteinstrasse62\",\"room\":\"Lichthof\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0008033960\",\"locationZ\":\"3.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.31\",\"10.0.0.17\",\"10.0.1.17\",\"10.0.2.17\"],\"macAddresses\":[\"00:0D:B9:13:A4:48\",\"00:0E:2E:4C:95:CB\",\"00:80:48:6B:F2:27\",\"00:80:48:6B:F2:2D\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-18\",\"level\":\"1\",\"building\":\"Einsteinstrasse62\",\"room\":\"110\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0009494340\",\"locationZ\":\"1.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.32\",\"172.16.202.32\",\"172.17.202.32\"],\"macAddresses\":[\"00:0D:B9:1A:4D:90\",\"00:80:48:66:DE:1C\",\"00:80:48:66:E5:AB\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-20\",\"level\":\"8\",\"building\":\"Einsteinstrasse62\",\"room\":\"815b\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0006411320\",\"locationZ\":\"8.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.36\",\"10.0.0.20\",\"10.0.1.20\",\"10.0.2.20\"],\"macAddresses\":[\"00:0D:B9:22:F5:10\",\"00:0E:2E:FF:56:51\",\"00:80:48:6B:F2:25\",\"00:80:48:6B:F5:C8\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-21\",\"level\":\"7\",\"building\":\"Einsteinstrasse62\",\"room\":\"707\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0009494340\",\"locationZ\":\"7.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.37\",\"10.0.0.21\",\"10.0.1.21\",\"10.0.2.21\"],\"macAddresses\":[\"00:0D:B9:1A:4C:F0\",\"00:1F:1F:09:07:37\",\"00:80:48:66:E1:85\",\"00:80:48:66:E1:84\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-23\",\"level\":\"7\",\"building\":\"Einsteinstrasse62\",\"room\":\"720\",\"locationX\":\"0.0015050000\",\"locationY\":\"0.0005843400\",\"locationZ\":\"7.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.39\",\"10.0.0.23\",\"10.0.1.23\",\"10.0.2.23\"],\"macAddresses\":[\"00:0D:B9:22:F4:E8\",\"00:1F:1F:28:3D:B1\",\"00:80:48:6B:F2:01\",\"00:80:48:6B:F2:02\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-24\",\"level\":\"7\",\"building\":\"Einsteinstrasse62\",\"room\":\"717\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0006492450\",\"locationZ\":\"7.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.40\",\"10.0.0.24\",\"10.0.1.24\",\"10.0.2.24\"],\"macAddresses\":[\"00:0D:B9:1A:0C:68\",\"00:1F:1F:28:20:64\",\"00:80:48:60:7D:72\",\"00:80:48:60:7D:61\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-25\",\"level\":\"7\",\"building\":\"Einsteinstrasse62\",\"room\":\"713\",\"locationX\":\"0.0016610000\",\"locationY\":\"0.0007871700\",\"locationZ\":\"7.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.41\",\"10.0.0.25\",\"10.0.1.25\",\"10.0.2.25\"],\"macAddresses\":[\"00:0D:B9:22:F4:E0\",\"00:1F:1F:28:3D:DA\",\"00:80:48:6B:F2:19\",\"00:80:48:6B:F2:1A\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-26\",\"level\":\"6\",\"building\":\"Einsteinstrasse62\",\"room\":\"602\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0006816980\",\"locationZ\":\"6.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.42\",\"10.0.0.26\",\"10.0.1.26\",\"10.0.2.26\"],\"macAddresses\":[\"00:0D:B9:22:F8:70\",\"00:1F:1F:09:08:1B\",\"00:80:48:6B:F2:00\",\"00:80:48:6B:F5:C9\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-27\",\"level\":\"6\",\"building\":\"Einsteinstrasse62\",\"room\":\"604c\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0009088680\",\"locationZ\":\"6.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.43\",\"10.0.0.27\",\"10.0.1.27\",\"10.0.2.27\"],\"macAddresses\":[\"00:0D:B9:1A:4D:60\",\"00:1F:1F:09:06:9D\",\"00:80:48:66:DE:11\",\"00:80:48:66:DE:10\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-28\",\"level\":\"6\",\"building\":\"Einsteinstrasse62\",\"room\":\"612\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0006573580\",\"locationZ\":\"6.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.45\",\"10.0.0.28\",\"10.0.1.28\",\"10.0.2.28\"],\"macAddresses\":[\"00:0D:B9:1A:4D:10\",\"00:1F:1F:09:06:94\",\"00:80:48:66:E5:A1\",\"00:80:48:66:E5:A2\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-29\",\"level\":\"6\",\"building\":\"Einsteinstrasse62\",\"room\":\"608\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0007790570\",\"locationZ\":\"6.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.44\",\"10.0.0.29\",\"10.0.1.29\",\"10.0.2.29\"],\"macAddresses\":[\"00:0D:B9:22:F5:8C\",\"00:1F:1F:28:3D:CC\",\"00:80:48:6B:F2:06\",\"00:80:48:6B:F2:05\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-30\",\"level\":\"6\",\"building\":\"Einsteinstrasse62\",\"room\":\"607\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0008520750\",\"locationZ\":\"6.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.46\",\"10.0.0.30\",\"10.0.1.30\",\"10.0.2.30\"],\"macAddresses\":[\"00:0D:B9:1A:4D:64\",\"00:1F:1F:28:3D:F0\",\"00:80:48:66:E1:A8\",\"00:80:48:66:DE:1B\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-31\",\"level\":\"6\",\"building\":\"Einsteinstrasse62\",\"room\":\"605a\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0009007550\",\"locationZ\":\"6.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.47\",\"10.0.0.31\",\"10.0.1.31\",\"10.0.2.31\"],\"macAddresses\":[\"00:0D:B9:22:F5:54\",\"00:1F:1F:28:20:83\",\"00:80:48:6B:F2:0B\",\"00:80:48:6B:F2:0A\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-32\",\"level\":\"5\",\"building\":\"Einsteinstrasse62\",\"room\":\"522\",\"locationX\":\"0.0014900000\",\"locationY\":\"0.0005843400\",\"locationZ\":\"5.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.48\",\"10.0.0.32\",\"10.0.1.32\",\"10.0.2.32\"],\"macAddresses\":[\"00:0D:B9:1A:49:38\",\"00:1F:1F:09:06:43\",\"00:80:48:66:E1:81\",\"00:80:48:66:E1:82\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-33\",\"level\":\"5\",\"building\":\"Einsteinstrasse62\",\"room\":\"502\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0006898110\",\"locationZ\":\"5.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.49\",\"10.0.0.33\",\"10.0.1.33\",\"10.0.2.33\"],\"macAddresses\":[\"00:0D:B9:1A:49:EC\",\"00:1F:1F:28:20:3E\",\"00:80:48:66:DE:17\",\"00:80:48:66:DE:16\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-35\",\"level\":\"5\",\"building\":\"Einsteinstrasse62\",\"room\":\"518\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0006816980\",\"locationZ\":\"5.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.51\",\"10.0.0.35\",\"10.0.1.35\",\"10.0.2.35\"],\"macAddresses\":[\"00:0D:B9:22:F5:24\",\"00:1F:1F:09:06:07\",\"00:80:48:6B:F2:04\",\"00:80:48:6B:F2:03\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-36\",\"level\":\"4\",\"building\":\"Einsteinstrasse62\",\"room\":\"417\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0006411320\",\"locationZ\":\"4.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.52\",\"10.0.0.36\",\"10.0.1.36\",\"10.0.2.36\"],\"macAddresses\":[\"00:0D:B9:1A:49:10\",\"00:1F:1F:09:06:9A\",\"00:80:48:66:DE:0C\",\"00:80:48:66:DE:0B\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-38\",\"level\":\"4\",\"building\":\"Einsteinstrasse62\",\"room\":\"401\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0006898110\",\"locationZ\":\"4.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.54\",\"10.0.0.38\",\"10.0.1.38\",\"10.0.2.38\"],\"macAddresses\":[\"00:0D:B9:1A:06:DC\",\"00:0E:2E:4C:96:1B\",\"00:80:48:66:DE:24\",\"00:80:48:66:DE:25\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-39\",\"level\":\"4\",\"building\":\"Einsteinstrasse62\",\"room\":\"421\",\"locationX\":\"0.0014900000\",\"locationY\":\"0.0005843400\",\"locationZ\":\"4.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.57\",\"10.0.0.39\",\"10.0.1.39\",\"10.0.2.39\"],\"macAddresses\":[\"00:0D:B9:22:F8:4C\",\"00:1F:1F:09:08:17\",\"00:80:48:6B:F2:1C\",\"00:80:48:6B:F5:D9\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-40\",\"level\":\"3\",\"building\":\"Einsteinstrasse62\",\"room\":\"319\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0006411320\",\"locationZ\":\"3.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.58\",\"10.0.0.40\",\"10.0.1.40\",\"10.0.2.40\"],\"macAddresses\":[\"00:0D:B9:22:F5:34\",\"00:1F:1F:28:3D:1A\",\"00:80:48:6B:F5:D4\",\"00:80:48:6B:F2:1D\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-41\",\"level\":\"3\",\"building\":\"Einsteinstrasse62\",\"room\":\"312\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0008764150\",\"locationZ\":\"3.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.59\",\"10.0.0.41\",\"10.0.1.41\",\"10.0.2.41\"],\"macAddresses\":[\"00:0D:B9:22:F8:F4\",\"00:1F:1F:28:20:6B\",\"00:80:48:6B:F1:FD\",\"00:80:48:6B:F2:2E\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-42\",\"level\":\"3\",\"building\":\"Einsteinstrasse62\",\"room\":\"307\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0008926410\",\"locationZ\":\"3.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.60\",\"10.0.0.42\",\"10.0.1.42\",\"10.0.2.42\"],\"macAddresses\":[\"00:0D:B9:22:F9:68\",\"00:1F:1F:09:08:FA\",\"00:80:48:6B:F2:10\",\"00:80:48:6B:F2:29\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-44\",\"level\":\"3\",\"building\":\"Einsteinstrasse62\",\"room\":\"301a\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0006411320\",\"locationZ\":\"4.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.56\",\"10.0.0.44\",\"10.0.1.44\",\"10.0.2.44\"],\"macAddresses\":[\"00:0D:B9:1A:4C:FC\",\"00:1F:1F:09:06:4B\",\"00:80:48:66:DD:FF\",\"00:80:48:66:DE:00\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-45\",\"level\":\"2\",\"building\":\"Einsteinstrasse62\",\"room\":\"208\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0009250940\",\"locationZ\":\"2.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.61\",\"10.0.0.45\",\"10.0.1.45\",\"10.0.2.45\"],\"macAddresses\":[\"00:0D:B9:1A:0C:98\",\"00:1F:1F:09:08:5C\",\"00:80:48:66:DE:26\",\"00:80:48:66:DE:27\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-46\",\"level\":\"2\",\"building\":\"Einsteinstrasse62\",\"room\":\"213\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0008115090\",\"locationZ\":\"2.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.62\",\"10.0.0.46\",\"10.0.1.46\"],\"macAddresses\":[\"00:0D:B9:1A:4D:20\",\"00:1F:1F:09:07:C6\",\"00:80:48:60:7D:6F\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-47\",\"level\":\"2\",\"building\":\"Einsteinstrasse62\",\"room\":\"218\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0006735850\",\"locationZ\":\"2.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.63\",\"10.0.0.47\",\"10.0.1.47\",\"10.0.2.47\"],\"macAddresses\":[\"00:0D:B9:1A:49:54\",\"00:0E:2E:4C:97:00\",\"00:80:48:66:DE:20\",\"00:80:48:66:DE:1D\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-49\",\"level\":\"1\",\"building\":\"Einsteinstrasse62\",\"room\":\"106\",\"locationX\":\"0.0014600000\",\"locationY\":\"0.0009169810\",\"locationZ\":\"1.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.65\",\"10.0.0.49\",\"10.0.1.49\",\"10.0.2.49\"],\"macAddresses\":[\"00:0D:B9:15:CD:BC\",\"00:1F:1F:28:3D:B8\",\"00:80:48:60:7D:73\",\"00:80:48:60:7D:69\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-50\",\"level\":\"1\",\"building\":\"Einsteinstrasse62\",\"room\":\"111\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0008358490\",\"locationZ\":\"1.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.66\",\"10.0.0.50\",\"10.0.1.50\",\"10.0.2.50\"],\"macAddresses\":[\"00:0D:B9:15:CD:94\",\"00:1F:1F:28:20:3D\",\"00:80:48:60:7C:0E\",\"00:80:48:60:7C:0F\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-51\",\"level\":\"1\",\"building\":\"Einsteinstrasse62\",\"room\":\"115\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0007466040\",\"locationZ\":\"1.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.67\",\"10.0.0.51\",\"10.0.1.51\",\"10.0.2.51\"],\"macAddresses\":[\"00:0D:B9:13:A4:5C\",\"00:1F:1F:09:06:55\",\"00:80:48:60:7B:F7\",\"00:80:48:60:7B:F6\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-54\",\"level\":\"0\",\"building\":\"OrleansRing10\",\"room\":\"021\",\"locationX\":\"0.0020400000\",\"locationY\":\"0.0011100000\",\"locationZ\":\"0.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.70\",\"10.0.0.54\",\"10.0.1.54\",\"10.0.2.54\"],\"macAddresses\":[\"00:0D:B9:15:CE:8C\",\"00:1F:1F:28:20:85\",\"00:80:48:60:7C:1C\",\"00:80:48:60:7C:1D\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-59\",\"level\":\"0\",\"building\":\"Einsteinstrasse62\",\"room\":\"SR0\",\"locationX\":\"0.0016550000\",\"locationY\":\"0.0007157740\",\"locationZ\":\"0.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.75\",\"10.0.0.59\",\"10.0.1.59\",\"10.0.2.59\"],\"macAddresses\":[\"00:0D:B9:13:A4:74\",\"00:1F:1F:28:3D:26\",\"00:80:48:60:7D:97\",\"00:80:48:60:7D:93\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"COMSYS-NODE-60\",\"level\":\"0\",\"building\":\"OrleansRing10\",\"room\":\"017\",\"locationX\":\"0.0017300000\",\"locationY\":\"0.0012000000\",\"locationZ\":\"0.0000000000\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.5.202.76\",\"10.0.0.60\",\"10.0.1.60\",\"10.0.2.60\"],\"macAddresses\":[\"00:0D:B9:15:CC:AC\",\"00:1F:1F:28:20:90\",\"00:80:48:60:7D:77\",\"00:80:48:60:7D:67\"],\"testbedName\":\"MIOTTestbed\",\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"}],\"mapped\":{\"COMSYS-NODE-01\":{\"identifier\":\"COMSYS-NODE-01\",\"building\":\"Einsteinstrasse62\",\"level\":\"8\",\"room\":\"802b\",\"latitude\":\"0.0007303770\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.6\",\"10.0.0.1\",\"10.0.1.1\",\"10.0.2.1\"],\"mac\":[\"00:0D:B9:1A:4D:24\",\"00:1F:1F:28:20:42\",\"00:80:48:66:DE:03\",\"00:80:48:66:DE:04\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-02\":{\"identifier\":\"COMSYS-NODE-02\",\"building\":\"Einsteinstrasse62\",\"level\":\"8\",\"room\":\"802b\",\"latitude\":\"0.0007709430\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.5\",\"10.0.0.2\",\"10.0.1.2\",\"10.0.2.2\"],\"mac\":[\"00:0D:B9:14:D9:28\",\"00:1F:1F:28:20:3B\",\"00:80:48:60:7B:DF\",\"00:80:48:60:7B:EC\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-03\":{\"identifier\":\"COMSYS-NODE-03\",\"building\":\"Einsteinstrasse62\",\"level\":\"8\",\"room\":\"808\",\"latitude\":\"0.0009332080\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.4\",\"10.0.0.3\",\"10.0.1.3\",\"10.0.2.3\"],\"mac\":[\"00:0D:B9:22:F8:68\",\"00:0E:2E:4C:97:47\",\"00:80:48:6B:F5:D8\",\"00:80:48:6B:F2:2B\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-04\":{\"identifier\":\"COMSYS-NODE-04\",\"building\":\"Einsteinstrasse62\",\"level\":\"8\",\"room\":\"Lichthof\",\"latitude\":\"0.0008115090\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.20\",\"10.0.0.4\",\"10.0.1.4\",\"10.0.2.4\"],\"mac\":[\"00:0D:B9:22:F9:80\",\"00:1F:1F:28:3E:0E\",\"00:80:48:6B:F5:D2\",\"00:80:48:6B:F5:D3\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-05\":{\"identifier\":\"COMSYS-NODE-05\",\"building\":\"Einsteinstrasse62\",\"level\":\"7\",\"room\":\"Lichthof\",\"latitude\":\"0.0007952830\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.19\",\"10.0.0.5\",\"10.0.1.5\",\"10.0.2.5\"],\"mac\":[\"00:0D:B9:1A:4A:2C\",\"00:1F:1F:09:08:14\",\"00:80:48:66:DE:19\",\"00:80:48:66:DE:18\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-07\":{\"identifier\":\"COMSYS-NODE-07\",\"building\":\"Einsteinstrasse62\",\"level\":\"8\",\"room\":\"802\",\"latitude\":\"0.0006735850\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.21\",\"10.0.0.7\",\"10.0.1.7\",\"10.0.2.7\"],\"mac\":[\"00:0D:B9:22:F5:08\",\"00:1F:1F:28:3D:4B\",\"00:80:48:6B:F2:14\",\"00:80:48:6B:F2:16\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-08\":{\"identifier\":\"COMSYS-NODE-08\",\"building\":\"Einsteinstrasse62\",\"level\":\"8\",\"room\":\"818\",\"latitude\":\"0.0005843400\",\"longitude\":\"0.0014900000\",\"ip\":[\"10.5.202.22\",\"10.0.0.8\",\"10.0.1.8\",\"10.0.2.8\"],\"mac\":[\"00:0D:B9:22:F5:0C\",\"00:1F:1F:28:3D:1E\",\"00:80:48:6B:F2:17\",\"00:80:48:6B:F2:18\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-10\":{\"identifier\":\"COMSYS-NODE-10\",\"building\":\"Einsteinstrasse62\",\"level\":\"7\",\"room\":\"704\",\"latitude\":\"0.0008520750\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.24\",\"10.0.0.10\",\"10.0.1.10\",\"10.0.2.10\"],\"mac\":[\"00:0D:B9:22:8F:F4\",\"00:1F:1F:28:20:2F\",\"00:80:48:6B:F5:BA\",\"00:80:48:6B:F5:D1\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-11\":{\"identifier\":\"COMSYS-NODE-11\",\"building\":\"Einsteinstrasse62\",\"level\":\"5\",\"room\":\"Lichthof\",\"latitude\":\"0.0008033960\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.25\",\"10.0.0.11\",\"10.0.1.11\",\"10.0.2.11\"],\"mac\":[\"00:0D:B9:22:8F:E8\",\"00:1F:1F:09:06:F6\",\"00:80:48:6B:F5:C2\",\"00:80:48:6B:F5:C7\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-12\":{\"identifier\":\"COMSYS-NODE-12\",\"building\":\"Einsteinstrasse62\",\"level\":\"4\",\"room\":\"Lichthof\",\"latitude\":\"0.0008115090\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.26\",\"10.0.0.12\",\"10.0.1.12\",\"10.0.2.12\"],\"mac\":[\"00:0D:B9:1A:4D:48\",\"00:1F:1F:09:09:EA\",\"00:80:48:66:E4:73\",\"00:80:48:66:E4:74\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-13\":{\"identifier\":\"COMSYS-NODE-13\",\"building\":\"Einsteinstrasse62\",\"level\":\"2\",\"room\":\"Lichthof\",\"latitude\":\"0.0008115090\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.27\",\"10.0.0.13\",\"10.0.1.13\",\"10.0.2.13\"],\"mac\":[\"00:0D:B9:1A:4D:00\",\"00:1F:1F:28:20:61\",\"00:80:48:66:DE:07\",\"00:80:48:66:DE:0D\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-14\":{\"identifier\":\"COMSYS-NODE-14\",\"building\":\"Einsteinstrasse62\",\"level\":\"1\",\"room\":\"Seminarraum\",\"latitude\":\"0.0007466040\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.30\",\"10.0.0.14\",\"10.0.1.14\",\"10.0.2.14\"],\"mac\":[\"00:0D:B9:1A:4D:78\",\"00:1F:1F:09:06:47\",\"00:80:48:66:DE:15\",\"00:80:48:66:DE:14\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-16\":{\"identifier\":\"COMSYS-NODE-16\",\"building\":\"Einsteinstrasse62\",\"level\":\"6\",\"room\":\"Lichthof\",\"latitude\":\"0.0008115090\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.28\",\"10.0.0.16\",\"10.0.1.16\",\"10.0.2.16\"],\"mac\":[\"00:0D:B9:22:F5:30\",\"00:1F:1F:09:09:63\",\"00:80:48:6B:F2:24\",\"00:80:48:6B:F2:26\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-17\":{\"identifier\":\"COMSYS-NODE-17\",\"building\":\"Einsteinstrasse62\",\"level\":\"3\",\"room\":\"Lichthof\",\"latitude\":\"0.0008033960\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.31\",\"10.0.0.17\",\"10.0.1.17\",\"10.0.2.17\"],\"mac\":[\"00:0D:B9:13:A4:48\",\"00:0E:2E:4C:95:CB\",\"00:80:48:6B:F2:27\",\"00:80:48:6B:F2:2D\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-18\":{\"identifier\":\"COMSYS-NODE-18\",\"building\":\"Einsteinstrasse62\",\"level\":\"1\",\"room\":\"110\",\"latitude\":\"0.0009494340\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.32\",\"172.16.202.32\",\"172.17.202.32\"],\"mac\":[\"00:0D:B9:1A:4D:90\",\"00:80:48:66:DE:1C\",\"00:80:48:66:E5:AB\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-20\":{\"identifier\":\"COMSYS-NODE-20\",\"building\":\"Einsteinstrasse62\",\"level\":\"8\",\"room\":\"815b\",\"latitude\":\"0.0006411320\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.36\",\"10.0.0.20\",\"10.0.1.20\",\"10.0.2.20\"],\"mac\":[\"00:0D:B9:22:F5:10\",\"00:0E:2E:FF:56:51\",\"00:80:48:6B:F2:25\",\"00:80:48:6B:F5:C8\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-21\":{\"identifier\":\"COMSYS-NODE-21\",\"building\":\"Einsteinstrasse62\",\"level\":\"7\",\"room\":\"707\",\"latitude\":\"0.0009494340\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.37\",\"10.0.0.21\",\"10.0.1.21\",\"10.0.2.21\"],\"mac\":[\"00:0D:B9:1A:4C:F0\",\"00:1F:1F:09:07:37\",\"00:80:48:66:E1:85\",\"00:80:48:66:E1:84\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-23\":{\"identifier\":\"COMSYS-NODE-23\",\"building\":\"Einsteinstrasse62\",\"level\":\"7\",\"room\":\"720\",\"latitude\":\"0.0005843400\",\"longitude\":\"0.0015050000\",\"ip\":[\"10.5.202.39\",\"10.0.0.23\",\"10.0.1.23\",\"10.0.2.23\"],\"mac\":[\"00:0D:B9:22:F4:E8\",\"00:1F:1F:28:3D:B1\",\"00:80:48:6B:F2:01\",\"00:80:48:6B:F2:02\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-24\":{\"identifier\":\"COMSYS-NODE-24\",\"building\":\"Einsteinstrasse62\",\"level\":\"7\",\"room\":\"717\",\"latitude\":\"0.0006492450\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.40\",\"10.0.0.24\",\"10.0.1.24\",\"10.0.2.24\"],\"mac\":[\"00:0D:B9:1A:0C:68\",\"00:1F:1F:28:20:64\",\"00:80:48:60:7D:72\",\"00:80:48:60:7D:61\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-25\":{\"identifier\":\"COMSYS-NODE-25\",\"building\":\"Einsteinstrasse62\",\"level\":\"7\",\"room\":\"713\",\"latitude\":\"0.0007871700\",\"longitude\":\"0.0016610000\",\"ip\":[\"10.5.202.41\",\"10.0.0.25\",\"10.0.1.25\",\"10.0.2.25\"],\"mac\":[\"00:0D:B9:22:F4:E0\",\"00:1F:1F:28:3D:DA\",\"00:80:48:6B:F2:19\",\"00:80:48:6B:F2:1A\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-26\":{\"identifier\":\"COMSYS-NODE-26\",\"building\":\"Einsteinstrasse62\",\"level\":\"6\",\"room\":\"602\",\"latitude\":\"0.0006816980\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.42\",\"10.0.0.26\",\"10.0.1.26\",\"10.0.2.26\"],\"mac\":[\"00:0D:B9:22:F8:70\",\"00:1F:1F:09:08:1B\",\"00:80:48:6B:F2:00\",\"00:80:48:6B:F5:C9\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-27\":{\"identifier\":\"COMSYS-NODE-27\",\"building\":\"Einsteinstrasse62\",\"level\":\"6\",\"room\":\"604c\",\"latitude\":\"0.0009088680\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.43\",\"10.0.0.27\",\"10.0.1.27\",\"10.0.2.27\"],\"mac\":[\"00:0D:B9:1A:4D:60\",\"00:1F:1F:09:06:9D\",\"00:80:48:66:DE:11\",\"00:80:48:66:DE:10\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-28\":{\"identifier\":\"COMSYS-NODE-28\",\"building\":\"Einsteinstrasse62\",\"level\":\"6\",\"room\":\"612\",\"latitude\":\"0.0006573580\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.45\",\"10.0.0.28\",\"10.0.1.28\",\"10.0.2.28\"],\"mac\":[\"00:0D:B9:1A:4D:10\",\"00:1F:1F:09:06:94\",\"00:80:48:66:E5:A1\",\"00:80:48:66:E5:A2\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-29\":{\"identifier\":\"COMSYS-NODE-29\",\"building\":\"Einsteinstrasse62\",\"level\":\"6\",\"room\":\"608\",\"latitude\":\"0.0007790570\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.44\",\"10.0.0.29\",\"10.0.1.29\",\"10.0.2.29\"],\"mac\":[\"00:0D:B9:22:F5:8C\",\"00:1F:1F:28:3D:CC\",\"00:80:48:6B:F2:06\",\"00:80:48:6B:F2:05\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-30\":{\"identifier\":\"COMSYS-NODE-30\",\"building\":\"Einsteinstrasse62\",\"level\":\"6\",\"room\":\"607\",\"latitude\":\"0.0008520750\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.46\",\"10.0.0.30\",\"10.0.1.30\",\"10.0.2.30\"],\"mac\":[\"00:0D:B9:1A:4D:64\",\"00:1F:1F:28:3D:F0\",\"00:80:48:66:E1:A8\",\"00:80:48:66:DE:1B\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-31\":{\"identifier\":\"COMSYS-NODE-31\",\"building\":\"Einsteinstrasse62\",\"level\":\"6\",\"room\":\"605a\",\"latitude\":\"0.0009007550\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.47\",\"10.0.0.31\",\"10.0.1.31\",\"10.0.2.31\"],\"mac\":[\"00:0D:B9:22:F5:54\",\"00:1F:1F:28:20:83\",\"00:80:48:6B:F2:0B\",\"00:80:48:6B:F2:0A\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-32\":{\"identifier\":\"COMSYS-NODE-32\",\"building\":\"Einsteinstrasse62\",\"level\":\"5\",\"room\":\"522\",\"latitude\":\"0.0005843400\",\"longitude\":\"0.0014900000\",\"ip\":[\"10.5.202.48\",\"10.0.0.32\",\"10.0.1.32\",\"10.0.2.32\"],\"mac\":[\"00:0D:B9:1A:49:38\",\"00:1F:1F:09:06:43\",\"00:80:48:66:E1:81\",\"00:80:48:66:E1:82\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-33\":{\"identifier\":\"COMSYS-NODE-33\",\"building\":\"Einsteinstrasse62\",\"level\":\"5\",\"room\":\"502\",\"latitude\":\"0.0006898110\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.49\",\"10.0.0.33\",\"10.0.1.33\",\"10.0.2.33\"],\"mac\":[\"00:0D:B9:1A:49:EC\",\"00:1F:1F:28:20:3E\",\"00:80:48:66:DE:17\",\"00:80:48:66:DE:16\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-35\":{\"identifier\":\"COMSYS-NODE-35\",\"building\":\"Einsteinstrasse62\",\"level\":\"5\",\"room\":\"518\",\"latitude\":\"0.0006816980\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.51\",\"10.0.0.35\",\"10.0.1.35\",\"10.0.2.35\"],\"mac\":[\"00:0D:B9:22:F5:24\",\"00:1F:1F:09:06:07\",\"00:80:48:6B:F2:04\",\"00:80:48:6B:F2:03\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-36\":{\"identifier\":\"COMSYS-NODE-36\",\"building\":\"Einsteinstrasse62\",\"level\":\"4\",\"room\":\"417\",\"latitude\":\"0.0006411320\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.52\",\"10.0.0.36\",\"10.0.1.36\",\"10.0.2.36\"],\"mac\":[\"00:0D:B9:1A:49:10\",\"00:1F:1F:09:06:9A\",\"00:80:48:66:DE:0C\",\"00:80:48:66:DE:0B\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-38\":{\"identifier\":\"COMSYS-NODE-38\",\"building\":\"Einsteinstrasse62\",\"level\":\"4\",\"room\":\"401\",\"latitude\":\"0.0006898110\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.54\",\"10.0.0.38\",\"10.0.1.38\",\"10.0.2.38\"],\"mac\":[\"00:0D:B9:1A:06:DC\",\"00:0E:2E:4C:96:1B\",\"00:80:48:66:DE:24\",\"00:80:48:66:DE:25\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-39\":{\"identifier\":\"COMSYS-NODE-39\",\"building\":\"Einsteinstrasse62\",\"level\":\"4\",\"room\":\"421\",\"latitude\":\"0.0005843400\",\"longitude\":\"0.0014900000\",\"ip\":[\"10.5.202.57\",\"10.0.0.39\",\"10.0.1.39\",\"10.0.2.39\"],\"mac\":[\"00:0D:B9:22:F8:4C\",\"00:1F:1F:09:08:17\",\"00:80:48:6B:F2:1C\",\"00:80:48:6B:F5:D9\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-40\":{\"identifier\":\"COMSYS-NODE-40\",\"building\":\"Einsteinstrasse62\",\"level\":\"3\",\"room\":\"319\",\"latitude\":\"0.0006411320\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.58\",\"10.0.0.40\",\"10.0.1.40\",\"10.0.2.40\"],\"mac\":[\"00:0D:B9:22:F5:34\",\"00:1F:1F:28:3D:1A\",\"00:80:48:6B:F5:D4\",\"00:80:48:6B:F2:1D\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-41\":{\"identifier\":\"COMSYS-NODE-41\",\"building\":\"Einsteinstrasse62\",\"level\":\"3\",\"room\":\"312\",\"latitude\":\"0.0008764150\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.59\",\"10.0.0.41\",\"10.0.1.41\",\"10.0.2.41\"],\"mac\":[\"00:0D:B9:22:F8:F4\",\"00:1F:1F:28:20:6B\",\"00:80:48:6B:F1:FD\",\"00:80:48:6B:F2:2E\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-42\":{\"identifier\":\"COMSYS-NODE-42\",\"building\":\"Einsteinstrasse62\",\"level\":\"3\",\"room\":\"307\",\"latitude\":\"0.0008926410\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.60\",\"10.0.0.42\",\"10.0.1.42\",\"10.0.2.42\"],\"mac\":[\"00:0D:B9:22:F9:68\",\"00:1F:1F:09:08:FA\",\"00:80:48:6B:F2:10\",\"00:80:48:6B:F2:29\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-44\":{\"identifier\":\"COMSYS-NODE-44\",\"building\":\"Einsteinstrasse62\",\"level\":\"3\",\"room\":\"301a\",\"latitude\":\"0.0006411320\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.56\",\"10.0.0.44\",\"10.0.1.44\",\"10.0.2.44\"],\"mac\":[\"00:0D:B9:1A:4C:FC\",\"00:1F:1F:09:06:4B\",\"00:80:48:66:DD:FF\",\"00:80:48:66:DE:00\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-45\":{\"identifier\":\"COMSYS-NODE-45\",\"building\":\"Einsteinstrasse62\",\"level\":\"2\",\"room\":\"208\",\"latitude\":\"0.0009250940\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.61\",\"10.0.0.45\",\"10.0.1.45\",\"10.0.2.45\"],\"mac\":[\"00:0D:B9:1A:0C:98\",\"00:1F:1F:09:08:5C\",\"00:80:48:66:DE:26\",\"00:80:48:66:DE:27\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-46\":{\"identifier\":\"COMSYS-NODE-46\",\"building\":\"Einsteinstrasse62\",\"level\":\"2\",\"room\":\"213\",\"latitude\":\"0.0008115090\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.62\",\"10.0.0.46\",\"10.0.1.46\"],\"mac\":[\"00:0D:B9:1A:4D:20\",\"00:1F:1F:09:07:C6\",\"00:80:48:60:7D:6F\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-47\":{\"identifier\":\"COMSYS-NODE-47\",\"building\":\"Einsteinstrasse62\",\"level\":\"2\",\"room\":\"218\",\"latitude\":\"0.0006735850\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.63\",\"10.0.0.47\",\"10.0.1.47\",\"10.0.2.47\"],\"mac\":[\"00:0D:B9:1A:49:54\",\"00:0E:2E:4C:97:00\",\"00:80:48:66:DE:20\",\"00:80:48:66:DE:1D\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-49\":{\"identifier\":\"COMSYS-NODE-49\",\"building\":\"Einsteinstrasse62\",\"level\":\"1\",\"room\":\"106\",\"latitude\":\"0.0009169810\",\"longitude\":\"0.0014600000\",\"ip\":[\"10.5.202.65\",\"10.0.0.49\",\"10.0.1.49\",\"10.0.2.49\"],\"mac\":[\"00:0D:B9:15:CD:BC\",\"00:1F:1F:28:3D:B8\",\"00:80:48:60:7D:73\",\"00:80:48:60:7D:69\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-50\":{\"identifier\":\"COMSYS-NODE-50\",\"building\":\"Einsteinstrasse62\",\"level\":\"1\",\"room\":\"111\",\"latitude\":\"0.0008358490\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.66\",\"10.0.0.50\",\"10.0.1.50\",\"10.0.2.50\"],\"mac\":[\"00:0D:B9:15:CD:94\",\"00:1F:1F:28:20:3D\",\"00:80:48:60:7C:0E\",\"00:80:48:60:7C:0F\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-51\":{\"identifier\":\"COMSYS-NODE-51\",\"building\":\"Einsteinstrasse62\",\"level\":\"1\",\"room\":\"115\",\"latitude\":\"0.0007466040\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.67\",\"10.0.0.51\",\"10.0.1.51\",\"10.0.2.51\"],\"mac\":[\"00:0D:B9:13:A4:5C\",\"00:1F:1F:09:06:55\",\"00:80:48:60:7B:F7\",\"00:80:48:60:7B:F6\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-54\":{\"identifier\":\"COMSYS-NODE-54\",\"building\":\"OrleansRing10\",\"level\":\"0\",\"room\":\"021\",\"latitude\":\"0.0011100000\",\"longitude\":\"0.0020400000\",\"ip\":[\"10.5.202.70\",\"10.0.0.54\",\"10.0.1.54\",\"10.0.2.54\"],\"mac\":[\"00:0D:B9:15:CE:8C\",\"00:1F:1F:28:20:85\",\"00:80:48:60:7C:1C\",\"00:80:48:60:7C:1D\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-59\":{\"identifier\":\"COMSYS-NODE-59\",\"building\":\"Einsteinstrasse62\",\"level\":\"0\",\"room\":\"SR0\",\"latitude\":\"0.0007157740\",\"longitude\":\"0.0016550000\",\"ip\":[\"10.5.202.75\",\"10.0.0.59\",\"10.0.1.59\",\"10.0.2.59\"],\"mac\":[\"00:0D:B9:13:A4:74\",\"00:1F:1F:28:3D:26\",\"00:80:48:60:7D:97\",\"00:80:48:60:7D:93\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},\"COMSYS-NODE-60\":{\"identifier\":\"COMSYS-NODE-60\",\"building\":\"OrleansRing10\",\"level\":\"0\",\"room\":\"017\",\"latitude\":\"0.0012000000\",\"longitude\":\"0.0017300000\",\"ip\":[\"10.5.202.76\",\"10.0.0.60\",\"10.0.1.60\",\"10.0.2.60\"],\"mac\":[\"00:0D:B9:15:CC:AC\",\"00:1F:1F:28:20:90\",\"00:80:48:60:7D:77\",\"00:80:48:60:7D:67\"],\"hidden\":false,\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"}},\"mappings\":{\"identifier\":\"name\",\"building\":\"building\",\"level\":\"level\",\"room\":\"room\",\"latitude\":\"locationY\",\"longitude\":\"locationX\",\"ip\":\"ipv4Addresses\",\"mac\":\"macAddresses\"},\"global\":{\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\",\"building\":null},\"newNode\":[]},\"results\":{\"mappings\":{\"scan_results\":{\"startNode\":{\"metric\":[\"identifier\"],\"mappings\":[\"identifier\"]},\"endNode\":{\"metric\":[\"destinationIp\",\"sinkMac\"],\"mappings\":[\"ip\",\"mac\"]},\"color\":{\"metric\":\"quality\",\"min\":1,\"max\":100,\"names\":\"red,yellow,green\"},\"width\":{\"metric\":\"quality\",\"min\":1,\"max\":100},\"result\":{\"parameter\":\"result\",\"nodeIdentifier\":\"nodeId\",\"startTime\":\"startTime\",\"endTime\":\"startPlusX\",\"endTimeAdditional\":1},\"markers\":[],\"filter\":{\"parameter\":null,\"values\":[]}},\"results\":{\"startNode\":{\"metric\":[\"identifier\"],\"mappings\":[\"identifier\"]},\"endNode\":{\"metric\":[\"remote\"],\"mappings\":[\"ip\"]},\"color\":{\"metric\":\"data_val\",\"min\":1,\"max\":996,\"names\":\"green,yellow,red\"},\"width\":{\"metric\":\"throughput_val\",\"min\":1.02,\"max\":988},\"result\":{\"parameter\":\"result\",\"nodeIdentifier\":\"nodeId\",\"startTime\":\"startedAfter\",\"endTime\":\"endedBefore\",\"endTimeAdditional\":0},\"markers\":[],\"filter\":{\"parameter\":null,\"values\":[]}}}},\"options\":{\"resultType\":\"results\",\"globalNode\":{\"positionType\":\"gpsRelative\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\",\"building\":null}}}','/var/www/meshify/meshnetconf/storage/app/rawExperiments/4.xml',1),
	(5,'2016-11-24 11:43:37','2016-11-24 12:13:09','Edge Evaluation',NULL,'parsedExperiments/5.json','{\"selectedBuildings\":[{\"id\":6,\"alias\":\"Einsteinstra\\u00dfe 62\"}],\"nodes\":{\"raw\":[{\"name\":\"NODE1\",\"level\":\"8\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"802b\",\"locationX\":\"7.603257\",\"locationY\":\"51.965828\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.1\"],\"macAddresses\":[\"00:00:00:00:00:01\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"NODE2\",\"level\":\"8\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"802b\",\"locationX\":\"7.603248 \",\"locationY\":\"51.966257\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.2\"],\"macAddresses\":[\"00:00:00:00:00:02\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"NODE3\",\"level\":\"8\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"808\",\"locationX\":\"7.603458\",\"locationY\":\"51.966254\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.3\"],\"macAddresses\":[\"00:00:00:00:00:03\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"},{\"name\":\"NODE4\",\"level\":\"8\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"810\",\"locationX\":\"7.603465\",\"locationY\":\"51.965830\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.4\"],\"macAddresses\":[\"00:00:00:00:00:04\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\"}],\"mapped\":[],\"mappings\":{\"identifier\":\"name\",\"building\":\"building\",\"level\":\"level\",\"room\":\"room\",\"latitude\":\"locationY\",\"longitude\":\"locationX\",\"ip\":\"ipv4Addresses\",\"mac\":\"macAddresses\"},\"global\":{\"positionType\":\"gps\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\",\"building\":null},\"newNode\":[]},\"results\":{\"mappings\":{\"scan_results\":{\"startNode\":{\"metric\":[\"identifier\"],\"mappings\":[\"identifier\"]},\"endNode\":{\"metric\":[\"destinationIp\",\"sinkMac\"],\"mappings\":[\"ip\",\"mac\"]},\"color\":{\"metric\":\"quality\",\"min\":99999999,\"max\":-99999999,\"names\":\"red,yellow,green\"},\"width\":{\"metric\":\"quality\",\"min\":99999999,\"max\":-99999999},\"result\":{\"parameter\":\"result\",\"nodeIdentifier\":\"nodeId\",\"startTime\":\"startTime\",\"endTime\":\"startPlusX\",\"endTimeAdditional\":1},\"markers\":[],\"filter\":{\"parameter\":null,\"values\":[]}},\"results\":{\"startNode\":{\"metric\":[\"identifier\"],\"mappings\":[\"identifier\"]},\"endNode\":{\"metric\":[\"destination\",\"mac-destination\"],\"mappings\":[\"ip\",\"mac\"]},\"color\":{\"metric\":\"metric1\",\"min\":1,\"max\":100,\"names\":\"green,yellow,red\"},\"width\":{\"metric\":\"metric2\",\"min\":1,\"max\":100},\"result\":{\"parameter\":\"result\",\"nodeIdentifier\":\"nodeId\",\"startTime\":\"startedAfter\",\"endTime\":\"endedBefore\",\"endTimeAdditional\":0},\"markers\":[],\"filter\":{\"parameter\":null,\"values\":[]}}}},\"options\":{\"resultType\":\"results\",\"globalNode\":{\"positionType\":\"gps\",\"relativeLatitude\":\"51.965236\",\"relativeLongitude\":\"7.60178\",\"building\":null}}}','/var/www/meshify/meshnetconf/storage/app/rawExperiments/5.xml',1),
	(6,'2016-11-24 11:43:48','2016-11-24 12:22:26','Node Evaluation',NULL,'parsedExperiments/6.json','{\"selectedBuildings\":[{\"id\":1,\"alias\":\"Einsteinstra\\u00dfe 62\"}],\"nodes\":{\"raw\":[{\"name\":\"NODE1\",\"level\":\"8\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"802b\",\"locationX\":\"7.603257\",\"locationY\":\"51.965828\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.1\"],\"macAddresses\":[\"00:00:00:00:00:01\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\"},{\"name\":\"NODE2\",\"level\":\"8\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"802b\",\"locationX\":\"7.603248 \",\"locationY\":\"51.966257\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.2\"],\"macAddresses\":[\"00:00:00:00:00:02\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\"},{\"name\":\"NODE3\",\"level\":\"8\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"803\",\"locationX\":\"7.603458\",\"locationY\":\"51.966254\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.3\"],\"macAddresses\":[\"00:00:00:00:00:03\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\"},{\"name\":\"NODE4\",\"level\":\"8\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"812\",\"locationX\":\"7.603465\",\"locationY\":\"51.965830\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.4\"],\"macAddresses\":[\"00:00:00:00:00:04\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\"},{\"name\":\"NODE5\",\"level\":\"1\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"806\",\"locationX\":\"0\",\"locationY\":\"0\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.5\"],\"macAddresses\":[\"00:00:00:00:00:05\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\"},{\"name\":\"NODE6\",\"level\":\"1\",\"building\":\"Einsteinstra\\u00dfe 62\",\"locationX\":\"-0.000009\",\"locationY\":\"0.000429\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.6\"],\"macAddresses\":[\"00:00:00:00:00:06\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\"},{\"name\":\"NODE7\",\"level\":\"1\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"811\",\"locationX\":\"0.000201\",\"locationY\":\"0.000426\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.7\"],\"macAddresses\":[\"00:00:00:00:00:07\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\"},{\"name\":\"NODE8\",\"level\":\"1\",\"building\":\"Einsteinstra\\u00dfe 62\",\"room\":\"808\",\"locationX\":\"0.000208\",\"locationY\":\"0.000002\",\"locationZ\":\"0\",\"nodeType\":\"router\",\"ipv4Addresses\":[\"10.0.0.8\"],\"macAddresses\":[\"00:00:00:00:00:08\"],\"testbedName\":\"EVALTestbed\",\"hidden\":false,\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\"}],\"mapped\":[],\"mappings\":{\"identifier\":\"name\",\"building\":\"building\",\"level\":\"level\",\"room\":\"room\",\"latitude\":\"locationY\",\"longitude\":\"locationX\",\"ip\":\"ipv4Addresses\",\"mac\":\"macAddresses\"},\"global\":{\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\",\"building\":null},\"newNode\":[]},\"results\":{\"mappings\":{\"scan_results\":{\"startNode\":{\"metric\":[\"identifier\"],\"mappings\":[\"identifier\"]},\"endNode\":{\"metric\":[\"destinationIp\",\"sinkMac\"],\"mappings\":[\"ip\",\"mac\"]},\"color\":{\"metric\":\"quality\",\"min\":99999999,\"max\":-99999999,\"names\":\"red,yellow,green\"},\"width\":{\"metric\":\"quality\",\"min\":99999999,\"max\":-99999999},\"result\":{\"parameter\":\"result\",\"nodeIdentifier\":\"nodeId\",\"startTime\":\"startTime\",\"endTime\":\"startPlusX\",\"endTimeAdditional\":1},\"markers\":[],\"filter\":{\"parameter\":null,\"values\":[]}},\"results\":{\"startNode\":{\"metric\":[\"identifier\"],\"mappings\":[\"identifier\"]},\"endNode\":{\"metric\":[\"destination\",\"mac-destination\"],\"mappings\":[\"ip\",\"mac\"]},\"color\":{\"metric\":\"metric1\",\"min\":99999999,\"max\":-99999999,\"names\":\"green,yellow,red\"},\"width\":{\"metric\":\"metric2\",\"min\":99999999,\"max\":-99999999},\"result\":{\"parameter\":\"result\",\"nodeIdentifier\":\"nodeId\",\"startTime\":\"startedAfter\",\"endTime\":\"endedBefore\",\"endTimeAdditional\":0},\"markers\":[],\"filter\":{\"parameter\":null,\"values\":[]}}}},\"options\":{\"resultType\":\"results\",\"globalNode\":{\"positionType\":\"gps\",\"relativeLatitude\":\"51.965828\",\"relativeLongitude\":\"7.603257\",\"building\":null}}}','/var/www/meshify/meshnetconf/storage/app/rawExperiments/6.xml',1);

/*!40000 ALTER TABLE `experiments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table floors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `floors`;

CREATE TABLE `floors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `height` double(8,2) NOT NULL,
  `building_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `floors_building_id_foreign` (`building_id`),
  CONSTRAINT `floors_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `floors` WRITE;
/*!40000 ALTER TABLE `floors` DISABLE KEYS */;

INSERT INTO `floors` (`id`, `created_at`, `updated_at`, `name`, `level`, `height`, `building_id`)
VALUES
	(2,'2016-10-27 09:15:14','2016-10-27 09:15:14','Erdgeschoss',0,5.00,2),
	(5,'2016-10-27 10:31:32','2016-10-27 10:31:32','EG',0,10.00,5),
	(6,'2016-10-30 13:34:11','2016-10-30 13:34:11','EG',0,5.00,6),
	(7,'2016-10-30 15:29:03','2016-10-30 15:29:03','EG',0,5.00,7),
	(9,'2016-11-01 12:00:04','2016-11-01 12:00:04','Erdgeschoss',0,2.50,1),
	(10,'2016-11-01 12:19:52','2016-11-01 12:19:52','1. Stock',1,2.50,1),
	(11,'2016-11-01 12:22:29','2016-11-01 12:22:29','2. Stock',2,2.50,1),
	(12,'2016-11-01 12:25:03','2016-11-01 12:25:03','3. Stock',3,2.50,1),
	(13,'2016-11-01 12:27:27','2016-11-01 12:27:27','4. Stock',4,2.50,1),
	(14,'2016-11-01 12:30:01','2016-11-01 12:30:01','5. Stock',5,2.50,1),
	(15,'2016-11-01 12:33:17','2016-11-01 12:33:17','6. Etage',6,2.50,1),
	(16,'2016-11-01 12:37:40','2016-11-01 12:37:40','7. Etage',7,2.50,1),
	(17,'2016-11-01 12:40:11','2016-11-01 12:40:15','8. Stock',8,2.50,1),
	(18,'2016-11-08 12:02:00','2016-11-08 12:02:00','EG',0,3.00,8);

/*!40000 ALTER TABLE `floors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mappings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mappings`;

CREATE TABLE `mappings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `result_mapping` text COLLATE utf8_unicode_ci,
  `scan_result_mapping` text COLLATE utf8_unicode_ci,
  `node_mapping` text COLLATE utf8_unicode_ci,
  `general_info_mapping` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;

INSERT INTO `mappings` (`id`, `created_at`, `updated_at`, `name`, `is_active`, `result_mapping`, `scan_result_mapping`, `node_mapping`, `general_info_mapping`)
VALUES
	(1,'2016-11-24 00:48:16','2016-11-24 00:48:16','Default Mapping',1,'{\"xpath\":\"\\/experiment\\/results\\/replication\\/iteration\\/action_block\\/action\\/invocation\\/result\",\"id\":null,\"variables\":{\"result\":\".\",\"nodeId\":\"..\\/node\",\"invocationId\":\"parent::invocation\\/@id\",\"startedAfter\":\"parent::invocation\\/@startedAfter\",\"endedBefore\":\"parent::invocation\\/@endedBefore\",\"returnCode\":\"parent::invocation\\/@returnCode\",\"actionId\":\"parent::invocation\\/parent::action\\/@id\",\"actionBlockId\":\"parent::invocation\\/parent::action\\/parent::action_block\\/@id\",\"variableValues\":\"parent::invocation\\/parent::action\\/parent::action_block\\/parent::iteration\\/variableValues\\/variableValue\",\"iterationId\":\"parent::invocation\\/parent::action\\/parent::action_block\\/parent::iteration\\/@id\",\"replicationId\":\"parent::invocation\\/parent::action\\/parent::action_block\\/parent::iteration\\/parent::replication\\/@id\"},\"relations\":[]}','{\"xpath\":\"\\/experiment\\/scans\\/extractor\\/node\\/result\\/result\",\"id\":null,\"variables\":{\"result\":\".\",\"startTime\":\"..\\/probetime\",\"nodeId\":\"..\\/..\\/@name\",\"extractor\":\"..\\/..\\/..\\/@name\"},\"relations\":[]}','{\"xpath\":\"\\/experiment\\/hardware\\/nodes\\/node\",\"id\":\"@id\",\"variables\":{\"name\":\"@id\",\"level\":\"level\",\"building\":\"building\",\"room\":\"room\",\"locationX\":\"locationX\",\"locationY\":\"locationY\",\"locationZ\":\"locationZ\",\"nodeType\":\"nodetype\",\"ipv4Addresses\":\".\\/interfaces\\/interface\\/ipv4Address\",\"macAddresses\":\".\\/interfaces\\/interface\\/macAddress\",\"testbedName\":\".\\/..\\/..\\/testbeds\\/@name\"}}','{\"xpath\":\"\\/experiment\\/general\",\"id\":\"name\",\"variables\":{\"name\":\"name\",\"description\":\"description\"}}');

/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(8,'2014_10_12_000000_create_users_table',1),
	(9,'2014_10_12_100000_create_password_resets_table',1),
	(10,'2016_06_12_140713_create_buildings_table',1),
	(11,'2016_06_12_141135_create_floors_table',1),
	(12,'2016_06_12_141404_create_rooms_table',1),
	(13,'2016_06_15_072806_create_mappings_table',1),
	(14,'2016_06_21_134718_create_experiments_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table rooms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `floor_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grid_start_x` double(8,2) NOT NULL,
  `grid_start_z` double(8,2) NOT NULL,
  `grid_stop_x` double(8,2) NOT NULL,
  `grid_stop_z` double(8,2) NOT NULL,
  `color_r` int(11) NOT NULL DEFAULT '0',
  `color_g` int(11) NOT NULL DEFAULT '0',
  `color_b` int(11) NOT NULL DEFAULT '0',
  `color_a` double(8,2) NOT NULL DEFAULT '0.20',
  PRIMARY KEY (`id`),
  KEY `rooms_floor_id_foreign` (`floor_id`),
  CONSTRAINT `rooms_floor_id_foreign` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;

INSERT INTO `rooms` (`id`, `created_at`, `updated_at`, `floor_id`, `name`, `grid_start_x`, `grid_start_z`, `grid_stop_x`, `grid_stop_z`, `color_r`, `color_g`, `color_b`, `color_a`)
VALUES
	(25,'2016-10-27 10:16:15','2016-10-27 10:16:15',2,'003',2.00,2.00,3.00,3.00,0,0,0,0.10),
	(26,'2016-10-27 10:16:15','2016-10-27 10:16:15',2,'002',2.00,0.00,3.00,1.00,0,0,0,0.10),
	(27,'2016-10-27 10:16:15','2016-10-27 10:16:15',2,'001',0.00,0.00,1.00,1.00,0,0,0,0.10),
	(28,'2016-10-27 10:16:15','2016-10-27 10:16:15',2,'005',0.00,0.00,3.00,3.00,0,0,0,0.10),
	(29,'2016-10-27 10:16:15','2016-10-27 10:16:15',2,'004',0.00,2.00,1.00,3.00,0,0,0,0.10),
	(30,'2016-10-27 10:16:15','2016-10-27 10:16:15',2,'006',3.00,0.00,4.00,3.00,0,0,0,0.10),
	(41,'2016-10-27 10:31:44','2016-10-27 10:36:55',5,'Superrooom',0.00,0.00,1.00,1.00,0,0,0,0.10),
	(46,'2016-10-30 13:34:19','2016-11-05 13:29:43',6,'001',0.00,0.00,1.00,1.00,0,0,0,0.10),
	(47,'2016-10-30 15:29:23','2016-10-30 15:29:23',7,'001',0.00,0.00,1.00,1.00,0,0,0,0.10),
	(65,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'016',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(66,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'002',0.00,5.00,1.00,7.00,0,0,0,0.10),
	(67,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'014',0.00,2.00,3.00,4.00,0,0,0,0.10),
	(68,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'001',0.00,4.00,1.00,5.00,0,0,0,0.10),
	(69,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'007',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(70,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'004',0.00,8.00,1.00,10.00,0,0,0,0.10),
	(71,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'006',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(72,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'003',0.00,7.00,1.00,8.00,0,0,0,0.10),
	(73,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'008',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(74,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'015',1.00,4.00,2.00,10.00,0,0,0,0.10),
	(75,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'013a',1.00,10.00,2.00,12.00,0,0,0,0.10),
	(76,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'012',1.00,12.00,2.00,13.00,0,0,0,0.10),
	(77,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'013',2.00,4.00,3.00,7.00,0,0,0,0.10),
	(78,'2016-11-01 12:07:00','2016-11-01 12:07:00',9,'005a',2.00,7.00,3.00,8.00,0,0,0,0.10),
	(79,'2016-11-01 12:07:01','2016-11-01 12:07:01',9,'005',2.00,8.00,3.00,10.00,0,0,0,0.10),
	(80,'2016-11-01 12:07:01','2016-11-01 12:07:01',9,'010',2.00,10.00,3.00,11.00,0,0,0,0.10),
	(81,'2016-11-01 12:07:01','2016-11-01 12:07:01',9,'009',2.00,11.00,3.00,12.00,0,0,0,0.10),
	(82,'2016-11-01 12:07:01','2016-11-01 12:07:01',9,'027',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(83,'2016-11-01 12:22:19','2016-11-01 12:22:19',10,'120',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(84,'2016-11-01 12:22:19','2016-11-01 12:22:19',10,'101',0.00,4.00,1.00,6.00,0,0,0,0.10),
	(85,'2016-11-01 12:22:19','2016-11-01 12:22:19',10,'119',0.00,2.00,1.00,4.00,0,0,0,0.10),
	(86,'2016-11-01 12:22:19','2016-11-01 12:22:19',10,'102',0.00,6.00,1.00,7.00,0,0,0,0.10),
	(87,'2016-11-01 12:22:19','2016-11-01 12:22:19',10,'103',0.00,7.00,1.00,9.00,0,0,0,0.10),
	(88,'2016-11-01 12:22:19','2016-11-01 12:22:19',10,'103b',0.00,9.00,1.00,10.00,0,0,0,0.10),
	(89,'2016-11-01 12:22:19','2016-11-01 12:22:19',10,'105',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(90,'2016-11-01 12:22:19','2016-11-01 12:22:19',10,'106',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(91,'2016-11-01 12:22:20','2016-11-01 12:22:20',10,'107',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(92,'2016-11-01 12:22:20','2016-11-01 12:22:20',10,'122',1.00,2.00,2.00,13.00,0,0,0,0.10),
	(93,'2016-11-01 12:22:20','2016-11-01 12:22:20',10,'113b',2.00,2.00,3.00,4.00,0,0,0,0.10),
	(94,'2016-11-01 12:22:20','2016-11-01 12:22:20',10,'114',2.00,4.00,3.00,6.00,0,0,0,0.10),
	(95,'2016-11-01 12:22:20','2016-11-01 12:22:20',10,'113',2.00,6.00,3.00,7.00,0,0,0,0.10),
	(96,'2016-11-01 12:22:20','2016-11-01 12:22:20',10,'111',2.00,7.00,3.00,10.00,0,0,0,0.10),
	(97,'2016-11-01 12:22:20','2016-11-01 12:22:20',10,'109',2.00,10.00,3.00,12.00,0,0,0,0.10),
	(98,'2016-11-01 12:22:20','2016-11-01 12:22:20',10,'123',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(99,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'218',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(100,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'201',0.00,2.00,1.00,4.00,0,0,0,0.10),
	(101,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'203',0.00,5.00,1.00,6.00,0,0,0,0.10),
	(102,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'202',0.00,4.00,1.00,5.00,0,0,0,0.10),
	(103,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'204a',0.00,7.00,1.00,8.00,0,0,0,0.10),
	(104,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'205',0.00,8.00,1.00,9.00,0,0,0,0.10),
	(105,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'206',0.00,9.00,1.00,10.00,0,0,0,0.10),
	(106,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'204',0.00,6.00,1.00,7.00,0,0,0,0.10),
	(107,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'207',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(108,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'208',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(109,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'209',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(110,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'225',1.00,2.00,2.00,13.00,0,0,0,0.10),
	(111,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'219',2.00,2.00,3.00,3.00,0,0,0,0.10),
	(112,'2016-11-01 12:24:41','2016-11-01 12:24:41',11,'218',2.00,3.00,3.00,5.00,0,0,0,0.10),
	(113,'2016-11-01 12:24:42','2016-11-01 12:24:42',11,'217',2.00,5.00,3.00,6.00,0,0,0,0.10),
	(114,'2016-11-01 12:24:42','2016-11-01 12:24:42',11,'216',2.00,6.00,3.00,7.00,0,0,0,0.10),
	(115,'2016-11-01 12:24:42','2016-11-01 12:24:42',11,'215',2.00,7.00,3.00,8.00,0,0,0,0.10),
	(116,'2016-11-01 12:24:42','2016-11-01 12:24:42',11,'214',2.00,8.00,3.00,9.00,0,0,0,0.10),
	(117,'2016-11-01 12:24:42','2016-11-01 12:24:42',11,'213',2.00,9.00,3.00,10.00,0,0,0,0.10),
	(118,'2016-11-01 12:24:42','2016-11-01 12:24:42',11,'212',2.00,10.00,3.00,11.00,0,0,0,0.10),
	(119,'2016-11-01 12:24:42','2016-11-01 12:24:42',11,'226',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(120,'2016-11-01 12:24:42','2016-11-01 12:24:42',11,'211',2.00,11.00,3.00,12.00,0,0,0,0.10),
	(121,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'301a',0.00,2.00,1.00,3.00,0,0,0,0.10),
	(122,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'302',0.00,4.00,1.00,5.00,0,0,0,0.10),
	(123,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'331',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(124,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'301b',0.00,3.00,1.00,4.00,0,0,0,0.10),
	(125,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'304a',0.00,7.00,1.00,8.00,0,0,0,0.10),
	(126,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'303',0.00,5.00,1.00,6.00,0,0,0,0.10),
	(127,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'305',0.00,8.00,1.00,9.00,0,0,0,0.10),
	(128,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'304',0.00,6.00,1.00,7.00,0,0,0,0.10),
	(129,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'306',0.00,9.00,1.00,10.00,0,0,0,0.10),
	(130,'2016-11-01 12:27:12','2016-11-01 12:27:12',12,'308',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(131,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'307',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(132,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'330',1.00,2.00,2.00,13.00,0,0,0,0.10),
	(133,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'319',2.00,2.00,3.00,3.00,0,0,0,0.10),
	(134,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'309',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(135,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'317',2.00,4.00,3.00,5.00,0,0,0,0.10),
	(136,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'218',2.00,3.00,3.00,4.00,0,0,0,0.10),
	(137,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'316',2.00,5.00,3.00,6.00,0,0,0,0.10),
	(138,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'315',2.00,6.00,3.00,8.00,0,0,0,0.10),
	(139,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'314',2.00,8.00,3.00,9.00,0,0,0,0.10),
	(140,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'313',2.00,9.00,3.00,10.00,0,0,0,0.10),
	(141,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'311',2.00,11.00,3.00,12.00,0,0,0,0.10),
	(142,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'312',2.00,10.00,3.00,11.00,0,0,0,0.10),
	(143,'2016-11-01 12:27:13','2016-11-01 12:27:13',12,'332',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(144,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'420',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(145,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'402',0.00,4.00,1.00,5.00,0,0,0,0.10),
	(146,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'401',0.00,2.00,1.00,4.00,0,0,0,0.10),
	(147,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'403',0.00,5.00,1.00,7.00,0,0,0,0.10),
	(148,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'404',0.00,8.00,1.00,9.00,0,0,0,0.10),
	(149,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'406',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(150,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'403b',0.00,7.00,1.00,8.00,0,0,0,0.10),
	(151,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'405',0.00,9.00,1.00,10.00,0,0,0,0.10),
	(152,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'408',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(153,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'407',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(154,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'426',1.00,2.00,2.00,13.00,0,0,0,0.10),
	(155,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'417',2.00,2.00,3.00,3.00,0,0,0,0.10),
	(156,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'416',2.00,3.00,3.00,4.00,0,0,0,0.10),
	(157,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'415',2.00,4.00,3.00,5.00,0,0,0,0.10),
	(158,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'414',2.00,5.00,3.00,6.00,0,0,0,0.10),
	(159,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'413',2.00,6.00,3.00,8.00,0,0,0,0.10),
	(160,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'412',2.00,8.00,3.00,9.00,0,0,0,0.10),
	(161,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'411',2.00,9.00,3.00,10.00,0,0,0,0.10),
	(162,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'410',2.00,10.00,3.00,12.00,0,0,0,0.10),
	(163,'2016-11-01 12:29:40','2016-11-01 12:29:40',13,'425',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(164,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'529',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(165,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'502',0.00,3.00,1.00,4.00,0,0,0,0.10),
	(166,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'501',0.00,2.00,1.00,3.00,0,0,0,0.10),
	(167,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'504',0.00,6.00,1.00,7.00,0,0,0,0.10),
	(168,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'503',0.00,4.00,1.00,6.00,0,0,0,0.10),
	(169,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'504a',0.00,7.00,1.00,8.00,0,0,0,0.10),
	(170,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'505',0.00,8.00,1.00,9.00,0,0,0,0.10),
	(171,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'506',0.00,9.00,1.00,10.00,0,0,0,0.10),
	(172,'2016-11-01 12:32:33','2016-11-01 12:32:33',14,'507',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(173,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'508',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(174,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'527',1.00,2.00,2.00,13.00,0,0,0,0.10),
	(175,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'509',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(176,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'519',2.00,2.00,3.00,3.00,0,0,0,0.10),
	(177,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'518',2.00,3.00,3.00,4.00,0,0,0,0.10),
	(178,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'517',2.00,4.00,3.00,5.00,0,0,0,0.10),
	(179,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'516',2.00,5.00,3.00,6.00,0,0,0,0.10),
	(180,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'515',2.00,6.00,3.00,8.00,0,0,0,0.10),
	(181,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'514',2.00,8.00,3.00,9.00,0,0,0,0.10),
	(182,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'513',2.00,9.00,3.00,10.00,0,0,0,0.10),
	(183,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'512',2.00,10.00,3.00,11.00,0,0,0,0.10),
	(184,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'511',2.00,11.00,3.00,12.00,0,0,0,0.10),
	(185,'2016-11-01 12:32:34','2016-11-01 12:32:34',14,'526',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(186,'2016-11-01 12:36:35','2016-11-01 12:36:35',15,'602',0.00,3.00,1.00,4.00,0,0,0,0.10),
	(187,'2016-11-01 12:36:35','2016-11-01 12:36:35',15,'601',0.00,2.00,1.00,3.00,0,0,0,0.10),
	(188,'2016-11-01 12:36:35','2016-11-01 12:36:35',15,'626',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(189,'2016-11-01 12:36:35','2016-11-01 12:36:35',15,'602a',0.00,4.00,1.00,5.00,0,0,0,0.10),
	(190,'2016-11-01 12:36:35','2016-11-01 12:36:35',15,'603',0.00,6.00,1.00,7.00,0,0,0,0.10),
	(191,'2016-11-01 12:36:35','2016-11-01 12:36:35',15,'602b',0.00,5.00,1.00,6.00,0,0,0,0.10),
	(192,'2016-11-01 12:36:35','2016-11-01 12:36:35',15,'604',0.00,8.00,1.00,9.00,0,0,0,0.10),
	(193,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'603a',0.00,7.00,1.00,8.00,0,0,0,0.10),
	(194,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'604a',0.00,9.00,1.00,10.00,0,0,0,0.10),
	(195,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'604b',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(196,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'604c',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(197,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'604d',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(198,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'623',1.00,2.00,2.00,13.00,0,0,0,0.10),
	(199,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'612a',2.00,2.00,3.00,3.00,0,0,0,0.10),
	(200,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'612',2.00,3.00,3.00,4.00,0,0,0,0.10),
	(201,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'611',2.00,4.00,3.00,5.00,0,0,0,0.10),
	(202,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'610',2.00,5.00,3.00,6.00,0,0,0,0.10),
	(203,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'609',2.00,6.00,3.00,7.00,0,0,0,0.10),
	(204,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'608a',2.00,7.00,3.00,8.00,0,0,0,0.10),
	(205,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'608',2.00,8.00,3.00,9.00,0,0,0,0.10),
	(206,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'607',2.00,9.00,3.00,10.00,0,0,0,0.10),
	(207,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'606',2.00,10.00,3.00,11.00,0,0,0,0.10),
	(208,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'605',2.00,11.00,3.00,12.00,0,0,0,0.10),
	(209,'2016-11-01 12:36:36','2016-11-01 12:36:36',15,'605a',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(210,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'701',0.00,2.00,1.00,4.00,0,0,0,0.10),
	(211,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'702a',0.00,5.00,1.00,6.00,0,0,0,0.10),
	(212,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'728',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(213,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'702',0.00,4.00,1.00,5.00,0,0,0,0.10),
	(214,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'703a',0.00,7.00,1.00,8.00,0,0,0,0.10),
	(215,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'704',0.00,8.00,1.00,9.00,0,0,0,0.10),
	(216,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'705',0.00,9.00,1.00,10.00,0,0,0,0.10),
	(217,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'703',0.00,6.00,1.00,7.00,0,0,0,0.10),
	(218,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'707',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(219,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'706',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(220,'2016-11-01 12:39:48','2016-11-01 12:39:48',16,'708',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(221,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'729',1.00,2.00,2.00,13.00,0,0,0,0.10),
	(222,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'716',2.00,3.00,3.00,4.00,0,0,0,0.10),
	(223,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'717',2.00,2.00,3.00,3.00,0,0,0,0.10),
	(224,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'715',2.00,4.00,3.00,5.00,0,0,0,0.10),
	(225,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'714',2.00,5.00,3.00,6.00,0,0,0,0.10),
	(226,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'713a',2.00,6.00,3.00,7.00,0,0,0,0.10),
	(227,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'713',2.00,7.00,3.00,8.00,0,0,0,0.10),
	(228,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'712',2.00,8.00,3.00,9.00,0,0,0,0.10),
	(229,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'711',2.00,9.00,3.00,10.00,0,0,0,0.10),
	(230,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'710',2.00,10.00,3.00,12.00,0,0,0,0.10),
	(231,'2016-11-01 12:39:49','2016-11-01 12:39:49',16,'730',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(232,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'801',0.00,2.00,1.00,3.00,0,0,0,0.10),
	(233,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'802b',0.00,4.00,1.00,6.00,0,0,0,0.10),
	(234,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'802a',0.00,3.00,1.00,4.00,0,0,0,0.10),
	(235,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'826',0.00,0.00,3.00,2.00,0,0,0,0.10),
	(236,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'802d',0.00,8.00,1.00,9.00,0,0,0,0.10),
	(237,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'804',0.00,10.00,1.00,11.00,0,0,0,0.10),
	(238,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'803',0.00,9.00,1.00,10.00,0,0,0,0.10),
	(239,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'802c',0.00,6.00,1.00,8.00,0,0,0,0.10),
	(240,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'805',0.00,11.00,1.00,12.00,0,0,0,0.10),
	(241,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'806',0.00,12.00,1.00,13.00,0,0,0,0.10),
	(242,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'824',1.00,2.00,2.00,13.00,0,0,0,0.10),
	(243,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'815a',2.00,2.00,3.00,3.00,0,0,0,0.10),
	(244,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'815',2.00,3.00,3.00,4.00,0,0,0,0.10),
	(245,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'814',2.00,4.00,3.00,5.00,0,0,0,0.10),
	(246,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'813',2.00,5.00,3.00,6.00,0,0,0,0.10),
	(247,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'812',2.00,6.00,3.00,7.00,0,0,0,0.10),
	(248,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'811',2.00,7.00,3.00,8.00,0,0,0,0.10),
	(249,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'809',2.00,10.00,3.00,11.00,0,0,0,0.10),
	(250,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'810',2.00,8.00,3.00,10.00,0,0,0,0.10),
	(251,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'808',2.00,11.00,3.00,12.00,0,0,0,0.10),
	(252,'2016-11-01 12:42:43','2016-11-01 12:42:43',17,'823',2.00,12.00,3.00,13.00,0,0,0,0.10),
	(253,'2016-11-08 12:02:12','2016-11-08 12:02:12',18,'002',1.00,0.00,2.00,1.00,0,0,0,0.20),
	(254,'2016-11-08 12:02:12','2016-11-08 12:02:12',18,'001',0.00,0.00,1.00,2.00,0,0,0,0.20);

/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
