-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Трв 23 2020 р., 21:15
-- Версія сервера: 10.3.13-MariaDB-log
-- Версія PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `software_company`
--

-- --------------------------------------------------------

--
-- Структура таблиці `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `ordering_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `deadline` date NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `bill`
--

INSERT INTO `bill` (`bill_id`, `ordering_id`, `price`, `deadline`, `date`) VALUES
(101, 31, 10000, '2020-05-25', '2020-06-15'),
(102, 41, 1500, '2020-05-25', '2020-06-17'),
(103, 51, 4000, '2020-05-30', '2020-07-20'),
(104, 61, 380000, '2020-05-23', '2020-06-30'),
(105, 71, 2000, '2020-05-24', '2020-06-18');

-- --------------------------------------------------------

--
-- Структура таблиці `office`
--

CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `adress` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_of_workers` int(10) NOT NULL,
  `software_company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `office`
--

INSERT INTO `office` (`office_id`, `adress`, `counter_of_workers`, `software_company_id`) VALUES
(11, 'Lviv, Zelena 108', 50, 1),
(12, 'Lviv, Gorodotska 42', 40, 1),
(13, 'Lviv, Sadova 110', 70, 1),
(14, 'Lviv, Gorodotska 147', 120, 1),
(15, 'Lviv, Mostova 3', 65, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `ordering`
--

CREATE TABLE `ordering` (
  `ordering_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `deadline` date NOT NULL,
  `price` float NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `ordering`
--

INSERT INTO `ordering` (`ordering_id`, `services_id`, `deadline`, `price`, `date`) VALUES
(31, 21, '2020-06-30', 10000, '2020-05-26'),
(41, 22, '2020-06-30', 1500, '2020-05-26'),
(51, 23, '2020-06-18', 4000, '2020-05-24'),
(61, 24, '2020-06-19', 380000, '2020-05-28'),
(71, 25, '2020-06-23', 2000, '2020-05-28');

-- --------------------------------------------------------

--
-- Структура таблиці `services`
--

CREATE TABLE `services` (
  `services_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `deadline` date NOT NULL,
  `date` date NOT NULL,
  `ofiice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `services`
--

INSERT INTO `services` (`services_id`, `name`, `price`, `deadline`, `date`, `ofiice_id`) VALUES
(21, 'website development', 10000, '2020-06-30', '2020-05-26', 11),
(22, 'support of ready site', 1500, '2020-06-30', '2020-05-26', 12),
(23, 'design for web application', 4000, '2020-06-18', '2020-05-24', 13),
(24, 'create SPA application', 380000, '2020-06-19', '2020-05-28', 14),
(25, 'redesign for old site', 2000, '2020-06-23', '2020-05-28', 15);

-- --------------------------------------------------------

--
-- Структура таблиці `software_company`
--

CREATE TABLE `software_company` (
  `software_company_id` int(11) NOT NULL,
  `web-site` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_of_company` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `software_company`
--

INSERT INTO `software_company` (`software_company_id`, `web-site`, `name_of_company`, `adress`) VALUES
(1, 'www.KRYSOFT.com', 'KRYSOFT', 'Lviv,Patona 88');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `ordering_id` (`ordering_id`);

--
-- Індекси таблиці `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `software_company_id` (`software_company_id`);

--
-- Індекси таблиці `ordering`
--
ALTER TABLE `ordering`
  ADD PRIMARY KEY (`ordering_id`),
  ADD KEY `services_id` (`services_id`);

--
-- Індекси таблиці `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`services_id`),
  ADD KEY `ofiice_id` (`ofiice_id`);

--
-- Індекси таблиці `software_company`
--
ALTER TABLE `software_company`
  ADD PRIMARY KEY (`software_company_id`);

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`ordering_id`) REFERENCES `ordering` (`ordering_id`) ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `office_ibfk_1` FOREIGN KEY (`software_company_id`) REFERENCES `software_company` (`software_company_id`) ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `ordering`
--
ALTER TABLE `ordering`
  ADD CONSTRAINT `ordering_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`services_id`) ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`ofiice_id`) REFERENCES `office` (`office_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
