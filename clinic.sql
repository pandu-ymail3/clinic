-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 03, 2024 at 06:26 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `appointment_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` bigint UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'booked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `appointments_patient_id_foreign` (`patient_id`),
  KEY `appointments_doctor_id_foreign` (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_id`, `date`, `time`, `status`, `created_at`, `updated_at`) VALUES
(11, 3, 4, '2024-10-11', '12:09:00', 'cancelled', '2024-10-03 11:09:45', '2024-10-03 12:42:54'),
(10, 6, 1, '2024-10-23', '22:11:00', 'booked', '2024-10-03 11:09:14', '2024-10-03 11:09:14'),
(9, 5, 1, '2024-10-15', '12:08:00', 'booked', '2024-10-03 11:08:39', '2024-10-03 11:08:39'),
(4, 1, 1, '2024-10-05', '10:00:00', 'booked', NULL, NULL),
(5, 2, 2, '2024-10-06', '11:00:00', 'booked', NULL, NULL),
(6, 3, 3, '2024-10-07', '12:00:00', 'completed', NULL, NULL),
(7, 4, 4, '2024-10-08', '14:00:00', 'cancelled', NULL, NULL),
(8, 5, 5, '2024-10-09', '15:00:00', 'booked', NULL, NULL),
(12, 5, 5, '2024-10-09', '22:13:00', 'booked', '2024-10-03 11:10:17', '2024-10-03 11:10:17'),
(13, 7, 5, '2024-10-16', '22:27:00', 'booked', '2024-10-03 11:11:14', '2024-10-03 11:11:14'),
(14, 1, 1, '2024-10-17', '23:35:00', 'booked', '2024-10-03 12:32:06', '2024-10-03 12:32:06'),
(15, 3, 1, '2024-10-16', '23:43:00', 'booked', '2024-10-03 12:39:03', '2024-10-03 12:39:03'),
(16, 1, 1, '2024-10-19', '23:43:00', 'booked', '2024-10-03 12:40:15', '2024-10-03 12:40:15'),
(17, 1, 3, '2024-10-15', '23:45:00', 'booked', '2024-10-03 12:42:29', '2024-10-03 12:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_information` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `specialization`, `contact_information`, `created_at`, `updated_at`) VALUES
(1, 'Dr Pavan Kumar', 'MBBS', 'Hyderabad', '2024-10-03 09:00:15', '2024-10-03 09:00:54'),
(2, 'Dr. Anil Mehta', 'Cardiology', '9876543215', NULL, NULL),
(3, 'Dr. Sunita Rao', 'Dermatology', '9876543216', NULL, NULL),
(4, 'Dr. Rakesh Yadav', 'Orthopedics', '9876543217', NULL, NULL),
(5, 'Dr. Kavita Sharma', 'Gynecology', '9876543218', NULL, NULL),
(6, 'Dr. Mohan Iyer', 'Pediatrics', '9876543219', NULL, NULL),
(7, 'Rama krishna', 'General', 'Hyderabad', '2024-10-03 12:44:39', '2024-10-03 12:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `log_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` bigint UNSIGNED NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `logs_appointment_id_foreign` (`appointment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `appointment_id`, `action`, `timestamp`) VALUES
(1, 17, 'Appointment Created', '2024-10-03 18:12:29'),
(2, 11, 'Appointment Cancelled', '2024-10-03 18:12:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_10_03_094456_create_patients_table', 1),
(2, '2024_10_03_111052_create_doctors_table', 2),
(3, '2024_10_03_143613_create_appointments_table', 3),
(4, '2024_10_03_164332_create_logs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_information` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `age`, `gender`, `contact_information`, `created_at`, `updated_at`) VALUES
(1, 'Praveen', 22, 'male', 'Hyderabad', '2024-10-03 04:59:57', '2024-10-03 04:59:57'),
(2, 'prakash', 23, 'male', 'Hyderabad', '2024-10-03 05:05:34', '2024-10-03 05:05:34'),
(3, 'Amit Sharma', 35, 'male', '9876543210', NULL, NULL),
(4, 'Priya Verma', 28, 'female', '9876543211', NULL, NULL),
(5, 'Rajesh Kumar', 42, 'male', '9876543212', NULL, NULL),
(6, 'Meena Patel', 30, 'female', '9876543213', NULL, NULL),
(7, 'Sanjay Gupta', 50, 'male', '9876543214', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
