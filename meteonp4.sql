-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 09:07 PM
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
-- Database: `meteonp4`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_cards`
--

CREATE TABLE `bank_cards` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_statements`
--

CREATE TABLE `bank_statements` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boombox`
--

CREATE TABLE `boombox` (
  `id` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `songname` varchar(500) NOT NULL,
  `author` varchar(500) NOT NULL,
  `imageurl` text NOT NULL,
  `songurl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cameras`
--

CREATE TABLE `cameras` (
  `cid` varchar(50) DEFAULT NULL,
  `cameradata` longtext DEFAULT NULL,
  `camID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carmileages`
--

CREATE TABLE `carmileages` (
  `plate` text DEFAULT NULL,
  `mileage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `codem-hud-data`
--

CREATE TABLE `codem-hud-data` (
  `identifier` varchar(65) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `stress` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_skills`
--

CREATE TABLE `core_skills` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `skill_name` varchar(100) NOT NULL,
  `value1` varchar(50) NOT NULL,
  `value2` varchar(50) NOT NULL,
  `value3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto`
--

CREATE TABLE `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debux_recentpost`
--

CREATE TABLE `debux_recentpost` (
  `id` int(11) NOT NULL,
  `time` varchar(50) DEFAULT NULL,
  `text` varchar(500) DEFAULT 'DEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUXDEBUX DEBUX'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ds_blipcreator`
--

CREATE TABLE `ds_blipcreator` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fuel_stations`
--

CREATE TABLE `fuel_stations` (
  `location` int(11) NOT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gammy_scrapyard`
--

CREATE TABLE `gammy_scrapyard` (
  `id` varchar(50) DEFAULT NULL,
  `cooldown` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gloveboxitems`
--

CREATE TABLE `gloveboxitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `houselocations`
--

CREATE TABLE `houselocations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `house_plants`
--

CREATE TABLE `house_plants` (
  `id` int(11) NOT NULL,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lapraces`
--

CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_funds`
--

CREATE TABLE `management_funds` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketplace`
--

CREATE TABLE `marketplace` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `normal` longtext DEFAULT NULL,
  `auction` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_sellers`
--

CREATE TABLE `marketplace_sellers` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `totalsold` int(11) NOT NULL DEFAULT 0,
  `earnings` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_bolos`
--

CREATE TABLE `mdt_bolos` (
  `id` int(11) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_bulletin`
--

CREATE TABLE `mdt_bulletin` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_clocking`
--

CREATE TABLE `mdt_clocking` (
  `id` int(10) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_convictions`
--

CREATE TABLE `mdt_convictions` (
  `id` int(11) NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_data`
--

CREATE TABLE `mdt_data` (
  `id` int(11) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_impound`
--

CREATE TABLE `mdt_impound` (
  `id` int(11) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_incidents`
--

CREATE TABLE `mdt_incidents` (
  `id` int(11) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_logs`
--

CREATE TABLE `mdt_logs` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_vehicleinfo`
--

CREATE TABLE `mdt_vehicleinfo` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_weaponinfo`
--

CREATE TABLE `mdt_weaponinfo` (
  `id` int(11) NOT NULL,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `occasion_vehicles`
--

CREATE TABLE `occasion_vehicles` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `okokBanking_societies`
--

CREATE TABLE `okokBanking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `okokBanking_transactions`
--

CREATE TABLE `okokBanking_transactions` (
  `id` int(11) NOT NULL,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(50) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `okokBilling`
--

CREATE TABLE `okokBilling` (
  `id` int(50) NOT NULL,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `society` varchar(255) NOT NULL,
  `society_name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `invoice_value` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notes` varchar(255) DEFAULT ' ',
  `sent_date` varchar(255) NOT NULL,
  `limit_pay_date` varchar(255) DEFAULT NULL,
  `fees_amount` int(50) DEFAULT 0,
  `paid_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `okokReports`
--

CREATE TABLE `okokReports` (
  `admin_identifier` varchar(255) NOT NULL,
  `responded_reports` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pa_vehicleshop_showroom_vehicles`
--

CREATE TABLE `pa_vehicleshop_showroom_vehicles` (
  `id` int(11) NOT NULL,
  `dealershipId` int(11) DEFAULT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pa_vehicleshop_stocks`
--

CREATE TABLE `pa_vehicleshop_stocks` (
  `id` int(11) NOT NULL,
  `dealershipId` int(11) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_chatrooms`
--

CREATE TABLE `phone_chatrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_chatroom_messages`
--

CREATE TABLE `phone_chatroom_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_gallery`
--

CREATE TABLE `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_note`
--

CREATE TABLE `phone_note` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_tweets`
--

CREATE TABLE `phone_tweets` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `tweetId` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dnzv3` int(11) NOT NULL DEFAULT 0,
  `dnzv3_active` int(11) NOT NULL DEFAULT 0,
  `dnzv3_timeblock` int(11) NOT NULL DEFAULT 0,
  `iban` varchar(255) DEFAULT NULL,
  `pincode` int(50) DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `crafting_level` tinyint(4) NOT NULL DEFAULT 1,
  `crafting_xp` smallint(6) NOT NULL DEFAULT 0,
  `credits` int(11) NOT NULL DEFAULT 0,
  `tasks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `tasks_completed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `winnings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `ownedskills` longtext NOT NULL DEFAULT '{}',
  `skillsinfo` longtext NOT NULL DEFAULT '{"skillpoints":0, "skillxp":0, "nextlevel":100, "currentlevel":0}',
  `frkn_craftxp` int(11) DEFAULT 20,
  `frkn_craftlevel` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_emotes`
--

CREATE TABLE `player_emotes` (
  `id` int(11) NOT NULL,
  `player_id` varchar(50) DEFAULT NULL,
  `emote_category` varchar(255) NOT NULL,
  `emote_index` int(11) NOT NULL,
  `emote_type` varchar(255) NOT NULL,
  `emote_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int(255) NOT NULL,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_jobs`
--

CREATE TABLE `player_jobs` (
  `id` int(11) NOT NULL,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `nosColour` text DEFAULT NULL,
  `traveldistance` int(50) DEFAULT 0,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT 'Garage A',
  `favorite` varchar(60) DEFAULT '0',
  `logs` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_warns`
--

CREATE TABLE `player_warns` (
  `id` int(11) NOT NULL,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punchmachine`
--

CREATE TABLE `punchmachine` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `score` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sprays`
--

CREATE TABLE `sprays` (
  `id` int(11) NOT NULL,
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) NOT NULL,
  `text` varchar(32) NOT NULL,
  `font` varchar(32) NOT NULL,
  `color` int(3) NOT NULL,
  `interior` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stashitems`
--

CREATE TABLE `stashitems` (
  `id` int(11) NOT NULL,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trunkitems`
--

CREATE TABLE `trunkitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `citizenid` (`citizenid`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `record_id` (`record_id`);

--
-- Indexes for table `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `discord` (`discord`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `boombox`
--
ALTER TABLE `boombox`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `codem-hud-data`
--
ALTER TABLE `codem-hud-data`
  ADD UNIQUE KEY `identifier` (`identifier`) USING HASH;

--
-- Indexes for table `core_skills`
--
ALTER TABLE `core_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto`
--
ALTER TABLE `crypto`
  ADD PRIMARY KEY (`crypto`);

--
-- Indexes for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debux_recentpost`
--
ALTER TABLE `debux_recentpost`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ds_blipcreator`
--
ALTER TABLE `ds_blipcreator`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fuel_stations`
--
ALTER TABLE `fuel_stations`
  ADD PRIMARY KEY (`location`);

--
-- Indexes for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `houselocations`
--
ALTER TABLE `houselocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `house_plants`
--
ALTER TABLE `house_plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building` (`building`),
  ADD KEY `plantid` (`plantid`);

--
-- Indexes for table `lapraces`
--
ALTER TABLE `lapraces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raceid` (`raceid`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management_funds`
--
ALTER TABLE `management_funds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_name` (`job_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `marketplace`
--
ALTER TABLE `marketplace`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketplace_sellers`
--
ALTER TABLE `marketplace_sellers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mdt_bolos`
--
ALTER TABLE `mdt_bolos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_bulletin`
--
ALTER TABLE `mdt_bulletin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_clocking`
--
ALTER TABLE `mdt_clocking`
  ADD PRIMARY KEY (`user_id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `mdt_convictions`
--
ALTER TABLE `mdt_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_data`
--
ALTER TABLE `mdt_data`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `mdt_impound`
--
ALTER TABLE `mdt_impound`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_incidents`
--
ALTER TABLE `mdt_incidents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_logs`
--
ALTER TABLE `mdt_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_vehicleinfo`
--
ALTER TABLE `mdt_vehicleinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_weaponinfo`
--
ALTER TABLE `mdt_weaponinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Indexes for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasionId` (`occasionid`);

--
-- Indexes for table `okokBanking_transactions`
--
ALTER TABLE `okokBanking_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `okokBilling`
--
ALTER TABLE `okokBilling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `okokReports`
--
ALTER TABLE `okokReports`
  ADD UNIQUE KEY `abc_ndx` (`admin_identifier`);

--
-- Indexes for table `pa_vehicleshop_showroom_vehicles`
--
ALTER TABLE `pa_vehicleshop_showroom_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pa_vehicleshop_stocks`
--
ALTER TABLE `pa_vehicleshop_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_chatrooms`
--
ALTER TABLE `phone_chatrooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_code` (`room_code`);

--
-- Indexes for table `phone_chatroom_messages`
--
ALTER TABLE `phone_chatroom_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `number` (`number`);

--
-- Indexes for table `phone_note`
--
ALTER TABLE `phone_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `id` (`id`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_emotes`
--
ALTER TABLE `player_emotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_houses`
--
ALTER TABLE `player_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house` (`house`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `player_jobs`
--
ALTER TABLE `player_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `outfitId` (`outfitId`);

--
-- Indexes for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `player_warns`
--
ALTER TABLE `player_warns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`),
  ADD UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`);

--
-- Indexes for table `punchmachine`
--
ALTER TABLE `punchmachine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sprays`
--
ALTER TABLE `sprays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stashitems`
--
ALTER TABLE `stashitems`
  ADD PRIMARY KEY (`stash`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `trunkitems`
--
ALTER TABLE `trunkitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_cards`
--
ALTER TABLE `bank_cards`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boombox`
--
ALTER TABLE `boombox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_skills`
--
ALTER TABLE `core_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debux_recentpost`
--
ALTER TABLE `debux_recentpost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ds_blipcreator`
--
ALTER TABLE `ds_blipcreator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houselocations`
--
ALTER TABLE `houselocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_plants`
--
ALTER TABLE `house_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapraces`
--
ALTER TABLE `lapraces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_funds`
--
ALTER TABLE `management_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketplace`
--
ALTER TABLE `marketplace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketplace_sellers`
--
ALTER TABLE `marketplace_sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_bolos`
--
ALTER TABLE `mdt_bolos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_bulletin`
--
ALTER TABLE `mdt_bulletin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_clocking`
--
ALTER TABLE `mdt_clocking`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_convictions`
--
ALTER TABLE `mdt_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_data`
--
ALTER TABLE `mdt_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_impound`
--
ALTER TABLE `mdt_impound`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_incidents`
--
ALTER TABLE `mdt_incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_logs`
--
ALTER TABLE `mdt_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_vehicleinfo`
--
ALTER TABLE `mdt_vehicleinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_weaponinfo`
--
ALTER TABLE `mdt_weaponinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `okokBanking_transactions`
--
ALTER TABLE `okokBanking_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `okokBilling`
--
ALTER TABLE `okokBilling`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pa_vehicleshop_showroom_vehicles`
--
ALTER TABLE `pa_vehicleshop_showroom_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pa_vehicleshop_stocks`
--
ALTER TABLE `pa_vehicleshop_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_chatrooms`
--
ALTER TABLE `phone_chatrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_chatroom_messages`
--
ALTER TABLE `phone_chatroom_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_note`
--
ALTER TABLE `phone_note`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_emotes`
--
ALTER TABLE `player_emotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_houses`
--
ALTER TABLE `player_houses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_jobs`
--
ALTER TABLE `player_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_warns`
--
ALTER TABLE `player_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punchmachine`
--
ALTER TABLE `punchmachine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sprays`
--
ALTER TABLE `sprays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stashitems`
--
ALTER TABLE `stashitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trunkitems`
--
ALTER TABLE `trunkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;