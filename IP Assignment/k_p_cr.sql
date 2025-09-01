-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2025 at 04:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `k&p_cr`
--
CREATE DATABASE IF NOT EXISTS `k&p_cr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `k&p_cr`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `address_name` varchar(100) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `address_name`, `recipient_name`, `phone`, `address_line1`, `address_line2`, `city`, `state`, `post_code`, `country`, `is_default`, `created_at`, `updated_at`) VALUES
('AD001', 'CU001', 'Home', 'John Smith', '+60123456794', '123 Jalan Bukit Bintang', 'Pavilion Residence', 'Kuala Lumpur', 'Wilayah Persekutuan', '55100', 'Malaysia', 1, '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('AD002', 'CU002', 'Home', 'Sarah Johnson', '+60123456796', '456 Jalan Damansara', 'The Gardens', 'Petaling Jaya', 'Selangor', '46350', 'Malaysia', 1, '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('AD003', 'CU003', 'Home', 'Ahmad Ismail', '+60123456798', '789 Jalan Ampang', 'KLCC Residences', 'Kuala Lumpur', 'Wilayah Persekutuan', '50088', 'Malaysia', 1, '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('AD004', 'CU004', 'Office', 'Li Mei Chen', '+60123456800', '321 Jalan Tun Razak', 'Menara TM', 'Kuala Lumpur', 'Wilayah Persekutuan', '50400', 'Malaysia', 0, '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('AD005', 'CU004', 'Home', 'Li Mei Chen', '+60123456800', '654 Jalan SS2', 'Taman Bahagia', 'Petaling Jaya', 'Selangor', '47300', 'Malaysia', 1, '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('ADGINWEI', 'GINWEI22', 'Home', 'Gin Wei Lim', '+60123456999', '88 Jalan Technology', 'Cyberjaya Tech Hub', 'Cyberjaya', 'Selangor', '63000', 'Malaysia', 1, '2025-09-01 14:16:43', '2025-09-01 14:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_gender` enum('Male','Female','Other') DEFAULT NULL,
  `admin_phone` varchar(20) DEFAULT NULL,
  `admin_profile_pic` varchar(255) DEFAULT NULL,
  `admin_update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Active','Inactive','Banned') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `admin_gender`, `admin_phone`, `admin_profile_pic`, `admin_update_time`, `status`) VALUES
('AD001', 'System Administrator', 'admin@carrental.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.Mrq6PH.6U1JXzJYy7Dd7GFUj7z/s1G.', 'Male', '+60123456789', 'admin1.jpg', '2025-09-01 14:16:43', 'Active'),
('AD002', 'Gin Wei Manager', 'ginwei.manager@carrental.com', '$2a$10$M8oN7tKNjdgx1ZLRYnMx.Lqp5OH.5T0IYxJXy6Cc6DeGUi6y/r0F.', 'Male', '+60123456788', 'ginwei_admin.jpg', '2025-09-01 14:16:43', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `booking_insurance`
--

DROP TABLE IF EXISTS `booking_insurance`;
CREATE TABLE `booking_insurance` (
  `booking_id` varchar(255) NOT NULL,
  `insurance_id` varchar(255) NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  `total_days` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_insurance`
--

