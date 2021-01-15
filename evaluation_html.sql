-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 11, 2021 at 09:48 PM
-- Server version: 5.6.36
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation_html`
--

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_addr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `sujet_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `num_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `sujet_id`, `question`, `num_question`) VALUES
(1, 1, 'What\'s the web?', 0),
(2, 1, 'What kind of resources are there?', 1),
(3, 1, 'What\'s hypertext ? What\'s an hyperlink?', 2),
(4, 2, 'From where the browser gets web pages?', 0),
(5, 2, 'What are servers?', 1),
(6, 2, 'Make a schematic description of one page request?', 2),
(7, 2, 'Do we always need to use a web server in order to access a web page locally?', 3),
(8, 2, 'What to do to publish a web page after editing it in your PC?', 4),
(9, 2, 'What is HTTP? What is HTML?', 5),
(10, 3, 'What\'s the advantage of writing HTML code?', 0),
(11, 3, 'What are the four concepts to watch for when programming?', 1),
(12, 4, 'Can we use a word processor like MS Word to write HTML code? Why?', 0),
(13, 4, 'What are the most important features availables in programmer\'s text editor like atom and VSCode?', 1),
(14, 4, 'What\'s the HTML files extension?', 2),
(15, 4, 'Is it possible to write a full set of code without making any mistake? What\'s the proposed solution to minimize errors?', 3),
(16, 5, 'How the browser knows how to render a web page?', 0),
(17, 5, 'Using which mean pages can be related one to one another?', 1),
(18, 5, 'What to do in the HTML file to make the text look different in the browser?', 2),
(19, 6, 'What is a markup? What is a tag? What is an element?', 0),
(20, 6, 'What is the meaning of an em element?', 1),
(21, 6, 'What is the meaning of a strong element?', 2),
(22, 7, 'What is a whitespace? How do browser treat them?', 0),
(23, 7, 'How to add line breaks inside a text?', 1),
(24, 7, 'How do we call elements without a closing tag? Why this closing tag is missing in such elements?', 2),
(25, 8, 'Can we write an essay in HTML using only br tags? Why?', 0),
(26, 8, 'How to make paragraphs in HTML?', 1),
(27, 9, 'What is the element used to highlight a text in HTML?', 0),
(28, 9, 'What are the sub and sup elements used for?', 1),
(29, 10, 'What is the concept that makes HTML code looks like a Russian doll?', 0),
(30, 10, 'Can we put a paragraph inside another? Can they overlap?', 1),
(31, 11, 'What is the difference between inline and block elements?', 0),
(32, 11, 'Give examples of block elements?', 1),
(33, 11, 'Give examples of inline elements?', 2),
(34, 12, 'Why the list item li doesn\'t make sense on it own?', 0),
(35, 12, 'What is the difference between an ordered and an unordered list? What is the tag used for either one?', 1),
(36, 12, 'Why the closing tag is not required for li elements?', 2),
(37, 12, 'Can we omit the closing tag for ul or ol elements?', 3),
(38, 13, 'What is the technical name used to refer to a web address?', 0),
(39, 13, 'What is the meaning of each part of a web address?', 1),
(40, 13, 'What is the protocol used for local files?', 2),
(41, 14, 'What is the tag used to create links?', 0),
(42, 14, 'What are the parts needed to make a link?', 1),
(43, 14, 'Can we add attributes inside a closing tag?', 2),
(44, 15, 'What is the tag used to create images? Is it a block or an inline element?', 0),
(45, 15, 'Why the img tag have no text content?', 1),
(46, 15, 'What are the most important attributes that we need always to specify within an image tag?', 2),
(47, 15, 'Why the alt attribute is so important while it\'s not displayed when the browser renders the image?', 3),
(48, 16, 'When do we need to use relative URLs?', 0),
(49, 16, 'How the browser can recognize relative URLs?', 1),
(50, 17, 'How the browser can guess which version of HTML you are using inside your page? What is the tag used to tell\r\n          the browser that we are using the latest version of HTML?', 0),
(51, 17, 'How many parts a full HTML document is composed of?', 1),
(52, 17, 'What is the required tag that goes inside the head tag?', 2),
(53, 17, 'What is the piece of information that tells the screen readers which natural language is used in the web\r\n          page?', 3),
(54, 18, 'What is the tool used to validate your HTML documents?', 0),
(55, 18, 'Which organization is caring about HTML standards?', 1),
(56, 18, 'How can we use the W3C HTML validator?', 2);

-- --------------------------------------------------------

--
-- Table structure for table `questions_users`
--

CREATE TABLE `questions_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions_users`
--

INSERT INTO `questions_users` (`id`, `user_id`, `question_id`) VALUES
(1, 1, 2),
(2, 1, 4),
(3, 1, 7),
(4, 1, 9),
(5, 1, 15),
(6, 1, 16),
(7, 1, 20),
(8, 1, 21),
(9, 1, 24),
(10, 1, 26),
(11, 1, 27),
(12, 1, 28),
(13, 1, 30),
(14, 1, 32),
(15, 1, 36),
(16, 1, 40),
(17, 1, 42),
(18, 1, 50),
(19, 1, 52),
(20, 1, 54),
(21, 2, 1),
(22, 2, 3),
(23, 2, 7),
(24, 2, 10),
(25, 2, 12),
(26, 2, 14),
(27, 2, 15),
(28, 2, 17),
(29, 2, 19),
(30, 2, 21),
(31, 2, 22),
(32, 2, 23),
(33, 2, 25),
(34, 2, 26),
(35, 2, 30),
(36, 2, 33),
(37, 2, 34),
(38, 2, 36),
(39, 2, 40),
(40, 2, 51),
(41, 3, 2),
(42, 3, 8),
(43, 3, 10),
(44, 3, 12),
(45, 3, 14),
(46, 3, 15),
(47, 3, 21),
(48, 3, 22),
(49, 3, 23),
(50, 3, 26),
(51, 3, 27),
(52, 3, 29),
(53, 3, 37),
(54, 3, 40),
(55, 3, 42),
(56, 3, 44),
(57, 3, 48),
(58, 3, 51),
(59, 3, 52),
(60, 3, 53),
(61, 4, 3),
(62, 4, 5),
(63, 4, 8),
(64, 4, 9),
(65, 4, 11),
(66, 4, 13),
(67, 4, 16),
(68, 4, 17),
(69, 4, 23),
(70, 4, 24),
(71, 4, 35),
(72, 4, 38),
(73, 4, 39),
(74, 4, 40),
(75, 4, 46),
(76, 4, 50),
(77, 4, 51),
(78, 4, 52),
(79, 4, 53),
(80, 4, 55),
(81, 5, 1),
(82, 5, 5),
(83, 5, 6),
(84, 5, 15),
(85, 5, 19),
(86, 5, 20),
(87, 5, 25),
(88, 5, 26),
(89, 5, 27),
(90, 5, 31),
(91, 5, 33),
(92, 5, 34),
(93, 5, 39),
(94, 5, 43),
(95, 5, 44),
(96, 5, 47),
(97, 5, 50),
(98, 5, 52),
(99, 5, 53),
(100, 5, 56),
(101, 6, 1),
(102, 6, 2),
(103, 6, 3),
(104, 6, 4),
(105, 6, 13),
(106, 6, 20),
(107, 6, 21),
(108, 6, 23),
(109, 6, 28),
(110, 6, 30),
(111, 6, 32),
(112, 6, 34),
(113, 6, 38),
(114, 6, 40),
(115, 6, 42),
(116, 6, 45),
(117, 6, 46),
(118, 6, 49),
(119, 6, 52),
(120, 6, 54),
(121, 7, 1),
(122, 7, 3),
(123, 7, 4),
(124, 7, 12),
(125, 7, 13),
(126, 7, 14),
(127, 7, 15),
(128, 7, 19),
(129, 7, 24),
(130, 7, 28),
(131, 7, 29),
(132, 7, 30),
(133, 7, 32),
(134, 7, 35),
(135, 7, 36),
(136, 7, 42),
(137, 7, 43),
(138, 7, 48),
(139, 7, 50),
(140, 7, 54),
(141, 8, 2),
(142, 8, 4),
(143, 8, 6),
(144, 8, 7),
(145, 8, 9),
(146, 8, 11),
(147, 8, 18),
(148, 8, 20),
(149, 8, 22),
(150, 8, 24),
(151, 8, 25),
(152, 8, 27),
(153, 8, 28),
(154, 8, 36),
(155, 8, 44),
(156, 8, 45),
(157, 8, 48),
(158, 8, 49),
(159, 8, 54),
(160, 8, 56),
(161, 9, 3),
(162, 9, 4),
(163, 9, 5),
(164, 9, 10),
(165, 9, 11),
(166, 9, 13),
(167, 9, 15),
(168, 9, 22),
(169, 9, 23),
(170, 9, 31),
(171, 9, 33),
(172, 9, 37),
(173, 9, 38),
(174, 9, 40),
(175, 9, 46),
(176, 9, 47),
(177, 9, 48),
(178, 9, 53),
(179, 9, 54),
(180, 9, 56),
(181, 10, 4),
(182, 10, 8),
(183, 10, 9),
(184, 10, 10),
(185, 10, 13),
(186, 10, 15),
(187, 10, 18),
(188, 10, 21),
(189, 10, 22),
(190, 10, 25),
(191, 10, 27),
(192, 10, 28),
(193, 10, 41),
(194, 10, 43),
(195, 10, 44),
(196, 10, 45),
(197, 10, 48),
(198, 10, 51),
(199, 10, 52),
(200, 10, 54),
(201, 11, 1),
(202, 11, 2),
(203, 11, 3),
(204, 11, 7),
(205, 11, 10),
(206, 11, 12),
(207, 11, 18),
(208, 11, 20),
(209, 11, 26),
(210, 11, 33),
(211, 11, 37),
(212, 11, 39),
(213, 11, 40),
(214, 11, 41),
(215, 11, 43),
(216, 11, 45),
(217, 11, 46),
(218, 11, 47),
(219, 11, 50),
(220, 11, 52),
(221, 12, 2),
(222, 12, 7),
(223, 12, 8),
(224, 12, 9),
(225, 12, 16),
(226, 12, 20),
(227, 12, 27),
(228, 12, 30),
(229, 12, 31),
(230, 12, 32),
(231, 12, 37),
(232, 12, 38),
(233, 12, 41),
(234, 12, 42),
(235, 12, 43),
(236, 12, 46),
(237, 12, 49),
(238, 12, 54),
(239, 12, 56),
(240, 12, 57),
(241, 13, 4),
(242, 13, 5),
(243, 13, 6),
(244, 13, 8),
(245, 13, 13),
(246, 13, 14),
(247, 13, 19),
(248, 13, 24),
(249, 13, 25),
(250, 13, 26),
(251, 13, 28),
(252, 13, 32),
(253, 13, 33),
(254, 13, 37),
(255, 13, 38),
(256, 13, 39),
(257, 13, 42),
(258, 13, 43),
(259, 13, 49),
(260, 13, 56),
(261, 14, 5),
(262, 14, 6),
(263, 14, 14),
(264, 14, 20),
(265, 14, 21),
(266, 14, 27),
(267, 14, 28),
(268, 14, 29),
(269, 14, 31),
(270, 14, 33),
(271, 14, 37),
(272, 14, 38),
(273, 14, 39),
(274, 14, 40),
(275, 14, 41),
(276, 14, 42),
(277, 14, 45),
(278, 14, 47),
(279, 14, 49),
(280, 14, 55),
(281, 15, 1),
(282, 15, 2),
(283, 15, 6),
(284, 15, 9),
(285, 15, 11),
(286, 15, 13),
(287, 15, 15),
(288, 15, 16),
(289, 15, 19),
(290, 15, 23),
(291, 15, 24),
(292, 15, 25),
(293, 15, 29),
(294, 15, 32),
(295, 15, 38),
(296, 15, 45),
(297, 15, 48),
(298, 15, 49),
(299, 15, 53),
(300, 15, 55),
(301, 16, 2),
(302, 16, 4),
(303, 16, 8),
(304, 16, 12),
(305, 16, 18),
(306, 16, 19),
(307, 16, 23),
(308, 16, 25),
(309, 16, 26),
(310, 16, 27),
(311, 16, 29),
(312, 16, 33),
(313, 16, 35),
(314, 16, 37),
(315, 16, 40),
(316, 16, 41),
(317, 16, 46),
(318, 16, 52),
(319, 16, 53),
(320, 16, 55),
(321, 17, 1),
(322, 17, 10),
(323, 17, 14),
(324, 17, 17),
(325, 17, 18),
(326, 17, 19),
(327, 17, 21),
(328, 17, 24),
(329, 17, 28),
(330, 17, 29),
(331, 17, 31),
(332, 17, 34),
(333, 17, 44),
(334, 17, 45),
(335, 17, 46),
(336, 17, 49),
(337, 17, 51),
(338, 17, 53),
(339, 17, 54),
(340, 17, 55),
(341, 18, 1),
(342, 18, 3),
(343, 18, 5),
(344, 18, 6),
(345, 18, 8),
(346, 18, 9),
(347, 18, 17),
(348, 18, 18),
(349, 18, 19),
(350, 18, 30),
(351, 18, 31),
(352, 18, 32),
(353, 18, 33),
(354, 18, 34),
(355, 18, 37),
(356, 18, 42),
(357, 18, 43),
(358, 18, 50),
(359, 18, 51),
(360, 18, 56),
(361, 19, 3),
(362, 19, 6),
(363, 19, 11),
(364, 19, 13),
(365, 19, 14),
(366, 19, 16),
(367, 19, 17),
(368, 19, 18),
(369, 19, 20),
(370, 19, 22),
(371, 19, 24),
(372, 19, 27),
(373, 19, 29),
(374, 19, 30),
(375, 19, 35),
(376, 19, 36),
(377, 19, 41),
(378, 19, 44),
(379, 19, 47),
(380, 19, 54),
(381, 20, 5),
(382, 20, 7),
(383, 20, 11),
(384, 20, 12),
(385, 20, 14),
(386, 20, 24),
(387, 20, 25),
(388, 20, 26),
(389, 20, 29),
(390, 20, 30),
(391, 20, 31),
(392, 20, 32),
(393, 20, 36),
(394, 20, 37),
(395, 20, 39),
(396, 20, 42),
(397, 20, 44),
(398, 20, 47),
(399, 20, 52),
(400, 20, 55),
(401, 21, 2),
(402, 21, 5),
(403, 21, 7),
(404, 21, 14),
(405, 21, 18),
(406, 21, 22),
(407, 21, 29),
(408, 21, 31),
(409, 21, 32),
(410, 21, 35),
(411, 21, 36),
(412, 21, 40),
(413, 21, 43),
(414, 21, 44),
(415, 21, 46),
(416, 21, 47),
(417, 21, 50),
(418, 21, 52),
(419, 21, 53),
(420, 21, 54),
(421, 22, 2),
(422, 22, 4),
(423, 22, 8),
(424, 22, 9),
(425, 22, 18),
(426, 22, 19),
(427, 22, 20),
(428, 22, 21),
(429, 22, 23),
(430, 22, 26),
(431, 22, 30),
(432, 22, 32),
(433, 22, 34),
(434, 22, 35),
(435, 22, 37),
(436, 22, 44),
(437, 22, 45),
(438, 22, 51),
(439, 22, 54),
(440, 22, 55),
(441, 23, 1),
(442, 23, 3),
(443, 23, 5),
(444, 23, 10),
(445, 23, 11),
(446, 23, 12),
(447, 23, 13),
(448, 23, 14),
(449, 23, 15),
(450, 23, 17),
(451, 23, 21),
(452, 23, 25),
(453, 23, 26),
(454, 23, 33),
(455, 23, 36),
(456, 23, 41),
(457, 23, 43),
(458, 23, 46),
(459, 23, 48),
(460, 23, 56),
(461, 24, 5),
(462, 24, 12),
(463, 24, 13),
(464, 24, 15),
(465, 24, 17),
(466, 24, 29),
(467, 24, 32),
(468, 24, 33),
(469, 24, 34),
(470, 24, 35),
(471, 24, 36),
(472, 24, 38),
(473, 24, 39),
(474, 24, 42),
(475, 24, 45),
(476, 24, 47),
(477, 24, 49),
(478, 24, 50),
(479, 24, 51),
(480, 24, 55),
(481, 25, 1),
(482, 25, 3),
(483, 25, 8),
(484, 25, 11),
(485, 25, 12),
(486, 25, 16),
(487, 25, 22),
(488, 25, 24),
(489, 25, 26),
(490, 25, 28),
(491, 25, 31),
(492, 25, 35),
(493, 25, 38),
(494, 25, 41),
(495, 25, 44),
(496, 25, 46),
(497, 25, 47),
(498, 25, 50),
(499, 25, 51),
(500, 25, 53),
(501, 26, 13),
(502, 26, 16),
(503, 26, 17),
(504, 26, 19),
(505, 26, 20),
(506, 26, 23),
(507, 26, 24),
(508, 26, 28),
(509, 26, 35),
(510, 26, 38),
(511, 26, 39),
(512, 26, 41),
(513, 26, 43),
(514, 26, 44),
(515, 26, 47),
(516, 26, 48),
(517, 26, 52),
(518, 26, 53),
(519, 26, 55),
(520, 26, 56),
(521, 27, 6),
(522, 27, 7),
(523, 27, 8),
(524, 27, 10),
(525, 27, 11),
(526, 27, 14),
(527, 27, 21),
(528, 27, 22),
(529, 27, 23),
(530, 27, 25),
(531, 27, 27),
(532, 27, 30),
(533, 27, 36),
(534, 27, 37),
(535, 27, 39),
(536, 27, 41),
(537, 27, 45),
(538, 27, 48),
(539, 27, 50),
(540, 27, 56),
(541, 28, 5),
(542, 28, 7),
(543, 28, 9),
(544, 28, 12),
(545, 28, 16),
(546, 28, 17),
(547, 28, 23),
(548, 28, 27),
(549, 28, 28),
(550, 28, 29),
(551, 28, 30),
(552, 28, 33),
(553, 28, 34),
(554, 28, 35),
(555, 28, 39),
(556, 28, 40),
(557, 28, 43),
(558, 28, 48),
(559, 28, 51),
(560, 28, 53),
(561, 29, 2),
(562, 29, 4),
(563, 29, 6),
(564, 29, 7),
(565, 29, 12),
(566, 29, 16),
(567, 29, 18),
(568, 29, 21),
(569, 29, 22),
(570, 29, 34),
(571, 29, 35),
(572, 29, 39),
(573, 29, 41),
(574, 29, 45),
(575, 29, 46),
(576, 29, 48),
(577, 29, 49),
(578, 29, 51),
(579, 29, 55),
(580, 29, 56),
(581, 30, 4),
(582, 30, 6),
(583, 30, 8),
(584, 30, 9),
(585, 30, 10),
(586, 30, 11),
(587, 30, 16),
(588, 30, 17),
(589, 30, 18),
(590, 30, 19),
(591, 30, 20),
(592, 30, 25),
(593, 30, 31),
(594, 30, 34),
(595, 30, 36),
(596, 30, 38),
(597, 30, 49),
(598, 30, 50),
(599, 30, 55),
(600, 30, 56);

-- --------------------------------------------------------

--
-- Table structure for table `reponses`
--

CREATE TABLE `reponses` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `reponse` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sujets`
--

