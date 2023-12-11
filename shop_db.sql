-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: dec. 11, 2023 la 12:36 PM
-- Versiune server: 10.4.28-MariaDB
-- Versiune PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `shop_db`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '12345678');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `aragaz`
--

CREATE TABLE `aragaz` (
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `aragaz`
--

INSERT INTO `aragaz` (`name`, `price`, `image`, `id`, `stock`) VALUES
('Aragaz mixt Arctic AEM5611DTLA, Gaz, 4 Arzatoare, Safety Plus, Arzatoare cu eficienta ridicata, 50 cm, Antracit', 100, 'aragaz/aragaz1.jpg', 10, 100),
('Aragaz profesional pe gaz Hendi Kitchen Line cu 6 arzatoare cu cuptor electric cu convectie GN 1/1 Inox 28.5 kW 1200x700x(H)900 mm', 1300, 'aragaz/aragaz2.jpg', 12, 100),
('Aragaz Beko FSST62110DW, 4 arzatoare, Mixt, Aprindere electrica, Grill, Rotisor,Clasa A, 60 cm, Alb', 1000, 'aragaz/aragaz3.jpg', 13, 100);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(2, 2, 0, 'Mouse Gaming LOGITECH G502 HERO', 252, 3, 'discounts/product-1.png'),
(3, 2, 0, 'Tastatura mecanica HP HyperX Alloy 65 Red, Iluminare RGB, Negru', 225, 2, 'discounts/product-4.png'),
(4, 2, 0, 'Pachet sistem PC Gaming Pro377, Procesor Intel® Core™ I7 3,4 GHz, 16GB RAM,2TB HDD, GeForce GT710,Mo', 3240, 2, 'discounts/product-8.png'),
(24, 3, 0, 'Casti gaming cu microfon Aqirys Altair, 7.1 USB, Virtual surround, Iluminare RGB, Negre, (AQRYS_ALTA', 186, 1, 'headsets/produs1.png'),
(25, 3, 0, 'Casti gaming wireless ASUS TUF Gaming H3 Wireless, 2.4 GHz, sunet surround 7.1, difuzoare 50mm', 370, 1, 'headsets/produs2.png'),
(26, 3, 0, 'Casti gaming wireless Razer Barracuda X, Multiplatforma PC, Playstation, Switch, surround 7.1 Virtua', 560, 1, 'headsets/produs3.png');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `comment_content` text DEFAULT NULL,
  `comment_author` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `comment_content`, `comment_author`, `created_at`) VALUES
(1, 1, 'ffff', 'fggf', '2023-11-26 19:39:41'),
(2, 1, '223232', 'dan', '2023-11-26 23:35:23'),
(3, 1, '223232', 'dan', '2023-11-26 23:36:14'),
(7, 2, 'rr', 'dan', '2023-11-26 23:59:32'),
(8, 2, 'rr', 'dan', '2023-11-26 23:59:37'),
(10, 7, 'asdfgh\r\n', 'zfsdfdds', '2023-11-27 07:57:44');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `comment_1`
--

CREATE TABLE `comment_1` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `comment_content` text DEFAULT NULL,
  `comment_author` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `comment_1`
--

INSERT INTO `comment_1` (`id`, `product_id`, `comment_content`, `comment_author`, `created_at`) VALUES
(1, 7, 'asdfgh\r\n', 'zfsdfdds', '2023-11-27 08:01:23'),
(2, 7, 'ddd', 'ddd', '2023-11-27 08:01:42'),
(3, 5, 'este fain', 'dan', '2023-11-27 11:22:05');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `discounts`
--

