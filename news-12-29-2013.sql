
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `news-12-29-2013`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL,
  `parent` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'Music', 1),
(2, 'Fashion', 1),
(3, 'Rock', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cat_relate`
--

CREATE TABLE IF NOT EXISTS `cat_relate` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) NOT NULL,
  `child_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cat_relate`
--

INSERT INTO `cat_relate` (`id`, `parent_id`, `child_id`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE IF NOT EXISTS `stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(6) NOT NULL,
  `poster_id` smallint(6) NOT NULL,
  `dateposted` datetime NOT NULL,
  `subject` varchar(50) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `cat_id`, `poster_id`, `dateposted`, `subject`, `body`) VALUES
(1, 3, 3, '2013-12-29 01:02:50', 'Rock music getting more popular', 'With the huge push toward\r\nmetal and nu-metal, rock\r\nmusic is also sharing in the\r\nwinnings. Bands still popular\r\nfrom the late ‘60s are reporting\r\nsurges in record sales.\r\nThe true test is whether this\r\npopularity can be sustained\r\nor whether it is simply a fad.\r\nOnly time will tell.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `level`) VALUES
(1, 'guest', '5f4dcc3b5aa765d61d8327deb882cf99', 0),
(2, 'user', '5f4dcc3b5aa765d61d8327deb882cf99', 1),
(3, 'superuser', 'password', 10);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
