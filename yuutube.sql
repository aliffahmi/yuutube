-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2021 at 04:25 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yuutube`
--

-- --------------------------------------------------------

--
-- Table structure for table `channel_subs`
--

CREATE TABLE `channel_subs` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `subscribers` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `channel_subs`
--

INSERT INTO `channel_subs` (`id`, `channel_id`, `subscribers`) VALUES
(2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `playlistuser`
--

CREATE TABLE `playlistuser` (
  `playlist_id` int(11) NOT NULL,
  `playlist_name` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlistuser`
--

INSERT INTO `playlistuser` (`playlist_id`, `playlist_name`, `user_id`) VALUES
(4, 'good', 1),
(5, 'haha', 3);

-- --------------------------------------------------------

--
-- Table structure for table `playlistvideo`
--

CREATE TABLE `playlistvideo` (
  `id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlistvideo`
--

INSERT INTO `playlistvideo` (`id`, `playlist_id`, `video_id`) VALUES
(4, 5, 2),
(6, 4, 1),
(7, 4, 38);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userpassword` varchar(255) NOT NULL,
  `displayName` varchar(255) NOT NULL,
  `subscriber` int(11) NOT NULL DEFAULT 0,
  `loggedin` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `username`, `userpassword`, `displayName`, `subscriber`, `loggedin`) VALUES
(1, 'dtfteh@gmail.com', 'kktehkaikeat', 'password123', 'slyphnford', 0, 0),
(2, 'atyff@gmail.com', 'mohammadatif', 'funnyguy', 'atyff', 1000, 0),
(3, 'patricia@gmail.com', 'Patricia', 'patricia', 'rain', 1, 0),
(4, 'slyphnford@gmail.com', 'Slyphnford', 'slyphnford', 'slyphnford', 0, 0),
(5, 'chancheeseng@gmail.com', 'Prof Chan', 'profchan', 'prof chan', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL DEFAULT 0,
  `video_id` int(255) NOT NULL DEFAULT 1,
  `liked` tinyint(2) NOT NULL DEFAULT 0,
  `disliked` tinyint(2) NOT NULL DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_history`
--

INSERT INTO `user_history` (`id`, `user_id`, `video_id`, `liked`, `disliked`, `comment`) VALUES
(4, 3, 1, 1, 0, NULL),
(5, 3, 1, 1, 0, NULL),
(6, 3, 1, 1, 0, NULL),
(7, 1, 1, 0, 1, NULL),
(8, 1, 1, 0, 1, NULL),
(9, 1, 1, 0, 0, 'very good experience'),
(10, 1, 36, 1, 0, NULL),
(11, 1, 38, 0, 0, NULL),
(12, 1, 38, 0, 0, NULL),
(13, 1, 38, 0, 0, 'mother father gentleman'),
(14, 5, 25, 1, 0, NULL),
(15, 5, 25, 0, 0, 'very good 2021'),
(16, 5, 25, 0, 0, 'nice video'),
(17, 5, 25, 0, 0, 'nice');

-- --------------------------------------------------------

--
-- Table structure for table `user_subs`
--

CREATE TABLE `user_subs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 1,
  `channel_user_id` int(11) NOT NULL DEFAULT 1,
  `subscribed` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_subs`
--

INSERT INTO `user_subs` (`id`, `user_id`, `channel_user_id`, `subscribed`) VALUES
(2, 1, 1, 0),
(3, 1, 2, 0),
(4, 1, 2, 0),
(5, 1, 3, 1),
(6, 5, 3, 0),
(7, 5, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `video_id` int(255) NOT NULL,
  `videoName` varchar(255) NOT NULL,
  `videoLikeCount` int(20) NOT NULL DEFAULT 0,
  `videoDislikeCount` int(20) NOT NULL DEFAULT 0,
  `videoViewCount` int(20) NOT NULL DEFAULT 0,
  `videoURL` varchar(255) NOT NULL,
  `videoCategory` varchar(255) NOT NULL,
  `video_length` varchar(10) DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`video_id`, `videoName`, `videoLikeCount`, `videoDislikeCount`, `videoViewCount`, `videoURL`, `videoCategory`, `video_length`, `user_id`) VALUES
(1, 'Avengers Assemble', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Film & Animation\\Avengers Assemble.mp4', 'Film & Animation', '230', 1),
(2, 'How about another joke', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Film & Animation\\Avengers Assemble.mp4', 'Film & Animation', '297', 2),
(3, 'Kung Fu Panda ', 10, 0, 100, 'C:\\Users\\User\\Desktop\\videofile\\Film & Animation\\Kungfu Panda.mp4', 'Film & Animation', '199', 3),
(4, 'One Punch Man', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Film & Animation\\One Punch Man.mp4', 'Film & Animation', '53', 4),
(5, 'Bat V Super', 0, 0, 1, 'C:\\Users\\User\\Desktop\\videofile\\Film & Animation\\Bat V Super.mp4', 'Film & Animation', '234', 1),
(6, 'Greatest Sports Moments', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Sports\\Greatest Sports Moments.mp4', 'Sports', '789', 1),
(7, 'Rare Goals in Football', 15, 0, 150, 'C:\\Users\\User\\Desktop\\videofile\\Sports\\Rare Goals in Football.mp4', 'Sports', '533', 2),
(8, 'Top ten badminton save', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Sports\\Top ten badminton save.mp4', 'Sports', '305', 3),
(9, 'Top ten Dunks of Decade', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Sports\\Top 10 Dunks of The Decade.mp4', 'Sports', '198', 3),
(10, 'RowWorld Cup 2019', 0, 0, 1, 'C:\\Users\\User\\Desktop\\videofile\\Sports\\RowWorld Cup 2019.mp4', 'Sports', '264', 4),
(11, 'PUBG Montage', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Gaming\\PUBG Montage.mp4', 'Gaming', '228', 1),
(12, 'Valorant Montage', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Gaming\\Valorant Montage.mp4', 'Gaming', '374', 2),
(13, 'Among Us Montage', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Gaming\\Among Us.mp4', 'Gaming', '447', 3),
(14, 'Wild Rift Montage', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Gaming\\Wild Rift Montage.mp4', 'Gaming', '168', 4),
(15, 'The Last Of Us Gameplay', 0, 0, 1, 'C:\\Users\\User\\Desktop\\videofile\\Gaming\\The Last Of Us Gameplay.mp4', 'Gaming', '433', 1),
(16, 'Coffin Dance', 0, 0, 2, 'C:\\Users\\User\\Desktop\\videofile\\Entertainment\\Coffin Dance.mp4', 'Entertainment', '155', 1),
(17, 'Every programming tutorial', 20, 0, 200, 'C:\\Users\\User\\Desktop\\videofile\\Entertainment\\Every programming tutorial.mp4', 'Entertainment', '28', 2),
(18, 'Sorting Algorithms', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Entertainment\\Sorting Algorithms.mp4', 'Entertainment', '349', 3),
(19, 'Grim Reaper Prank', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Entertainment\\Grim Reaper Prank.mp4', 'Entertainment', '81', 4),
(20, 'THE CONJURING 2 prank', 0, 0, 1, 'C:\\Users\\User\\Desktop\\videofile\\Entertainment\\THE CONJURING 2 prank.mp4', 'Entertainment', '146', 1),
(21, 'Ethiopia\'s political crisis intensifies', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\News & Politics\\Ethiopia\'s political crisis intensifies.mp4', 'News & Politics', '257', 1),
(22, 'The political divide of COVID-19', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\News & Politics\\The political divide of COVID-19.mp4', 'News & Politics', '583', 2),
(23, 'Trump and America', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\News & Politics\\Trump and America.mp4', 'News & Politics', '236', 3),
(24, 'Raya visit', 0, 0, 1, 'C:\\Users\\User\\Desktop\\videofile\\News & Politics\\Raya visit.mp4', 'News & Politics', '189', 4),
(25, 'How 2021 celebrated', 31, 0, 300, 'C:\\Users\\User\\Desktop\\videofile\\News & Politics\\2021 celebrated.mp4', 'News & Politics', '179', 3),
(26, 'The Science of Laziness', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Science & Technology\\The Science of Laziness.mp4', 'Science & Technology', '157', 1),
(27, 'The Science of Productivity', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Science & Technology\\The Science of Productivity.mp4', 'Science & Technology', '195', 2),
(28, 'Loneliness', 0, 0, 1, 'C:\\Users\\User\\Desktop\\videofile\\Science & Technology\\Loneliness.mp4', 'Science & Technology', '749', 3),
(29, 'Evolution of Display Technology', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Science & Technology\\Evolution of Display Technology.mp4', 'Science & Technology', '881', 4),
(30, 'The END of Silicon & Future of Computing', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Science & Technology\\The END of Silicon & Future of Computing.mp4', 'Science & Technology', '665', 1),
(31, 'What\'s Education For?', 0, 0, 1, 'C:\\Users\\User\\Desktop\\videofile\\Education\\What\'s Education For.mp4', 'Education', '223', 1),
(32, '6 Problems with our School System', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Education\\What\'s Education For.mp4', 'Education', '356', 2),
(33, 'Why is education important?', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Education\\Why is education important.mp4', 'Education', '200', 3),
(34, 'High School Fitness (1962)', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Education\\High School Fitness.mp4', 'Education', '69', 4),
(35, 'Teaching in the US', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Education\\Teaching in the US.mp4', 'Education', '278', 2),
(36, 'BTS Official MV', 1, 0, 2, 'C:\\Users\\User\\Desktop\\videofile\\Music\\BTS Official MV.mp4', 'Music', '223', 1),
(37, 'TONES AND I - DANCE MONKEY', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Music\\TONES AND I - DANCE MONKEY.mp4', 'Music', '236', 2),
(38, 'PSY - GENTLEMAN MV', 0, 0, 2, 'C:\\Users\\User\\Desktop\\videofile\\Music\\PSY - GENTLEMAN MV.mp4', 'Music', '233', 3),
(39, 'OneRepublic - Counting Stars', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Music\\OneRepublic - Counting Stars.mp4', 'Music', '283', 4),
(40, 'Ed Sheeran - Shape of You', 0, 0, 0, 'C:\\Users\\User\\Desktop\\videofile\\Music\\Ed Sheeran - Shape of You.mp4', 'Music', '263', 3);

-- --------------------------------------------------------

--
-- Table structure for table `video_details`
--

CREATE TABLE `video_details` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT 1,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video_details`
--

INSERT INTO `video_details` (`id`, `video_id`, `comment`, `user_id`) VALUES
(1, 1, 'Hello', 3),
(2, 1, 'very good experience', 1),
(3, 38, 'mother father gentleman', 1),
(4, 25, 'very good 2021', 5),
(5, 25, 'nice video', 5),
(6, 25, 'nice', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channel_subs`
--
ALTER TABLE `channel_subs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `playlistuser`
--
ALTER TABLE `playlistuser`
  ADD PRIMARY KEY (`playlist_id`);

--
-- Indexes for table `playlistvideo`
--
ALTER TABLE `playlistvideo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);
ALTER TABLE `user` ADD FULLTEXT KEY `displayName` (`displayName`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `video_id` (`video_id`) USING BTREE;

--
-- Indexes for table `user_subs`
--
ALTER TABLE `user_subs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`);
ALTER TABLE `video` ADD FULLTEXT KEY `videoName` (`videoName`);

--
-- Indexes for table `video_details`
--
ALTER TABLE `video_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channel_subs`
--
ALTER TABLE `channel_subs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `playlistuser`
--
ALTER TABLE `playlistuser`
  MODIFY `playlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `playlistvideo`
--
ALTER TABLE `playlistvideo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_subs`
--
ALTER TABLE `user_subs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `video_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `video_details`
--
ALTER TABLE `video_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