CREATE TABLE `discounts` (
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `discountper` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `discounts`
--

INSERT INTO `discounts` (`name`, `price`, `image`, `discountper`, `id`) VALUES
('Mouse Gaming LOGITECH G502 HERO', 300, 'discounts/product-1.png', 16, 1),
('Mouse Gaming RAZER Viper Mini', 103, 'discounts/product-2.png', 12, 2),
('Mouse gaming SteelSeries Rival 3, Negru', 190, 'discounts/product-3.png', 25, 3),
('Tastatura mecanica HP HyperX Alloy 65 Red, Iluminare RGB, Negru', 300, 'discounts/product-4.png', 25, 4),
('Tastatura Marvo KG962, iluminare Rainbow, USB-C, negru', 190, 'discounts/product-5.png', 30, 5),
('Tastatura Gaming Genesis Rhod 420 RGB', 135, 'discounts/product-6.png', 28, 6),
('Kit gaming Onikuma tastatura mecanica RGB G26 89 taste si mouse RGB CW905 7 butoane 6400 DPI ', 240, 'discounts/product-7.png', 15, 7),
('Pachet sistem PC Gaming Pro377, Procesor Intel® Core™ I7 3,4 GHz, 16GB RAM,2TB HDD, GeForce GT710,Monitor 21.5\" ', 3600, 'discounts/product-8.png', 10, 8),
('Desktop PC Gaming Serioux cu procesor AMD Ryzen™ 9 5900X, 32GB DDR4, 1TB SSD, GeForce® RTX 3070 8GB GDDR6,', 8000, 'discounts/product-9.png', 21, 9);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `email_verification`
--

CREATE TABLE `email_verification` (
  `user_id` int(11) DEFAULT NULL,
  `verification_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `email_verification`
--

INSERT INTO `email_verification` (`user_id`, `verification_code`) VALUES
(4, 649143),
(4, 913856),
(4, 111997),
(4, 945785),
(4, 807558),
(4, 903656),
(4, 377411),
(4, 530102),
(4, 112762),
(4, 830315),
(4, 374879),
(4, 957726),
(4, 142133),
(4, 133895),
(4, 706422);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `frigider`
--

CREATE TABLE `frigider` (
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `frigider`
--

INSERT INTO `frigider` (`name`, `price`, `image`, `id`, `stock`) VALUES
('Frigider cu doua usi Arctic AD54240M30W, 223 l, Garden Fresh, Termostat ajustabil, MixZone, Safety Glass, Usa reversibila, Clasa F (clasificare energetica veche Clasa A+), H 146.5 cm, Alb', 999, 'frigidere/produs1.jpg', 14, 100);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `headsets`
--

CREATE TABLE `headsets` (
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `headsets`
--

INSERT INTO `headsets` (`name`, `price`, `image`, `id`, `stock`) VALUES
('Casti gaming cu microfon Aqirys Altair, 7.1 USB, Virtual surround, Iluminare RGB, Negre, (AQRYS_ALTAIRWH)', 186, 'headsets/produs1.jpg', 4, 100),
('Casti gaming wireless ASUS TUF Gaming H3 Wireless, 2.4 GHz, sunet surround 7.1, difuzoare 50mm', 370, 'headsets/produs2.jpg', 5, 100),
('Casti gaming wireless Razer Barracuda X, Multiplatforma PC, Playstation, Switch, surround 7.1 Virtual', 560, 'headsets/produs3.jpg', 6, 100);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `keyboards`
--

CREATE TABLE `keyboards` (
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `keyboards`
--

INSERT INTO `keyboards` (`name`, `price`, `image`, `id`, `stock`) VALUES
('Tastatura gaming mecanica A+ K75, iluminare rainbow, Neagra', 110, 'keyboards/product1.jpg', 7, 100),
('Tastatura Mecanica Wireless, Fir Dongle 2.4Ghz ROYAL KLUDGE', 360, 'keyboards/product2.jpg', 8, 100),
('Tastatura mecanica gaming HyperX Alloy Origins Core, RGB, Switch HX-Blue', 290, 'keyboards/product3.jpg', 9, 100);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `mice`
--

CREATE TABLE `mice` (
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `mice`
--

INSERT INTO `mice` (`name`, `price`, `image`, `id`, `stock`) VALUES
('Mouse gaming Logitech G102, 8000 dpi, RGB, Negru', 300, 'mice/mouse1.jpg', 1, 100),
('Mouse gaming T-Dagger Lance Corporal, Negru, T-TGM107', 120, 'mice/mouse2.jpg', 2, 100),
('Mouse gaming Corsair M65 Pro RGB, senzor optic 12000DPI, Negru ', 250, 'mice/mouse3.jpg', 3, 100);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `microunde`
--

CREATE TABLE `microunde` (
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `microunde`
--

INSERT INTO `microunde` (`name`, `price`, `image`, `id`, `stock`) VALUES
('Cuptor cu microunde Samsung MS23K3515AK/OL, 23 l, 800 W, Auto cook, Quick Defrost, Interior ceramic, Child lock, Negru', 429, 'microunde/microunde1.jpg', 1, 100),
('Cuptor cu microunde Samsung MS23K3513, 23 l, Digital, Quick Defrost, 800 W, Negru', 443, 'microunde/microunde2.jpg', 2, 100),
('Cuptor cu microunde Saturn ST-MW8174, 1200W, 20 L, 8 programe de meniu, Functie de dezghetare, 5 nivele de putere microunde, Temporizator 95 min, Alb', 395, 'microunde/microunde3.jpg', 3, 100);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 4, 'Alexandru', '0770751534', '0', 'cash on delivery', '0', '0', 420, '2023-10-31', 'pending'),
(2, 4, 'Alexandru', '0770751534', '0', 'credit card', '0', '0', 670, '2023-10-31', 'pending'),
(3, 4, 'Alexandru', '0770751534', '0', 'cash on delivery', '0', '0', 360, '2023-10-31', 'pending'),
(4, 4, 'Alexandru', '0770751534', '0', 'cash on delivery', '0', '0', 1320, '2023-10-31', 'pending'),
(5, 4, 'Alexandru', '0770751534', '0', 'cash on delivery', '0', '0', 186, '2023-11-03', 'pending'),
(6, 4, 'Alexandru', '45', '0', 'cash on delivery', '0', '0', 300, '2023-11-07', 'pending'),
(7, 4, 'Alexandru', '45', '0', 'cash on delivery', '0', '0', 91, '2023-11-14', 'pending'),
(8, 4, 'Alexandru', '45', '0', 'cash on delivery', '0', '0', 999, '2023-11-14', 'pending'),
(9, 4, 'Alexandru', '45', '0', 'cash on delivery', '0', '0', 300, '2023-11-14', 'pending'),
(10, 4, 'Alexandru', '0770765923', '0', 'cash on delivery', '0', '0', 2960, '2023-11-14', 'pending'),
(11, 4, 'Alexandru', '0770765923', '0', 'cash on delivery', '0', '0', 370, '2023-11-17', 'pending'),
(12, 4, 'Alexandru', '0770765923', '0', 'cash on delivery', '0', '0', 370, '2023-11-21', 'pending'),
(13, 4, 'Alexandru Benteu', '0770765923', '0', 'cash on delivery', '0', '0', 120, '2023-11-21', 'pending'),
(14, 4, 'Alexandru Benteu', '0770765923', '0', 'cash on delivery', '0', '0', 370, '2023-11-21', 'pending'),
(15, 4, 'Alexandru', '0770765923', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Casti gaming cu microfon Aqirys Altair, 7.1 USB, Virtual surround, Iluminare RGB, Negre, (AQRYS_ALTA (186 x 1) - Casti gaming wireless ASUS TUF Gaming H3 Wireless, 2.4 GHz, sunet surround 7.1, difuzoare 50mm (370 x 1) - ', 556, '2023-11-21', 'pending'),
(16, 4, 'Alexandru', '0770765923', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Casti gaming wireless Razer Barracuda X, Multiplatforma PC, Playstation, Switch, surround 7.1 Virtua (560 x 1) - Casti gaming wireless ASUS TUF Gaming H3 Wireless, 2.4 GHz, sunet surround 7.1, difuzoare 50mm (370 x 1) - ', 930, '2023-11-21', 'pending'),
(17, 4, 'Alexandru', '0770765923', 'alexandrescudan19@gmail.com', 'credit card', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Casti gaming wireless Razer Barracuda X, Multiplatforma PC, Playstation, Switch, surround 7.1 Virtua (560 x 1) - Casti gaming wireless ASUS TUF Gaming H3 Wireless, 2.4 GHz, sunet surround 7.1, difuzoare 50mm (370 x 1) - ', 930, '2023-11-21', 'pending'),
(18, 4, 'Alexandru Benteu', '0770751534', 'alex.benteu@benzone.work', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Casti gaming cu microfon Aqirys Altair, 7.1 USB, Virtual surround, Iluminare RGB, Negre, (AQRYS_ALTA (186 x 1) - Sistem Gaming Lenovo IdeaCentre 5 14ACN6 cu procesor AMD Ryzen™ 5 5600G pana la 4.40 GHz, 16GB DDR4, (2600 x 1) - ', 2786, '2023-11-21', 'pending'),
(19, 4, 'Alexandrescu Ilie', '0770751534', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 156, liviu Rebreanu, Timisoara, Timis, Romania - 123456', 'Mouse Gaming LOGITECH G502 HERO (252 x 1) - Mouse Gaming RAZER Viper Mini (91 x 1) - Mouse gaming SteelSeries Rival 3, Negru (143 x 1) - Tastatura Marvo KG962, iluminare Rainbow, USB-C, negru (133 x 1) - ', 619, '2023-11-21', 'pending'),
(20, 4, 'Alexandrescu Ilie', '0770751534', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 156, liviu Rebreanu, Timisoara, Timis, Romania - 123456', 'Casti gaming wireless Razer Barracuda X, Multiplatforma PC, Playstation, Switch, surround 7.1 Virtua (560 x 1) - Mouse gaming Corsair M65 Pro RGB, senzor optic 12000DPI, Negru  (250 x 1) - Sistem Desktop PC Gaming Lenovo Legion T5 26AMR5 cu procesor AMD Ryzen™ 5 5600G pana la 4.40GHz, 16G (6110 x 1) - Frigider cu doua usi Arctic AD54240M30W, 223 l, Garden Fresh, Termostat ajustabil, MixZone, Safety G (999 x 1) - ', 7919, '2023-11-21', 'pending'),
(21, 4, 'Alexandru Benteu', '4444444444', 'alex.benteu@benzone.work', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Mouse Gaming RAZER Viper Mini (91 x 1) - ', 91, '2023-11-25', 'pending'),
(22, 4, 'Alexandru Benteu', '4444444444', 'alex.benteu@benzone.work', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Casti gaming wireless ASUS TUF Gaming H3 Wireless, 2.4 GHz, sunet surround 7.1, difuzoare 50mm (370 x 1) - Sistem Gaming Lenovo IdeaCentre 5 14ACN6 cu procesor AMD Ryzen™ 5 5600G pana la 4.40 GHz, 16GB DDR4, (2600 x 1) - Mouse Gaming RAZER Viper Mini (91 x 1) - Frigider cu doua usi Arctic AD54240M30W, 223 l, Garden Fresh, Termostat ajustabil, MixZone, Safety G (999 x 1) - ', 4060, '2023-11-27', 'pending'),
(23, 4, 'Alexandru Benteu', '8888888888', 'alex.benteu@benzone.work', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Mouse gaming T-Dagger Lance Corporal, Negru, T-TGM107 (120 x 1) - ', 120, '2023-11-27', 'pending'),
(24, 4, 'Alexandru', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-11-27', 'pending'),
(25, 4, 'Alexandru', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - Mouse gaming T-Dagger Lance Corporal, Negru, T-TGM107 (120 x 1) - Mouse gaming Corsair M65 Pro RGB, senzor optic 12000DPI, Negru  (250 x 1) - ', 670, '2023-11-28', 'pending'),
(26, 4, 'Alexandru', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 156, liviu R, Timisoara, Timis, Romania - 123456', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - Mouse gaming T-Dagger Lance Corporal, Negru, T-TGM107 (120 x 1) - ', 420, '2023-11-28', 'pending'),
(27, 4, 'dan', '3333333333', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 333333, timi, timis, timmm, rom - 222222', 'Casti gaming wireless ASUS TUF Gaming H3 Wireless, 2.4 GHz, sunet surround 7.1, difuzoare 50mm (370 x 1) - ', 370, '2023-12-09', 'pending'),
(28, 4, 'dan', '0000000000', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 777, timi, timis, timmm, rom - 121323', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - Mouse gaming T-Dagger Lance Corporal, Negru, T-TGM107 (120 x 1) - ', 420, '2023-12-09', 'pending'),
(29, 4, 'dan', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 11111, timi, timis, timmm, rom - 213123', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-12-09', 'pending'),
(30, 4, 'dan', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 11111, timi, timis, timmm, rom - 213123', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-12-09', 'pending'),
(31, 4, 'dan', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 11111, timi, timis, timmm, rom - 213123', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-12-09', 'pending'),
(32, 4, 'dan', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 11111, timi, timis, timmm, rom - 213123', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-12-09', 'pending'),
(33, 4, 'dan', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 11111, timi, timis, timmm, rom - 213123', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-12-09', 'pending'),
(34, 4, 'dan', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 11111, timi, timis, timmm, rom - 213123', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-12-09', 'pending'),
(35, 4, 'dan', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 11111, timi, timis, timmm, rom - 213123', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-12-09', 'pending'),
(36, 4, 'dan', '7777777777', 'alexandrescudan19@gmail.com', 'cash on delivery', 'flat no. 11111, timi, timis, timmm, rom - 213123', 'Mouse gaming Logitech G102, 8000 dpi, RGB, Negru (300 x 1) - ', 300, '2023-12-09', 'pending');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `pcgaming`
--

CREATE TABLE `pcgaming` (
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `pcgaming`
--

INSERT INTO `pcgaming` (`name`, `price`, `image`, `id`, `stock`) VALUES
('Sistem Gaming Lenovo IdeaCentre 5 14ACN6 cu procesor AMD Ryzen™ 5 5600G pana la 4.40 GHz, 16GB DDR4, 512GB SSD M.2 2280 PCIe NVMe, NVIDIA GeForce GTX 1650 SUPER 4GB GDDR6, No OS', 2600, 'pcgaming/produs1.jpg', 10, 100),
('Sistem Desktop PC Gaming Lenovo Legion T5 26AMR5 cu procesor AMD Ryzen™ 5 5600G pana la 4.40GHz, 16GB DDR4, 512GB SSD M.2 PCIe, GeForce RTX 3060 12GB GDDR6, No OS', 6110, 'pcgaming/produs2.jpg', 12, 100),
('Sistem Gaming HP Pavilion cu procesor Intel® Core™ i5-10400 pana la 4.30 GHz, Comet Lake, 8GB DDR4, 512GB SSD, NVIDIA GeForce GTX 1650 SUPER 4GB, Windows 11 Home, Shadow Black', 2900, 'pcgaming/produs3.jpg', 13, 100);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `user_form`
--

CREATE TABLE `user_form` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `user_form`
--

INSERT INTO `user_form` (`id`, `name`, `email`, `password`, `is_verified`) VALUES
(4, 'Singren12', 'alexandrescudan19@gmail.com', 'ba0a5587353d249bc38b6511db3f1202', 1);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `aragaz`
--
ALTER TABLE `aragaz`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_discounts` (`product_id`);

--
-- Indexuri pentru tabele `comment_1`
--
ALTER TABLE `comment_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `email_verification`
--
ALTER TABLE `email_verification`
  ADD KEY `email_verification_ibfk_1` (`user_id`);

--
-- Indexuri pentru tabele `frigider`
--
ALTER TABLE `frigider`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `headsets`
--
ALTER TABLE `headsets`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `keyboards`
--
ALTER TABLE `keyboards`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `user_form`
--
ALTER TABLE `user_form`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pentru tabele `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pentru tabele `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pentru tabele `comment_1`
--
ALTER TABLE `comment_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pentru tabele `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pentru tabele `headsets`
--
ALTER TABLE `headsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pentru tabele `keyboards`
--
ALTER TABLE `keyboards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pentru tabele `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pentru tabele `user_form`
--
ALTER TABLE `user_form`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `fk_comments_discounts` FOREIGN KEY (`product_id`) REFERENCES `discounts` (`id`);

--
-- Constrângeri pentru tabele `email_verification`
--
ALTER TABLE `email_verification`
  ADD CONSTRAINT `email_verification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_form` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
