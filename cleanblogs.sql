-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2020 at 10:49 AM
-- Server version: 8.0.21-0ubuntu0.20.04.4
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sni` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(120) NOT NULL,
  `msg` varchar(256) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sni`, `name`, `email`, `msg`, `date`, `phone`) VALUES
(1, 'Shreya', 'shreya030200gupta@gmail.com', 'Hi there', '2020-09-06 13:22:22', '8420659037'),
(2, 'Shreya Gupta', 'shreya030200gupta@gmail.com', 'yup', '2020-09-07 12:36:48', '08420659037'),
(3, 'S Gupta', 'shreya030200gupta@gmail.com', 'yes', '2020-09-08 12:11:50', '08420659037'),
(4, 'Shreya Gupta', 'shreya030200gupta@gmail.com', 'y', '2020-09-08 12:16:34', '08420659037');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sno` int NOT NULL,
  `title` varchar(120) NOT NULL,
  `slug` varchar(32) NOT NULL,
  `writtenBy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `subheading` text NOT NULL,
  `img_file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sno`, `title`, `slug`, `writtenBy`, `date`, `content`, `subheading`, `img_file`) VALUES
(1, 'SpaceX', 'spacex', 'Shreya', '2020-09-09 08:53:28', 'Space Exploration Technologies Corporation,  SpaceX, is an American aerospace manufacturer and space transportation services company headquartered in Hawthorne, California. It was founded in 2002 by Elon Musk with the goal of reducing space transportation costs to enable the colonization of Mars. SpaceX has developed several launch vehicles, the Starlink satellite constellation, the Dragon cargo spacecraft, and flown humans to the International Space Station on the Crew Dragon Demo-2.\r\n\r\nSpaceX\'s achievements include the first privately funded liquid-propellant rocket to reach orbit (Falcon 1 in 2008), the first private company to successfully launch, orbit, and recover a spacecraft (Dragon in 2010), the first private company to send a spacecraft to the International Space Station (Dragon in 2012), the first propulsive landing for an orbital rocket (Falcon 9 in 2015), the first reuse of an orbital rocket (Falcon 9 in 2017), the first private company to launch an object into orbit around the Sun (Falcon Heavy\'s payload of a Tesla Roadster in 2018), and the first private company to send astronauts to orbit and to the International Space Station (SpaceX Crew Dragon Demo-2 Mission in 2020). SpaceX has flown 20 cargo resupply missions to the International Space Station (ISS) under a partnership with NASA, as well as an uncrewed demonstration flight of the human-rated Dragon 2 spacecraft (Crew Demo-1) on March 2, 2019, and the first crewed Dragon 2 flight on May 30, 2020.', 'This article is about the rocket manufacturer.', 'post-bg.jpg'),
(2, 'Tesla', 'tesla', 'SGupta', '2020-09-09 12:10:59', 'Tesla, Inc. (formerly Tesla Motors, Inc.) is an American electric vehicle and clean energy company based in Palo Alto, California. Tesla\'s current products include electric cars (the Model S, Model 3, Model X, and Model Y), battery energy storage from home to grid scale (the Powerwall, Powerpack, and Megapack), solar products (solar panels and solar roof tiles) and related products and services.\r\n\r\nFounded in July 2003 by engineers Martin Eberhard and Marc Tarpenning as Tesla Motors, the company’s name is a tribute to inventor and electrical engineer Nikola Tesla. The next three employees were Ian Wright, Elon Musk, and J. B. Straubel, all of whom are named as co-founders of the company. Musk, who formerly served as chairman and is the current CEO, said in 2006 that \"the overarching purpose of Tesla Motors...is to help expedite the move from a mine-and-burn hydrocarbon economy towards a solar electric economy...\"and it would build a wide range of electric vehicles, including \"affordably priced family cars\", and co-market SolarCity solar panels to do so. (Tesla acquired SolarCity in 2016.) ', 'All about the electric car Tesla', 'tesla.jpg'),
(3, 'Solarcity', 'solar-city', 'Shreya', '2020-09-10 18:12:10', 'SolarCity Corporation is a subsidiary of Tesla, Inc. that develops and sells solar panels and solar roof tiles. It is headquartered in Fremont, California. After its acquisition in 2016, effectively all products and services are sold through Tesla\'s website. The company, in partnership with Panasonic, manufactures solar module components in Tesla Giga New York, a factory in Buffalo, New York.\r\nSolarCity was founded in 2006 by brothers Peter and Lyndon Rive, based on a suggestion for a solar company concept by their cousin, Elon Musk, who was the chairman and helped start the company. By 2009, solar panels it had installed were capable of generating 440 megawatts (MW) of power.\r\n\r\nIn 2011, the company launched their expansion to the East Coast with the acquisition of the solar division of Clean Currents and groSolar. Following the acquisitions, SolarCity expanded operations on the East Coast and opened in Connecticut, Pennsylvania, South Carolina,Florida, Vermont, and New Hampshire.\r\n\r\n', 'Know about the future, Solarcity', 'solarcity.jpg'),
(4, 'OpenAI', 'openai', 'Shreya', '2020-09-10 18:24:17', 'OpenAI is an artificial intelligence research laboratory consisting of the for-profit corporation OpenAI LP and its parent company, the non-profit OpenAI Inc. The company, considered a competitor to DeepMind, conducts research in the field of artificial intelligence (AI) with the stated goal of promoting and developing friendly AI in a way that benefits humanity as a whole. The organization was founded in San Francisco in late 2015 by Elon Musk, Sam Altman, and others, who collectively pledged US$1 billion. Musk resigned from the board in February 2018 but remained a donor. In 2019, OpenAI LP received a US$1 billion investment from Microsoft.\r\nIn October 2015, Elon Musk, Sam Altman, and other investors announced the formation of OpenAI and pledged over US$1 billion to the venture. The organization stated they would \"freely collaborate\" with other institutions and researchers by making its patents and research open to the public.\r\nThe group started in early January 2016 with nine researchers. According to Wired, Brockman met with Yoshua Bengio, one of the \"founding fathers\" of the deep learning movement, and drew up a list of the \"best researchers in the field\". Microsoft\'s Peter Lee stated that the cost of a top AI researcher exceeds the cost of a top NFL quarterback prospect. While OpenAI pays corporate-level (rather than nonprofit-level) salaries, it doesn\'t currently pay AI researchers salaries comparable to those of Facebook or Google. Nevertheless, Sutskever stated that he was willing to leave Google for OpenAI \"partly of because of the very strong group of people and, to a very large extent, because of its mission.\" Brockman stated that \"the best thing that I could imagine doing was moving humanity closer to building real AI in a safe way.\" OpenAI researcher Wojciech Zaremba stated that he turned down \"borderline crazy\" offers of two to three times his market value to join OpenAI instead.', 'Know about OpenAI', 'openai-avatar.png'),
(5, 'Hyperloop', 'hyperloop', 'Shreya', '2020-09-10 18:36:12', 'The Hyperloop is a proposed mode of passenger and freight transportation, first used to describe an open-source vactrain design released by a joint team from Tesla and SpaceX. Hyperloop is a sealed tube or system of tubes with low air pressure through which a pod may travel substantially free of air resistance or friction. The Hyperloop could convey people or objects at airline or hypersonic speeds while being very energy efficient.This would drastically reduce travel times versus trains as well as planes over distances of under approximately 1,500 kilometres (930 miles).\r\n\r\nElon Musk first publicly mentioned the Hyperloop in 2012. His initial concept incorporated reduced-pressure tubes in which pressurized capsules ride on air bearings driven by linear induction motors and axial compressors.\r\n\r\nThe Hyperloop Alpha concept was first published in August 2013, proposing and examining a route running from the Los Angeles region to the San Francisco Bay Area, roughly following the Interstate 5 corridor. The Hyperloop Genesis paper conceived of a hyperloop system that would propel passengers along the 350-mile (560 km) route at a speed of 760 mph (1,200 km/h), allowing for a travel time of 35 minutes, which is considerably faster than current rail or air travel times. Preliminary cost estimates for this LA–SF suggested route were included in the white paper—US$6 billion for a passenger-only version, and US$7.5 billion for a somewhat larger-diameter version transporting passengers and vehicles.(Transportation analysts had doubts that the system could be constructed on that budget. Some analysts claimed that the Hyperloop would be several billion dollars overbudget, taking into consideration construction, development, and operation costs.)', 'Interesting facts on Hyperloop', 'hyperloop.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sni`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sni` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sno` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
