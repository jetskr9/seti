CREATE DATABASE  IF NOT EXISTS `seti` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `seti`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: seti
-- ------------------------------------------------------
-- Server version	5.7.4-m14-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `USERID` varchar(145) DEFAULT NULL,
  `TOTAL_CREDIT` decimal(10,0) DEFAULT NULL,
  `EXPAVG_CREDIT` decimal(10,0) DEFAULT NULL,
  `EXPAVG_TIME` double DEFAULT NULL,
  `P_VENDOR` mediumtext,
  `P_MODEL` mediumtext,
  `OS_NAME` varchar(145) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `OS_VERSION` varchar(145) DEFAULT NULL,
  `CREATE_TIME` double DEFAULT NULL,
  `RPC_TIME` varchar(150) DEFAULT NULL,
  `TIMEZONE` double DEFAULT NULL,
  `NCPUS` int(10) unsigned DEFAULT NULL,
  `P_FPOPS` mediumtext,
  `P_IOPS` mediumtext,
  `P_MEMBW` mediumtext,
  `M_NBYTES` mediumtext,
  `M_CACHE` mediumtext,
  `M_SWAP` mediumtext,
  `D_TOTAL` mediumtext,
  `D_FREE` mediumtext,
  `N_BWUP` double DEFAULT NULL,
  `N_BWDOWN` double DEFAULT NULL,
  `AVG_TURNAROUND` double DEFAULT NULL,
  `HOST_CPID` varchar(145) DEFAULT NULL,
  `id_project` int(10) unsigned NOT NULL,
  `NAME` mediumtext,
  `COUNTRY` mediumtext,
  `credit_per_cpu_sec` mediumtext,
  `factors` mediumtext,
  PRIMARY KEY (`ID`,`id_project`),
  KEY `FK_hosts_1` (`USERID`),
  KEY `FK_hosts_2` (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `optout`
--

DROP TABLE IF EXISTS `optout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optout` (
  `optoutid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`optoutid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `UPDATE_TIME` mediumtext NOT NULL,
  `NUSERS_TOTAL` mediumtext NOT NULL,
  `NTEAM_TOTAL` mediumtext NOT NULL,
  `NHOSTS_TOTAL` mediumtext NOT NULL,
  `TOTAL_CREDIT` mediumtext NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_project` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`id_project`),
  KEY `FK_project_1` (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_nh`
--

DROP TABLE IF EXISTS `project_nh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_nh` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LastUpdate` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL,
  `StatsUrl` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1',
  `InactiveDate` datetime DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_updates_nh`
--

DROP TABLE IF EXISTS `project_updates_nh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_updates_nh` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Project_id` int(11) DEFAULT NULL,
  `LastBatchUpdate` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `TotalUsers` int(10) unsigned DEFAULT NULL,
  `TotalTeams` int(10) unsigned DEFAULT NULL,
  `TotalHosts` int(10) unsigned DEFAULT NULL,
  `TotalCredits` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Project_id` (`Project_id`),
  CONSTRAINT `FK334C8701C0B57E60` FOREIGN KEY (`Project_id`) REFERENCES `project_nh` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id_project` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_update` varchar(145) NOT NULL,
  `name` varchar(145) NOT NULL,
  `url` varchar(145) NOT NULL,
  `statsUrl` mediumtext NOT NULL,
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `TYPE` int(11) DEFAULT '0',
  `NAME` mediumtext,
  `USERID` mediumtext,
  `TOTAL_CREDIT` decimal(10,0) DEFAULT '0',
  `EXPAVG_CREDIT` decimal(10,0) DEFAULT '0',
  `EXPAVG_TIME` double DEFAULT '0',
  `NUSERS` longtext,
  `FOUNDER_NAME` mediumtext,
  `CREATE_TIME` int(10) unsigned DEFAULT NULL,
  `NAME_HTML` mediumtext,
  `DESCRIPTION` mediumtext,
  `COUNTRY` varchar(145) DEFAULT 'None',
  `URL` mediumtext,
  `id_project` int(10) unsigned NOT NULL,
  `FACTORS` mediumtext,
  PRIMARY KEY (`ID`,`id_project`),
  KEY `FK_teams_1` (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_nh`
--

DROP TABLE IF EXISTS `user_nh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_nh` (
  `Id` char(32) NOT NULL,
  `ProjectId` int(11) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Name` mediumtext,
  `CreateTime` int(10) unsigned DEFAULT NULL,
  `TotalCredit` decimal(19,5) DEFAULT NULL,
  `ExpAvgCredit` decimal(19,5) DEFAULT NULL,
  `ExpAvgTime` decimal(19,5) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL,
  `Factors` varchar(255) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `TeamId` int(10) unsigned DEFAULT NULL,
  `HasProfile` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `NAME` mediumtext,
  `COUNTRY` mediumtext,
  `CREATE_TIME` double DEFAULT NULL,
  `TOTAL_CREDIT` decimal(10,0) DEFAULT NULL,
  `EXPAVG_CREDIT` decimal(10,0) DEFAULT NULL,
  `EXPAVG_TIME` double DEFAULT NULL,
  `CPID` varchar(145) DEFAULT NULL,
  `TEAMID` int(11) DEFAULT NULL,
  `URL` mediumtext,
  `id_project` int(10) unsigned NOT NULL,
  `FACTORS` mediumtext,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`id_project`),
  KEY `FK_users_1` (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-11  9:57:43