INSERT INTO `booking_insurance` (`booking_id`, `insurance_id`, `daily_rate`, `total_days`, `total_amount`) VALUES
('BK001', 'INS003', 50.00, 3, 150.00),
('BK002', 'INS001', 15.00, 3, 45.00),
('BK003', 'INS002', 35.00, 5, 175.00),
('BK004', 'INS001', 15.00, 3, 45.00),
('BK005', 'INS003', 50.00, 5, 250.00),
('BK006', 'INS002', 35.00, 5, 175.00),
('BK007', 'INS001', 15.00, 2, 30.00),
('BK008', 'INS001', 15.00, 4, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `booking_promotion`
--

DROP TABLE IF EXISTS `booking_promotion`;
CREATE TABLE `booking_promotion` (
  `booking_id` varchar(255) NOT NULL,
  `promotion_id` varchar(255) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_promotion`
--

INSERT INTO `booking_promotion` (`booking_id`, `promotion_id`, `discount_amount`) VALUES
('BK006', 'PR005', 238.13),
('BK007', 'PR004', 21.20);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `car_id` varchar(255) NOT NULL,
  `category_id` varchar(50) NOT NULL,
  `brand_id` varchar(50) NOT NULL,
  `car_model` varchar(255) NOT NULL,
  `car_year` int(11) NOT NULL,
  `car_color` varchar(100) DEFAULT NULL,
  `license_plate` varchar(20) NOT NULL,
  `car_pic1` varchar(255) DEFAULT NULL,
  `car_pic2` varchar(255) DEFAULT NULL,
  `car_pic3` varchar(255) DEFAULT NULL,
  `car_pic4` varchar(255) DEFAULT NULL,
  `car_pic5` varchar(255) DEFAULT NULL,
  `car_pic6` varchar(255) DEFAULT NULL,
  `car_description` text DEFAULT NULL,
  `current_mileage` int(11) DEFAULT 0,
  `transmission` enum('Manual','Automatic','CVT') NOT NULL,
  `fuel_type` enum('Petrol','Diesel','Hybrid','Electric') NOT NULL,
  `seating_capacity` int(11) NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  `weekly_rate` decimal(10,2) DEFAULT NULL,
  `monthly_rate` decimal(10,2) DEFAULT NULL,
  `mileage_limit_per_day` int(11) DEFAULT 200,
  `car_status` enum('Available','Rented','Maintenance','Retired') NOT NULL DEFAULT 'Available',
  `branch_location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `category_id`, `brand_id`, `car_model`, `car_year`, `car_color`, `license_plate`, `car_pic1`, `car_pic2`, `car_pic3`, `car_pic4`, `car_pic5`, `car_pic6`, `car_description`, `current_mileage`, `transmission`, `fuel_type`, `seating_capacity`, `daily_rate`, `weekly_rate`, `monthly_rate`, `mileage_limit_per_day`, `car_status`, `branch_location`, `created_at`) VALUES
('CAR001', 'CAT001', 'BR001', 'Vios', 2022, 'White', 'WMX1234', 'vios_1.jpg', 'vios_2.jpg', NULL, NULL, NULL, NULL, 'Fuel-efficient economy car perfect for city driving', 25400, 'Automatic', 'Petrol', 5, 89.00, 550.00, 2000.00, 200, 'Available', 'KLCC Branch', '2025-09-01 14:16:43'),
('CAR002', 'CAT001', 'BR002', 'City', 2023, 'Silver', 'WJH5678', 'city_1.jpg', 'city_2.jpg', NULL, NULL, NULL, NULL, 'Compact and reliable city car', 18200, 'Automatic', 'Petrol', 5, 85.00, 520.00, 1900.00, 200, 'Available', 'KLCC Branch', '2025-09-01 14:16:43'),
('CAR003', 'CAT002', 'BR001', 'Corolla', 2022, 'Black', 'WKL9012', 'corolla_1.jpg', 'corolla_2.jpg', NULL, NULL, NULL, NULL, 'Popular compact sedan with excellent fuel economy', 32100, 'Automatic', 'Petrol', 5, 110.00, 700.00, 2500.00, 200, 'Available', 'Subang Branch', '2025-09-01 14:16:43'),
('CAR004', 'CAT002', 'BR002', 'Civic', 2023, 'Blue', 'WPJ3456', 'civic_1.jpg', 'civic_2.jpg', NULL, NULL, NULL, NULL, 'Sporty and efficient compact car', 15800, 'Automatic', 'Petrol', 5, 115.00, 750.00, 2700.00, 200, 'Available', 'KLCC Branch', '2025-09-01 14:16:43'),
('CAR005', 'CAT003', 'BR003', 'Altima', 2022, 'Red', 'WBD7890', 'altima_1.jpg', 'altima_2.jpg', NULL, NULL, NULL, NULL, 'Comfortable mid-size sedan for longer journeys', 28750, 'CVT', 'Petrol', 5, 140.00, 900.00, 3200.00, 200, 'Available', 'Subang Branch', '2025-09-01 14:16:43'),
('CAR006', 'CAT003', 'BR004', 'Mazda6', 2023, 'White', 'WLM2345', 'mazda6_1.jpg', 'mazda6_2.jpg', NULL, NULL, NULL, NULL, 'Premium mid-size sedan with elegant design', 12300, 'Automatic', 'Petrol', 5, 150.00, 980.00, 3500.00, 200, 'Available', 'Penang Branch', '2025-09-01 14:16:43'),
('CAR007', 'CAT005', 'BR001', 'RAV4', 2022, 'Silver', 'WSL6789', 'rav4_1.jpg', 'rav4_2.jpg', NULL, NULL, NULL, NULL, 'Reliable SUV perfect for family adventures', 35200, 'Automatic', 'Petrol', 7, 180.00, 1200.00, 4200.00, 200, 'Available', 'KLCC Branch', '2025-09-01 14:16:43'),
('CAR008', 'CAT005', 'BR002', 'CR-V', 2023, 'Black', 'WTM0123', 'crv_1.jpg', 'crv_2.jpg', NULL, NULL, NULL, NULL, 'Spacious and comfortable family SUV', 21500, 'CVT', 'Hybrid', 7, 190.00, 1300.00, 4500.00, 200, 'Available', 'Subang Branch', '2025-09-01 14:16:43'),
('CAR009', 'CAT006', 'BR006', '3 Series', 2023, 'Blue', 'WFN4567', 'bmw3_1.jpg', 'bmw3_2.jpg', NULL, NULL, NULL, NULL, 'Luxury sports sedan for premium experience', 8900, 'Automatic', 'Petrol', 5, 280.00, 1800.00, 6500.00, 200, 'Available', 'KLCC Branch', '2025-09-01 14:16:43'),
('CAR010', 'CAT006', 'BR007', 'C-Class', 2022, 'White', 'WGH8901', 'cclass_1.jpg', 'cclass_2.jpg', NULL, NULL, NULL, NULL, 'Elegant luxury sedan with premium features', 19400, 'Automatic', 'Petrol', 5, 300.00, 2000.00, 7200.00, 200, 'Available', 'KLCC Branch', '2025-09-01 14:16:43'),
('CAR011', 'CAT007', 'BR001', 'Innova', 2022, 'Grey', 'WRT2468', 'innova_1.jpg', 'innova_2.jpg', NULL, NULL, NULL, NULL, 'Spacious 8-seater MPV for large families', 42600, 'Automatic', 'Diesel', 8, 160.00, 1050.00, 3800.00, 200, 'Available', 'Subang Branch', '2025-09-01 14:16:43'),
('CAR012', 'CAT004', 'BR005', 'Sonata', 2023, 'Black', 'WPS1357', 'sonata_1.jpg', 'sonata_2.jpg', NULL, NULL, NULL, NULL, 'Full-size sedan with premium comfort', 14200, 'Automatic', 'Petrol', 5, 170.00, 1100.00, 4000.00, 200, 'Available', 'Penang Branch', '2025-09-01 14:16:43'),
('CAR013', 'CAT005', 'BR003', 'X-Trail', 2022, 'Blue', 'WQT3691', 'xtrail_1.jpg', 'xtrail_2.jpg', NULL, NULL, NULL, NULL, 'Adventure-ready SUV with all-terrain capability', 29800, 'CVT', 'Petrol', 7, 185.00, 1250.00, 4300.00, 200, 'Available', 'KLCC Branch', '2025-09-01 14:16:43'),
('CAR014', 'CAT001', 'BR005', 'i10', 2023, 'Red', 'WKM8024', 'i10_1.jpg', 'i10_2.jpg', NULL, NULL, NULL, NULL, 'Compact city car perfect for urban commuting', 11700, 'Manual', 'Petrol', 5, 75.00, 480.00, 1750.00, 200, 'Available', 'Subang Branch', '2025-09-01 14:16:43'),
('CAR015', 'CAT006', 'BR008', 'A4', 2023, 'Silver', 'WLN4682', 'a4_1.jpg', 'a4_2.jpg', NULL, NULL, NULL, NULL, 'Luxury sedan with advanced technology', 6800, 'Automatic', 'Petrol', 5, 290.00, 1900.00, 6800.00, 200, 'Available', 'KLCC Branch', '2025-09-01 14:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `car_brand`
--

DROP TABLE IF EXISTS `car_brand`;
CREATE TABLE `car_brand` (
  `brand_id` varchar(50) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_brand`
--

INSERT INTO `car_brand` (`brand_id`, `brand_name`, `brand_logo`) VALUES
('BR001', 'Toyota', 'toyota_logo.png'),
('BR002', 'Honda', 'honda_logo.png'),
('BR003', 'Nissan', 'nissan_logo.png'),
('BR004', 'Mazda', 'mazda_logo.png'),
('BR005', 'Hyundai', 'hyundai_logo.png'),
('BR006', 'BMW', 'bmw_logo.png'),
('BR007', 'Mercedes-Benz', 'mercedes_logo.png'),
('BR008', 'Audi', 'audi_logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `car_category`
--

DROP TABLE IF EXISTS `car_category`;
CREATE TABLE `car_category` (
  `category_id` varchar(50) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_category`
--

INSERT INTO `car_category` (`category_id`, `category_name`, `description`) VALUES
('CAT001', 'Economy', 'Budget-friendly compact cars for city driving'),
('CAT002', 'Compact', 'Small to medium cars perfect for urban travel'),
('CAT003', 'Mid-size', 'Comfortable mid-size vehicles for longer trips'),
('CAT004', 'Full-size', 'Spacious full-size cars for premium comfort'),
('CAT005', 'SUV', 'Sport Utility Vehicles for adventure and family trips'),
('CAT006', 'Luxury', 'Premium luxury vehicles for special occasions'),
('CAT007', 'Van/MPV', 'Multi-purpose vehicles for large groups');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` varchar(255) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_gender` enum('Male','Female','Other') DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `customer_profile_pic` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `driving_license_number` varchar(50) DEFAULT NULL,
  `license_expiry_date` date DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_phone` varchar(20) DEFAULT NULL,
  `customer_update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Active','Inactive','Banned') NOT NULL DEFAULT 'Inactive',
  `membership_level` enum('Bronze','Silver','Gold','Platinum') DEFAULT 'Bronze',
  `total_bookings` int(11) DEFAULT 0,
  `loyalty_points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_gender`, `customer_phone`, `customer_profile_pic`, `date_of_birth`, `driving_license_number`, `license_expiry_date`, `emergency_contact_name`, `emergency_contact_phone`, `customer_update_time`, `status`, `membership_level`, `total_bookings`, `loyalty_points`) VALUES
('CU001', 'John Smith', 'john.smith@email.com', '$2a$10$3mXq7k.T9Uo5Z5J8r7vZUeW5v5X5J8r7vZUeW5v5X5J8r7vZUeW5v', 'Male', '+60123456794', 'john.jpg', '1988-12-10', 'D11111111', '2026-12-10', 'Mary Smith', '+60123456795', '2025-09-01 14:16:43', 'Active', 'Silver', 5, 250),
('CU002', 'Sarah Johnson', 'sarah.johnson@email.com', '$2a$10$4nXr8l.U0Vp6A6K9s8wAVfX6w6Y6K9s8wAVfX6w6Y6K9s8wAVfX6w', 'Female', '+60123456796', 'sarah.jpg', '1992-03-25', 'D22222222', '2027-03-25', 'Robert Johnson', '+60123456797', '2025-09-01 14:16:43', 'Active', 'Gold', 8, 480),
('CU003', 'Ahmad Ismail', 'ahmad.ismail@email.com', '$2a$10$5oYs9m.V1Wq7B7L0t9xBWgY7x7Z7L0t9xBWgY7x7Z7L0t9xBWgY7x', 'Male', '+60123456798', 'ahmad.jpg', '1985-07-18', 'D33333333', '2026-07-18', 'Fatimah Ahmad', '+60123456799', '2025-09-01 14:16:43', 'Active', 'Bronze', 2, 80),
('CU004', 'Li Mei Chen', 'limei@email.com', '$2a$10$6pZt0n.W2Xr8C8M1u0yCV hY8y8A8M1u0yCVhY8y8A8M1u0yCVhY8y', 'Female', '+60123456800', 'limei.jpg', '1990-11-05', 'D44444444', '2028-11-05', 'Chen Wei Ming', '+60123456801', '2025-09-01 14:16:43', 'Active', 'Platinum', 12, 1200),
('CU005', 'Raj Patel', 'raj.patel@email.com', '$2a$10$7qAu1o.X3Ys9D9N2v1zDWiZ9z9B9N2v1zDWiZ9z9B9N2v1zDWiZ9z', 'Male', '+60123456802', 'rajpatel.jpg', '1987-09-22', 'D55555555', '2025-09-22', 'Priya Patel', '+60123456803', '2025-09-01 14:16:43', 'Active', 'Bronze', 1, 30),
('GINWEI22', 'Gin Wei Lim', 'ginwei22@email.com', '$2a$10$GinWei22Password123Hash456789', 'Male', '+60123456999', 'ginwei22.jpg', '1995-06-22', 'DGINWEI22', '2027-06-22', 'Lim Family', '+60123456998', '2025-09-01 14:16:43', 'Active', 'Gold', 3, 350);

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance` (
  `insurance_id` varchar(255) NOT NULL,
  `insurance_name` varchar(255) NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  `coverage_amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insurance_id`, `insurance_name`, `daily_rate`, `coverage_amount`, `description`, `status`) VALUES
('INS001', 'Basic Coverage', 15.00, 50000.00, 'Basic third-party insurance coverage', 'Active'),
('INS002', 'Comprehensive Coverage', 35.00, 150000.00, 'Full comprehensive insurance with theft protection', 'Active'),
('INS003', 'Premium Coverage', 50.00, 300000.00, 'Premium coverage with zero excess', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_record`
--

DROP TABLE IF EXISTS `maintenance_record`;
CREATE TABLE `maintenance_record` (
  `maintenance_id` varchar(255) NOT NULL,
  `car_id` varchar(255) NOT NULL,
  `maintenance_type` enum('Scheduled','Repair','Inspection','Cleaning') NOT NULL,
  `description` text DEFAULT NULL,
  `maintenance_date` date NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `mechanic_name` varchar(255) DEFAULT NULL,
  `next_maintenance_date` date DEFAULT NULL,
  `status` enum('Completed','In_Progress','Scheduled') DEFAULT 'Scheduled',
  `assigned_to_staff` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance_record`
--

INSERT INTO `maintenance_record` (`maintenance_id`, `car_id`, `maintenance_type`, `description`, `maintenance_date`, `cost`, `mechanic_name`, `next_maintenance_date`, `status`, `assigned_to_staff`) VALUES
('MR001', 'CAR001', 'Cleaning', 'Post-rental deep cleaning', '2025-08-19', 80.00, 'Cleaning Team', NULL, 'Completed', 'ST001'),
('MR002', 'CAR007', 'Inspection', 'Post-rental inspection', '2025-08-16', 50.00, 'Rahman Mechanic', NULL, 'Completed', 'ST003'),
('MR003', 'CAR009', 'Cleaning', 'Luxury car detailing', '2025-08-24', 150.00, 'Premium Detail Team', NULL, 'Completed', 'ST003'),
('MR004', 'CAR003', 'Scheduled', 'Scheduled for post-rental check', '2025-09-02', 0.00, 'Kumar Mechanic', NULL, 'Scheduled', 'ST003'),
('MR005', 'CAR011', 'Repair', 'Replace brake pads', '2025-08-20', 280.00, 'Siti Mechanic', NULL, 'Completed', 'ST003');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` varchar(255) NOT NULL,
  `booking_id` varchar(255) NOT NULL,
  `payment_type` enum('Booking','Security_Deposit','Additional_Charges','Refund') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Credit Card','Debit Card','PayPal','Bank Transfer','Cash') NOT NULL,
  `payment_status` enum('Pending','Completed','Failed','Refunded') NOT NULL DEFAULT 'Pending',
  `payment_date` datetime DEFAULT current_timestamp(),
  `transaction_reference` varchar(255) DEFAULT NULL,
  `processed_by_staff` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `booking_id`, `payment_type`, `amount`, `payment_method`, `payment_status`, `payment_date`, `transaction_reference`, `processed_by_staff`) VALUES
('PY001', 'BK001', 'Booking', 1049.40, 'Credit Card', 'Completed', '2025-08-19 10:30:00', 'TXNGINWEI001', 'ST001'),
('PY002', 'BK002', 'Booking', 330.72, 'PayPal', 'Completed', '2025-08-14 14:15:00', 'PP987654321', 'ST001'),
('PY003', 'BK003', 'Booking', 1139.50, 'Credit Card', 'Completed', '2025-08-09 16:45:00', 'TXN001234568', 'ST001'),
('PY004', 'BK004', 'Booking', 397.50, 'Bank Transfer', 'Completed', '2025-08-29 09:20:00', 'BT123456789', 'ST002'),
('PY005', 'BK005', 'Booking', 1855.00, 'Credit Card', 'Completed', '2025-09-01 11:00:00', 'TXN001234570', 'ST001'),
('PY006', 'BK006', 'Booking', 1192.50, 'Credit Card', 'Pending', '2025-09-01 14:05:00', 'TXNGINWEI002', 'ST002'),
('PY007', 'BK007', 'Booking', 212.00, 'PayPal', 'Completed', '2025-09-01 13:30:00', 'PP123789456', 'ST004'),
('PY008', 'BK008', 'Booking', 551.20, 'Credit Card', 'Pending', '2025-09-01 14:09:00', 'TXN001234571', 'ST001');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion` (
  `promotion_id` varchar(255) NOT NULL,
  `promotion_code` varchar(50) NOT NULL,
  `promotion_name` varchar(255) NOT NULL,
  `discount_type` enum('Percentage','Fixed_Amount') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `minimum_days` int(11) DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used_count` int(11) DEFAULT 0,
  `status` enum('Active','Inactive','Expired') NOT NULL DEFAULT 'Active',
  `created_by_admin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotion_id`, `promotion_code`, `promotion_name`, `discount_type`, `discount_value`, `minimum_days`, `start_date`, `end_date`, `usage_limit`, `used_count`, `status`, `created_by_admin`) VALUES
('PR001', 'WELCOME20', 'Welcome Discount', 'Percentage', 20.00, 3, '2025-01-01', '2025-12-31', 1000, 0, 'Active', 'AD001'),
('PR002', 'WEEKEND50', 'Weekend Special', 'Fixed_Amount', 50.00, 2, '2025-09-01', '2025-12-31', 500, 0, 'Active', 'AD002'),
('PR003', 'LONGTERM15', 'Long Term Discount', 'Percentage', 15.00, 7, '2025-01-01', '2025-12-31', 200, 0, 'Active', 'AD002'),
('PR004', 'SEPTEMBER10', 'September Special', 'Percentage', 10.00, 1, '2025-09-01', '2025-09-30', 300, 0, 'Active', 'AD001'),
('PR005', 'LOYALTY25', 'Gold Member Discount', 'Percentage', 25.00, 3, '2025-09-01', '2025-12-31', 100, 0, 'Active', 'AD001');

-- --------------------------------------------------------

--
-- Table structure for table `rental_booking`
--

DROP TABLE IF EXISTS `rental_booking`;
CREATE TABLE `rental_booking` (
  `booking_id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `car_id` varchar(255) NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `return_location` varchar(255) NOT NULL,
  `booking_status` enum('Pending','Confirmed','Active','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `total_days` int(11) NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `insurance_fee` decimal(10,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `mileage_start` int(11) DEFAULT 0,
  `mileage_end` int(11) DEFAULT 0,
  `fuel_level_start` varchar(20) DEFAULT NULL,
  `fuel_level_end` varchar(20) DEFAULT NULL,
  `damage_report` text DEFAULT NULL,
  `processed_by_staff` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rental_booking`
--

INSERT INTO `rental_booking` (`booking_id`, `customer_id`, `car_id`, `pickup_date`, `return_date`, `pickup_location`, `return_location`, `booking_status`, `total_days`, `daily_rate`, `subtotal`, `insurance_fee`, `tax_amount`, `total_amount`, `mileage_start`, `mileage_end`, `fuel_level_start`, `fuel_level_end`, `damage_report`, `processed_by_staff`, `created_at`, `updated_at`) VALUES
('BK001', 'GINWEI22', 'CAR009', '2025-08-20', '2025-08-23', 'KLCC Branch', 'KLCC Branch', 'Completed', 3, 280.00, 840.00, 150.00, 59.40, 1049.40, 8700, 9100, 'Full', 'Three-Quarter', NULL, 'ST001', '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('BK002', 'CU001', 'CAR001', '2025-08-15', '2025-08-18', 'KLCC Branch', 'KLCC Branch', 'Completed', 3, 89.00, 267.00, 45.00, 18.72, 330.72, 25000, 25400, 'Full', 'Half', NULL, 'ST001', '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('BK003', 'CU002', 'CAR007', '2025-08-10', '2025-08-15', 'KLCC Branch', 'KLCC Branch', 'Completed', 5, 180.00, 900.00, 175.00, 64.50, 1139.50, 34800, 35200, 'Full', 'Full', NULL, 'ST001', '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('BK004', 'CU003', 'CAR003', '2025-08-30', '2025-09-02', 'Subang Branch', 'Subang Branch', 'Active', 3, 110.00, 330.00, 45.00, 22.50, 397.50, 31800, 0, 'Full', NULL, NULL, 'ST002', '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('BK005', 'CU004', 'CAR010', '2025-09-05', '2025-09-10', 'KLCC Branch', 'KLCC Branch', 'Confirmed', 5, 300.00, 1500.00, 250.00, 105.00, 1855.00, 0, 0, NULL, NULL, NULL, 'ST001', '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('BK006', 'GINWEI22', 'CAR008', '2025-09-15', '2025-09-20', 'Subang Branch', 'Subang Branch', 'Confirmed', 5, 190.00, 950.00, 175.00, 67.50, 1192.50, 0, 0, NULL, NULL, NULL, 'ST002', '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('BK007', 'CU005', 'CAR002', '2025-09-25', '2025-09-27', 'KLCC Branch', 'KLCC Branch', 'Confirmed', 2, 85.00, 170.00, 30.00, 12.00, 212.00, 0, 0, NULL, NULL, NULL, 'ST004', '2025-09-01 14:16:43', '2025-09-01 14:16:43'),
('BK008', 'CU001', 'CAR004', '2025-10-01', '2025-10-05', 'KLCC Branch', 'KLCC Branch', 'Pending', 4, 115.00, 460.00, 60.00, 31.20, 551.20, 0, 0, NULL, NULL, NULL, 'ST001', '2025-09-01 14:16:43', '2025-09-01 14:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` varchar(255) NOT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_email` varchar(255) NOT NULL,
  `staff_password` varchar(255) NOT NULL,
  `staff_gender` enum('Male','Female','Other') DEFAULT NULL,
  `staff_phone` varchar(20) DEFAULT NULL,
  `staff_profile_pic` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `branch_location` varchar(255) DEFAULT NULL,
  `staff_update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Active','Inactive','Suspended') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `staff_email`, `staff_password`, `staff_gender`, `staff_phone`, `staff_profile_pic`, `department`, `position`, `hire_date`, `salary`, `branch_location`, `staff_update_time`, `status`) VALUES
('ST001', 'Ahmad Rahman', 'ahmad@carrental.com', '$2a$10$VE0tR5c5QlUgDZQZP1YrE.7ZJQ9Xz3JjZr3Jk6d1JvQmY9Jh5r1XO', 'Male', '+60123456790', 'staff1.jpg', 'Customer Service', 'Senior Associate', '2023-01-15', 3500.00, 'KLCC Branch', '2025-09-01 14:16:43', 'Active'),
('ST002', 'Siti Nurhaliza', 'siti@carrental.com', '$2a$10$WF1uS6d6RmVhEaQ0Q2ZsF.8aKR.6U1JYxKZy8Ed8HGVj8Kj6s2YP.', 'Female', '+60123456791', 'staff2.jpg', 'Operations', 'Branch Supervisor', '2022-06-20', 4200.00, 'Subang Branch', '2025-09-01 14:16:43', 'Active'),
('ST003', 'Raj Kumar', 'raj@carrental.com', '$2a$10$XG2vT7e7SnWiGbR1R3AtG.9bLS.7V2KZyLaZ9Fe9IGWk9Lk7t3ZQ.', 'Male', '+60123456792', 'staff3.jpg', 'Maintenance', 'Lead Technician', '2023-03-10', 3800.00, 'Penang Branch', '2025-09-01 14:16:43', 'Active'),
('ST004', 'Lim Wei Ting', 'weiting@carrental.com', '$2a$10$YH3wU8f8ToXjHcS2S4BuH.0cMT.8W3LazMbA0Gf0JHXl0Ml8u4AR.', 'Female', '+60123456793', 'staff4.jpg', 'Customer Service', 'Associate', '2024-01-08', 2800.00, 'KLCC Branch', '2025-09-01 14:16:43', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_type` enum('admin','staff','customer') NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `type` enum('email_verification','password_reset') DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`);

--
-- Indexes for table `booking_insurance`
--
ALTER TABLE `booking_insurance`
  ADD PRIMARY KEY (`booking_id`,`insurance_id`),
  ADD KEY `insurance_id` (`insurance_id`);

--
-- Indexes for table `booking_promotion`
--
ALTER TABLE `booking_promotion`
  ADD PRIMARY KEY (`booking_id`,`promotion_id`),
  ADD KEY `promotion_id` (`promotion_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `car_brand`
--
ALTER TABLE `car_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `car_category`
--
ALTER TABLE `car_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indexes for table `maintenance_record`
--
ALTER TABLE `maintenance_record`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `assigned_to_staff` (`assigned_to_staff`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `processed_by_staff` (`processed_by_staff`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`),
  ADD UNIQUE KEY `promotion_code` (`promotion_code`),
  ADD KEY `created_by_admin` (`created_by_admin`);

--
-- Indexes for table `rental_booking`
--
ALTER TABLE `rental_booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `processed_by_staff` (`processed_by_staff`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_email` (`staff_email`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `booking_insurance`
--
ALTER TABLE `booking_insurance`
  ADD CONSTRAINT `booking_insurance_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `rental_booking` (`booking_id`),
  ADD CONSTRAINT `booking_insurance_ibfk_2` FOREIGN KEY (`insurance_id`) REFERENCES `insurance` (`insurance_id`);

--
-- Constraints for table `booking_promotion`
--
ALTER TABLE `booking_promotion`
  ADD CONSTRAINT `booking_promotion_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `rental_booking` (`booking_id`),
  ADD CONSTRAINT `booking_promotion_ibfk_2` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `car_category` (`category_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `car_brand` (`brand_id`);

--
-- Constraints for table `maintenance_record`
--
ALTER TABLE `maintenance_record`
  ADD CONSTRAINT `maintenance_record_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `maintenance_record_ibfk_2` FOREIGN KEY (`assigned_to_staff`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `rental_booking` (`booking_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`processed_by_staff`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`created_by_admin`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `rental_booking`
--
ALTER TABLE `rental_booking`
  ADD CONSTRAINT `rental_booking_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `rental_booking_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `rental_booking_ibfk_3` FOREIGN KEY (`processed_by_staff`) REFERENCES `staff` (`staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