CREATE TABLE `sujets` (
  `id` int(11) NOT NULL,
  `nom_sujet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sujets`
--

INSERT INTO `sujets` (`id`, `nom_sujet`) VALUES
(1, 'Introduction'),
(2, 'Web Pages And Servers'),
(3, 'HTML and Programming'),
(4, 'Programming Environment'),
(5, 'The Job of HTML'),
(6, 'Markup'),
(7, 'Breaks And Empty Elements'),
(8, 'Paragraph'),
(9, 'Lots of elements'),
(10, 'Nested elements'),
(11, 'Block and inline'),
(12, 'Lists and implied close tags'),
(13, 'Web addresses, or URLs'),
(14, 'Links and a tag'),
(15, 'Adding images'),
(16, 'Files and relative URLs'),
(17, 'Page structure'),
(18, 'Validating HTML');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom_prenom` varchar(255) NOT NULL,
  `classe` varchar(64) NOT NULL,
  `date_inscrit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `passwd` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nom_prenom`, `classe`, `date_inscrit`, `active`, `passwd`) VALUES
(1, 'ادم ابن جعفر', '2TI', '2021-01-11 14:23:38', 1, '1'),
(2, 'ادم موسى', '2TI', '2021-01-11 14:23:38', 1, '2'),
(3, 'ادم خليفة المهيري', '2TI', '2021-01-11 14:23:38', 1, '3'),
(4, 'احمــــد خـــدروف', '2TI', '2021-01-11 14:23:38', 1, '4'),
(5, 'امير بوجناح', '2TI', '2021-01-11 14:23:38', 1, '5'),
(6, 'ايــمن سليـــم', '2TI', '2021-01-11 14:23:38', 1, '6'),
(7, 'ايمن الفلاح', '2TI', '2021-01-11 14:23:38', 1, '7'),
(8, 'احمد عمار', '2TI', '2021-01-11 14:23:38', 1, '8'),
(9, 'ايوب مليكة', '2TI', '2021-01-11 14:23:38', 1, '9'),
(10, 'اسامة المهيري', '2TI', '2021-01-11 14:23:38', 1, '10'),
(11, 'حامد ماني', '2TI', '2021-01-11 14:23:38', 1, '11'),
(12, 'رسـلان الغرزول', '2TI', '2021-01-11 14:23:38', 1, '12'),
(13, 'سيف الدين جغام', '2TI', '2021-01-11 14:23:38', 1, '13'),
(14, 'عمر الشريف', '2TI', '2021-01-11 14:23:38', 1, '14'),
(15, 'عبد الرحيم المهيري', '2TI', '2021-01-11 14:23:38', 1, '15'),
(16, 'علي القدر', '2TI', '2021-01-11 14:23:38', 1, '16'),
(17, 'فراس الجديدي', '2TI', '2021-01-11 14:23:38', 1, '17'),
(18, 'لــــوي جغـــام', '2TI', '2021-01-11 14:23:38', 1, '18'),
(19, 'محمد امين قسومة', '2TI', '2021-01-11 14:23:38', 1, '19'),
(20, 'محمد امين مزقـو', '2TI', '2021-01-11 14:23:38', 1, '20'),
(21, 'محمد امين مسلم', '2TI', '2021-01-11 14:23:38', 1, '21'),
(22, 'محمد سعيد ستوفة الساقجي', '2TI', '2021-01-11 14:23:38', 1, '22'),
(23, 'محمد عزيز الفرجاني', '2TI', '2021-01-11 14:23:38', 1, '23'),
(24, 'محمـد الخـراط', '2TI', '2021-01-11 14:23:38', 1, '24'),
(25, 'منتصر الحشفي', '2TI', '2021-01-11 14:23:38', 1, '25'),
(26, 'مهدي اللطيف', '2TI', '2021-01-11 14:23:38', 1, '26'),
(27, 'محمد عزيـز بونعجـة', '2TI', '2021-01-11 14:23:38', 1, '27'),
(28, 'مـحـمـد سالـم قـــرطـاس', '2TI', '2021-01-11 14:23:38', 1, '28'),
(29, 'ويام التونسي', '2TI', '2021-01-11 14:23:38', 1, '29'),
(30, 'يوسف رجب', '2TI', '2021-01-11 14:23:38', 1, '30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions_users`
--
ALTER TABLE `questions_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reponses`
--
ALTER TABLE `reponses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sujets`
--
ALTER TABLE `sujets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `questions_users`
--
ALTER TABLE `questions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;
--
-- AUTO_INCREMENT for table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sujets`
--
ALTER TABLE `sujets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
