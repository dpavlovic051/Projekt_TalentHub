-- --------------------------------------------------------
-- Host:                         ucka.veleri.hr
-- Server version:               10.5.26-MariaDB-0+deb11u2 - Debian 11
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dpavlovic
CREATE DATABASE IF NOT EXISTS `dpavlovic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `dpavlovic`;

-- Dumping structure for table dpavlovic.freelanceri
CREATE TABLE IF NOT EXISTS `freelanceri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) DEFAULT NULL,
  `usluga` varchar(255) DEFAULT NULL,
  `kategorija_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dpavlovic.freelanceri: ~19 rows (approximately)
/*!40000 ALTER TABLE `freelanceri` DISABLE KEYS */;
REPLACE INTO `freelanceri` (`id`, `ime`, `usluga`, `kategorija_id`) VALUES
	(1, 'Ivan Horvat', 'Grafički dizajn', 2),
	(2, 'Ana Marić', 'Web razvoj', 1),
	(3, 'Marko Novak', 'Pisanje članaka', 3),
	(4, 'Lucija Petrović', 'Marketing na društvenim mrežama', 4),
	(5, 'Karlo Jurić', 'SEO optimizacija', 5),
	(6, 'Petra Kovač', 'Podrška Kupcima', 6),
	(7, 'Nikola Babić', 'Financijski Savjeti', 7),
	(8, 'Marina Šarić', 'Softversko Savjetovanje', 8),
	(9, 'Davor Perić', 'Dizajn kuća', 10),
	(10, 'Luka Marin', 'Grafički dizajn', 2),
	(11, 'Maja Radović', 'Grafički dizajn', 2),
	(12, 'Tomislav Novak', 'Web razvoj', 1),
	(13, 'Iva Šimić', 'Web razvoj', 1),
	(14, 'Mateo Grgić', 'Pisanje članaka', 3),
	(15, 'Lea Kovačević', 'Pisanje članaka', 3),
	(16, 'Bruno Jakšić', 'Marketing na društvenim mrežama', 4),
	(17, 'Doris Malenica', 'Marketing na društvenim mrežama', 4),
	(18, 'Filip Lovrić', 'SEO optimizacija', 5),
	(19, 'Andrea Barić', 'SEO optimizacija', 5);
/*!40000 ALTER TABLE `freelanceri` ENABLE KEYS */;

-- Dumping structure for table dpavlovic.kategorije
CREATE TABLE IF NOT EXISTS `kategorije` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dpavlovic.kategorije: ~9 rows (approximately)
/*!40000 ALTER TABLE `kategorije` DISABLE KEYS */;
REPLACE INTO `kategorije` (`id`, `naziv`) VALUES
	(1, 'Web Razvoj'),
	(2, 'Dizajn i Multimedija'),
	(3, 'Pisanje i Prevođenje'),
	(4, 'Marketing i Prodaja'),
	(5, 'SEO Optimizacija'),
	(6, 'Podrška Kupcima'),
	(7, 'Financijski Savjeti'),
	(8, 'Softversko Savjetovanje'),
	(10, 'Dizajn kuća');
/*!40000 ALTER TABLE `kategorije` ENABLE KEYS */;

-- Dumping structure for table dpavlovic.korisnici
CREATE TABLE IF NOT EXISTS `korisnici` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `lozinka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dpavlovic.korisnici: ~9 rows (approximately)
/*!40000 ALTER TABLE `korisnici` DISABLE KEYS */;
REPLACE INTO `korisnici` (`id`, `ime`, `email`, `lozinka`) VALUES
	(1, 'Maja Kovač', 'maja.kovac@example.com', 'password123'),
	(2, 'Petar Perić', 'petar.peric@example.com', 'password456'),
	(3, 'Ivana Babić', 'ivana.babic@example.com', 'password789'),
	(5, 'Giancarlo Mari', 'gmari@veleri.hr', 'gmari'),
	(6, 'Karlo Ilic', 'kilic@veleri.hr', 'kilic'),
	(7, 'Diego Pavlovic', 'dpavlovic@veleri.hr', 'dpavlovic'),
	(8, 'Kristijan Paulović', 'kpaulovic@veleri.hr', 'kiki'),
	(9, 'Noa Filipović', 'nfilipovic@mail.hr', 'noa'),
	(10, 'Marko', 'marko@mail.hr', 'lozinka');
/*!40000 ALTER TABLE `korisnici` ENABLE KEYS */;

-- Dumping structure for table dpavlovic.narudzbe
CREATE TABLE IF NOT EXISTS `narudzbe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `korisnik_id` int(11) DEFAULT NULL,
  `freelancer_id` int(11) NOT NULL,
  `opis_posla` text NOT NULL,
  `datum_vrijeme` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dpavlovic.narudzbe: ~0 rows (approximately)
/*!40000 ALTER TABLE `narudzbe` DISABLE KEYS */;
REPLACE INTO `narudzbe` (`id`, `korisnik_id`, `freelancer_id`, `opis_posla`, `datum_vrijeme`) VALUES
	(1, 7, 1, 'izrada promotivnog sadržaja', '2026-01-07 16:34:37'),
	(2, 7, 3, 'članak o firmi', '2026-01-07 16:35:59'),
	(3, 7, 2, 'stranica za prodaju odjeće', '2026-01-07 16:36:45');
/*!40000 ALTER TABLE `narudzbe` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
