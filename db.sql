/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - ila
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ila` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ila`;

/*Table structure for table `experts` */

DROP TABLE IF EXISTS `experts`;

CREATE TABLE `experts` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `exp_name` varchar(20) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `experts` */

insert  into `experts`(`exp_id`,`lid`,`exp_name`,`experience`,`gender`,`place`,`phone`,`email`) values 
(8,19,'angelina','40','MALE','calicut',7234567898,'angell@gmail.com'),
(9,20,'shibin','55','MALE','wayanad',9645667668,'shibinka@gmail.com'),
(10,22,'aby pious','10','MALE','mgdi',9876543215,'hdfgh4@gmail.com');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `f_b_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_f_b` text,
  `f_b_date` date NOT NULL,
  PRIMARY KEY (`f_b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`f_b_id`,`user_id`,`parent_f_b`,`f_b_date`) values 
(1,4,'assaaas','2022-02-09'),
(2,5,'ghjk','2022-02-11'),
(3,6,'gl','2022-02-18'),
(4,5,'sdfghj','2022-02-27'),
(5,8,'gfh','2022-02-21'),
(6,21,'hggg','2022-02-15'),
(7,23,'ffffff','2022-02-16');

/*Table structure for table `guidance` */

DROP TABLE IF EXISTS `guidance`;

CREATE TABLE `guidance` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `exp_id` int(11) NOT NULL,
  `g_info` text NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `guidance` */

/*Table structure for table `interaction` */

DROP TABLE IF EXISTS `interaction`;

CREATE TABLE `interaction` (
  `intr_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `questions` varchar(500) NOT NULL,
  `exp_id` int(11) NOT NULL,
  `intr_date` varchar(20) NOT NULL,
  `intr_time` varchar(20) NOT NULL,
  PRIMARY KEY (`intr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `interaction` */

insert  into `interaction`(`intr_id`,`user_id`,`questions`,`exp_id`,`intr_date`,`intr_time`) values 
(1,4,'question',2,'2022-02-18','10:30:00'),
(2,4,'aby',2,'2022-02-10','00:00:10'),
(3,21,'ghhhd',20,'2022-02-15','17:37:35'),
(4,21,'hhhhd',19,'2022-02-15','17:37:39'),
(5,23,'sssss',19,'2022-02-16','11:27:07'),
(6,23,'mmdjjd',19,'2022-02-16','11:36:25'),
(7,23,'aaaaaaa',20,'2022-02-16','11:38:22');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`user_id`,`user_name`,`password`,`user_type`) values 
(1,'User','pass','Admin'),
(2,'aby','pious','Expert'),
(4,'ajay','mndy','Parent'),
(6,'a','a','Admin'),
(7,'sdsaagsd','SdddD3dd','expert'),
(8,'sdsaagsd','SDfffddf4ff','expert'),
(9,'sdsaagsd','Sddddf4f','expert'),
(10,'shibin','Shibin123','expert'),
(11,'vimal krishna','Asdd23@ghj','expert'),
(12,'sdsaagsd','aB852@#DFGH','expert'),
(13,'sdsaagsd','aSDFGHJ852@#','expert'),
(14,'shibin','Asdfghjkl963@#','expert'),
(15,'shibin','Asdfgh52@#','expert'),
(19,'shibin','Afghj63@#','expert'),
(20,'shibin','Shibin58','expert'),
(21,'naveen','naveen@','user'),
(22,'abyjhvyt','Asdf5@fw','expert'),
(23,'abhi','Abhi@123','user');

/*Table structure for table `medical_report` */

DROP TABLE IF EXISTS `medical_report`;

CREATE TABLE `medical_report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `report_info` text NOT NULL,
  `exp_id` int(11) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `medical_report` */

insert  into `medical_report`(`report_id`,`user_id`,`report_info`,`exp_id`) values 
(1,4,'report.pub',2),
(2,23,'storage_emulated_0_Snapseed_IMG_20210606',20),
(3,23,'storage_emulated_0_Snapseed_IMG_20210606',19),
(4,23,'storage_emulated_0_Snapseed_IMG_20210606',20),
(5,23,'storage_emulated_0_DCIM_Camera_IMG_20220',19),
(6,23,'storage_emulated_0_DCIM_Camera_IMG_20220215_201942.jpg',19),
(7,23,'storage_emulated_0_DCIM_Camera_IMG_20220215_195024.jpg',19);

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` text NOT NULL,
  `mat_type` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `questions` */

insert  into `questions`(`id`,`file`,`mat_type`) values 
(1,'1.mp4','music'),
(2,'2.mp4','audio'),
(3,'3.mp4','video');

/*Table structure for table `responce` */

DROP TABLE IF EXISTS `responce`;

CREATE TABLE `responce` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `intr_id` int(11) NOT NULL,
  `res_info` text NOT NULL,
  `res_date` varchar(20) NOT NULL,
  `res_time` varchar(20) NOT NULL,
  PRIMARY KEY (`res_id`,`intr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `responce` */

insert  into `responce`(`res_id`,`intr_id`,`res_info`,`res_date`,`res_time`) values 
(1,2,'tfyrtruy','2022-02-09','21:06:00'),
(2,1,'gfg','2022-02-09','11:14:39'),
(3,3,'qwertyu','2022-02-15','17:41:25'),
(4,7,'aaa ok','2022-02-16','2022-02-16 11:38:40');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `std_id` int(11) NOT NULL AUTO_INCREMENT,
  `std_name` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phone_no` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`std_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`std_id`,`std_name`,`dob`,`place`,`gender`,`phone_no`,`description`,`user_id`) values 
(1,'ajay','2000-5-6','mndy','male',9876543210,'wertgyuiop[',4),
(2,'ebin','2000','m','m',984563214,'ghjm',6),
(3,'naveen','21-04-1993','kkm','Male',9876543210,'kkkk',21),
(4,'abhi','01/01/2000','pnmrm','Male',987654321,'gd',23);

/*Table structure for table `study_materials` */

DROP TABLE IF EXISTS `study_materials`;

CREATE TABLE `study_materials` (
  `std_mat_id` int(11) NOT NULL AUTO_INCREMENT,
  `std_mat_info` varchar(500) NOT NULL,
  `up_date` varchar(20) NOT NULL,
  `exp_id` int(11) NOT NULL,
  `mat_type` varchar(50) NOT NULL,
  PRIMARY KEY (`std_mat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `study_materials` */

insert  into `study_materials`(`std_mat_id`,`std_mat_info`,`up_date`,`exp_id`,`mat_type`) values 
(1,'adbkey.pub','2022-02-08',2,'image'),
(2,'android.py','2022-02-16',20,'image'),
(3,'VID_20220202_163543.mp4','2022-02-16',20,'video');

/*Table structure for table `tips` */

DROP TABLE IF EXISTS `tips`;

CREATE TABLE `tips` (
  `tips_id` int(11) NOT NULL AUTO_INCREMENT,
  `tips_info` text,
  `exp_id` int(11) NOT NULL,
  PRIMARY KEY (`tips_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tips` */

insert  into `tips`(`tips_id`,`tips_info`,`exp_id`) values 
(3,'qwertyu',2),
(4,'never trust any body\r\nbut do love',2),
(5,'always follow your dreems ',2),
(6,'what you thinking',20);

/*Table structure for table `video_frame` */

DROP TABLE IF EXISTS `video_frame`;

CREATE TABLE `video_frame` (
  `v_f_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `ratio` float DEFAULT NULL,
  `std_id` int(11) NOT NULL,
  PRIMARY KEY (`v_f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Data for the table `video_frame` */

insert  into `video_frame`(`v_f_id`,`id`,`ratio`,`std_id`) values 
(1,1,0.166667,1),
(2,2,0,1),
(3,3,0.333333,1),
(4,1,0.5,1),
(5,2,0.5,1),
(6,3,1,1),
(7,1,0.833333,1),
(8,2,1,1),
(9,3,1,1),
(10,1,1,2),
(11,2,1,2),
(12,3,1,2),
(13,1,1,2),
(14,2,1,2),
(15,3,0.8,2),
(16,1,0.8,1),
(17,2,0.666667,1),
(18,3,1,1),
(19,1,0,1),
(20,2,0,1),
(21,3,0,1),
(22,1,0,1),
(23,2,0,1),
(24,3,0,1),
(25,1,0,1),
(26,2,0,1),
(27,3,0,1),
(28,1,1,1),
(29,2,0,1),
(30,3,1,1),
(31,1,0,1),
(32,2,0,1),
(33,3,0,1),
(34,1,1,1),
(35,2,0,1),
(36,3,0,1),
(37,1,0,1),
(38,2,0,1),
(39,3,0,1),
(40,1,1,1),
(41,2,0,1),
(42,3,0,1),
(43,1,0.833333,2),
(44,2,1,2),
(45,3,1,2),
(46,1,1,3),
(47,2,0.833333,3),
(48,3,1,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
