/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.5.5-10.1.21-MariaDB : Database - ebay_auction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ebay_auction` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ebay_auction`;

/*Table structure for table `agents` */

DROP TABLE IF EXISTS `agents`;

CREATE TABLE `agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `found_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `agents_name_unique` (`name`),
  KEY `agents_found_by_foreign` (`found_by`),
  CONSTRAINT `agents_found_by_foreign` FOREIGN KEY (`found_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `agents` */

insert  into `agents`(`id`,`name`,`address`,`phone`,`found_by`,`created_at`,`updated_at`) values (1,'Kinleigh Folkard & Hayward - Brockley','322 Brockley Road, Brockley, SE4 2BT','020 8022 6671',1,'2017-05-24 02:41:16','2017-05-24 02:41:16'),(2,'Proper Local, E14','Proper Local, E14','020 3858 2655',1,'2017-05-24 03:47:08','2017-05-24 03:47:08'),(3,'Urban Spaces','The Greene House, 63-65 Goldney Road, London, W9 2AR','020 3463 2613',1,'2017-05-24 03:47:11','2017-05-24 03:47:11'),(4,'Knight Frank - New Homes, New Homes Prime Team','Knight Frank - New Homes, New Homes Prime Team','020 3858 3536',1,'2017-05-29 04:05:24','2017-05-29 04:05:24'),(5,'Blundells, Woodseats','Blundells, Woodseats','0114 467 1649',1,'2017-05-29 15:26:44','2017-05-29 15:26:44');

/*Table structure for table `domains` */

DROP TABLE IF EXISTS `domains`;

CREATE TABLE `domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domains_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `domains` */

insert  into `domains`(`id`,`name`,`created_at`,`updated_at`) values (1,'ebay.com','2017-05-06 22:31:14','2017-05-06 22:31:14'),(2,'ebay.co.uk','2017-05-06 22:50:04','2017-05-06 22:50:04'),(3,'onthemarket.com','2017-05-24 02:41:16','2017-05-24 02:41:16'),(4,'rightmove.co.uk','2017-05-24 03:47:08','2017-05-24 03:47:08'),(5,'zoopla.co.uk','2017-05-24 03:47:11','2017-05-24 03:47:11');

/*Table structure for table `histories` */

DROP TABLE IF EXISTS `histories`;

CREATE TABLE `histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `bidders` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `histories_item_id_foreign` (`item_id`),
  CONSTRAINT `histories_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `histories` */

insert  into `histories`(`id`,`item_id`,`price`,`bidders`,`title`,`description`,`created_at`,`updated_at`) values (1,1,'GBP 205.00',16,'Details about   Canyon Ultimate AL f8 2012 road bike. Dura Ace/Ultegra.','','2017-05-06 22:31:15','2017-05-06 22:31:15'),(2,1,'GBP 305.00',19,'Details about   Canyon Ultimate AL f8 2012 road bike. Dura Ace/Ultegra.','','2017-05-06 22:32:19','2017-05-06 22:32:19'),(3,2,'£205.00',12,'Details about   Canyon Ultimate AL f8 2012 road bike. Dura Ace/Ultegra.','','2017-05-06 22:50:04','2017-05-06 22:50:04'),(4,2,'£305.00',16,'Details about   Canyon Ultimate AL f8 2012 road bike. Dura Ace/Ultegra.','','2017-05-06 22:51:30','2017-05-06 22:51:30'),(5,2,'£298.32',18,'Details about   Canyon Ultimate AL f8 2012 road bike. Dura Ace/Ultegra.','','2017-05-06 23:11:33','2017-05-06 23:11:33'),(6,2,'£305.00',18,'Details about   Canyon Ultimate AL f8 2012 road bike. Dura Ace/Ultegra.','','2017-05-06 23:25:34','2017-05-06 23:25:34'),(7,2,'£305.00',19,'Details about   Canyon Ultimate AL f8 2012 road bike. Dura Ace/Ultegra.','','2017-05-06 23:26:56','2017-05-06 23:26:56'),(8,3,'£217.50',6,'Details about   Vintage PINARELLO Road Bike with Shimano Ultegra Mavic','','2017-05-08 01:04:59','2017-05-08 01:04:59'),(9,3,'£226.50',8,'Details about   Vintage PINARELLO Road Bike with Shimano Ultegra Mavic','','2017-05-08 01:23:44','2017-05-08 01:23:44'),(10,4,'GBP 226.50',8,'Details about   Vintage PINARELLO Road Bike with Shimano Ultegra Mavic','','2017-05-08 02:03:58','2017-05-08 02:03:58');

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `found_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `items_domain_id_foreign` (`domain_id`),
  KEY `items_found_by_foreign` (`found_by`),
  CONSTRAINT `items_domain_id_foreign` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`),
  CONSTRAINT `items_found_by_foreign` FOREIGN KEY (`found_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `items` */

insert  into `items`(`id`,`domain_id`,`ref`,`found_by`,`created_at`,`updated_at`) values (1,1,'172648073173',1,'2017-05-06 22:31:15','2017-05-06 22:31:15'),(2,2,'172648073173',1,'2017-05-06 22:50:04','2017-05-06 22:50:04'),(3,2,'292083189107',1,'2017-05-08 01:04:59','2017-05-08 01:04:59'),(4,1,'292083189107',1,'2017-05-08 02:03:58','2017-05-08 02:03:58');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`migration`,`batch`) values ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2017_05_06_185549_create_domains_table',2),('2017_05_06_194849_create_items_table',3),('2017_05_06_202436_create_histories_table',4),('2017_05_08_192534_change_description_to_longtext_in_histories',5),('2017_05_24_004853_create_agent_table',6),('2017_05_24_005741_create_properties_table',7),('2017_05_24_011143_create_property_histories_table',8);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `properties` */

DROP TABLE IF EXISTS `properties`;

CREATE TABLE `properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `properties_domain_id_foreign` (`domain_id`),
  KEY `properties_created_by_foreign` (`created_by`),
  KEY `properties_updated_by_foreign` (`updated_by`),
  CONSTRAINT `properties_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `properties_domain_id_foreign` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`),
  CONSTRAINT `properties_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `properties` */

insert  into `properties`(`id`,`domain_id`,`ref`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (2,3,'3804781',1,1,'2017-05-24 02:43:44','2017-05-24 02:43:44'),(3,4,'59024290',1,1,'2017-05-24 03:47:08','2017-05-24 03:47:08'),(4,5,'43570361',1,1,'2017-05-24 03:47:11','2017-05-24 03:47:11'),(5,4,'59950192',1,1,'2017-05-29 04:05:24','2017-05-29 04:05:24'),(6,4,'66385436',1,1,'2017-05-29 15:26:44','2017-05-29 15:26:44');

/*Table structure for table `property_histories` */

DROP TABLE IF EXISTS `property_histories`;

CREATE TABLE `property_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `price_data` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address/subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `features` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `property_histories_property_id_foreign` (`property_id`),
  KEY `property_histories_agent_id_foreign` (`agent_id`),
  KEY `property_histories_created_by_foreign` (`created_by`),
  KEY `property_histories_updated_by_foreign` (`updated_by`),
  CONSTRAINT `property_histories_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  CONSTRAINT `property_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `property_histories_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `property_histories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `property_histories` */

insert  into `property_histories`(`id`,`property_id`,`agent_id`,`price`,`currency`,`price_data`,`title`,`address/subtitle`,`features`,`description`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,2,1,'389,000','','','1 bedroom flat for sale','Breakspears Road, Brockley, SE4','One bedroom\nLarge communal garden\nKitchen\nBathroom\nLight and airy\nFirst floor\nBuilding newly painted\nEPC rating D','This beautifully presented one bedroom apartment is located on this popular road in the Brockley conservation area and offers easy access to St Johns station and Farmers market.','',1,1,'2017-05-24 03:20:16','2017-05-24 03:20:16'),(2,3,2,'£680,000','','','1 bedroom flat for sale','London City Island,','One bedroom\n548 sq ft\n10th floor, east facing\nOff-plan sale\nWater views\nOn-site grocer and residents\' lounge\nGym, pool and 24 hour concierge\nCompletion Q4 2018-Q1 2019','Full description\n	An off-plan one bedroom apartment at London City Island - the Capital\'s mini Manhattan.\n\nSituated on the 10th floor of Dawsonne House, this east-facing apartment will benefit from great views over the River Lea towards the Thames. Arranged over 548 sq ft, accommodation comprises reception room with floor-to-ceiling windows, open-plan to a stylish kitchen, one double bedroom and a bathroom with Jack and Jill doors. A balcony runs from the reception.\n\nAll of the Island\'s residents become members of the City Island Arts Club, including the use of a 24 hour concierge and extensive clubhouse with pool table, gymnasium, spa, treatment rooms, swimming pool, on-site grocer & deli. On completion London City Island will also be home to English National Ballet and the London Film School.\n\nLondon City Island connects directly to Canning Town station via a newly-built footbridge and opens up the capital - east, central and west - via the DLR or Jubilee line. Directly-accessible destinations include Canary Wharf (4 mins), London Bridge (10 mins), Westminster (15 mins), Bond Street (20 mins), Stratford (7 mins) and London City Airport (7 mins).\n\nCompletion Q4 2018 - Q1 2019.\n\nPhotos shown are an indication of specification only.\n\nPredicted EPC: B','',1,1,'2017-05-11 03:47:08','2017-05-11 03:47:08'),(3,4,3,'£2,595,000','','','5 bed flat for sale','Charles Baker Place, Wandsworth Common SW17','5 Double Bedroom Suites\n5 Bathrooms\n2 Receptions Rooms\n3 Private Balcony\'s\nPrivate Rear Garden with Separate Studio\nPrivate Secure Parking Space\nBright and Spacious Throughout\nMoments from the Common and Wandsworth Common Station.','Urban Spaces are proud to present this stunning five bedroom house in the heart of Bellevue Village, seconds from Wandsworth Common and the train station. Viewings are highly recommended.This house is arranged over four floors with two reception areas, a spacious kitchen / dining room and five bathrooms. The property also benefits from three private balconies, and a generous sized landscaped garden with a stunning studio room located at the rear. The interior is incredibly light due to high ceilings throughout and an inspiring architectural design which provides luxurious, spacious living areas. A secure gated parking space is also included.The property is located moments away from Wandsworth common with excellent transport links within walking distance, leading to Central London in 12 minutes. The property is wonderfully proportioned and finished making them a perfect example of a family home or pied a terre.Charles Baker Place hosts a boutique development of nine beautiful houses, located in the heart of Bellevue Village. The development comprises three bedroom cottages, four bedroom mews houses and grand five bedroom houses with private gardens and garden studios. Each residence is finished to the highest of standards and all are allocated secure off street parking, within a gated courtyard.','',1,1,'2017-05-24 03:47:11','2017-05-24 03:47:11'),(4,3,2,'£665,000','','','1 bedroom flat for sale','London City Island,','One bedroom\n548 sq ft\n10th floor, east facing\nOff-plan sale\nWater views\nOn-site grocer and residents\' lounge\nGym, pool and 24 hour concierge\nCompletion Q4 2018-Q1 2019','Full description\n	An off-plan one bedroom apartment at London City Island - the Capital\'s mini Manhattan.\n\nSituated on the 10th floor of Dawsonne House, this east-facing apartment will benefit from great views over the River Lea towards the Thames. Arranged over 548 sq ft, accommodation comprises reception room with floor-to-ceiling windows, open-plan to a stylish kitchen, one double bedroom and a bathroom with Jack and Jill doors. A balcony runs from the reception.\n\nAll of the Island\'s residents become members of the City Island Arts Club, including the use of a 24 hour concierge and extensive clubhouse with pool table, gymnasium, spa, treatment rooms, swimming pool, on-site grocer & deli. On completion London City Island will also be home to English National Ballet and the London Film School.\n\nLondon City Island connects directly to Canning Town station via a newly-built footbridge and opens up the capital - east, central and west - via the DLR or Jubilee line. Directly-accessible destinations include Canary Wharf (4 mins), London Bridge (10 mins), Westminster (15 mins), Bond Street (20 mins), Stratford (7 mins) and London City Airport (7 mins).\n\nCompletion Q4 2018 - Q1 2019.\n\nPhotos shown are an indication of specification only.\n\nPredicted EPC: B','',1,1,'2017-05-20 06:22:51','2017-05-20 06:22:51'),(5,3,2,'£580,000','','','1 bedroom flat for sale','London City Island,','One bedroom\n548 sq ft\n10th floor, east facing\nOff-plan sale\nWater views\nOn-site grocer and residents\' lounge\nGym, pool and 24 hour concierge\nCompletion Q4 2018-Q1 2019','Full description\n	An off-plan one bedroom apartment at London City Island - the Capital\'s mini Manhattan.\n\nSituated on the 10th floor of Dawsonne House, this east-facing apartment will benefit from great views over the River Lea towards the Thames. Arranged over 548 sq ft, accommodation comprises reception room with floor-to-ceiling windows, open-plan to a stylish kitchen, one double bedroom and a bathroom with Jack and Jill doors. A balcony runs from the reception.\n\nAll of the Island\'s residents become members of the City Island Arts Club, including the use of a 24 hour concierge and extensive clubhouse with pool table, gymnasium, spa, treatment rooms, swimming pool, on-site grocer & deli. On completion London City Island will also be home to English National Ballet and the London Film School.\n\nLondon City Island connects directly to Canning Town station via a newly-built footbridge and opens up the capital - east, central and west - via the DLR or Jubilee line. Directly-accessible destinations include Canary Wharf (4 mins), London Bridge (10 mins), Westminster (15 mins), Bond Street (20 mins), Stratford (7 mins) and London City Airport (7 mins).\n\nCompletion Q4 2018 - Q1 2019.\n\nPhotos shown are an indication of specification only.\n\nPredicted EPC: B','',1,1,'2017-05-23 06:31:02','2017-05-23 06:31:02'),(6,3,2,'£500,000','','','1 bedroom flat for sale','London City Island,','One bedroom\n548 sq ft\n10th floor, east facing\nOff-plan sale\nWater views\nOn-site grocer and residents\' lounge\nGym, pool and 24 hour concierge\nCompletion Q4 2018-Q1 2019','Full description\n	An off-plan one bedroom apartment at London City Island - the Capital\'s mini Manhattan.\n\nSituated on the 10th floor of Dawsonne House, this east-facing apartment will benefit from great views over the River Lea towards the Thames. Arranged over 548 sq ft, accommodation comprises reception room with floor-to-ceiling windows, open-plan to a stylish kitchen, one double bedroom and a bathroom with Jack and Jill doors. A balcony runs from the reception.\n\nAll of the Island\'s residents become members of the City Island Arts Club, including the use of a 24 hour concierge and extensive clubhouse with pool table, gymnasium, spa, treatment rooms, swimming pool, on-site grocer & deli. On completion London City Island will also be home to English National Ballet and the London Film School.\n\nLondon City Island connects directly to Canning Town station via a newly-built footbridge and opens up the capital - east, central and west - via the DLR or Jubilee line. Directly-accessible destinations include Canary Wharf (4 mins), London Bridge (10 mins), Westminster (15 mins), Bond Street (20 mins), Stratford (7 mins) and London City Airport (7 mins).\n\nCompletion Q4 2018 - Q1 2019.\n\nPhotos shown are an indication of specification only.\n\nPredicted EPC: B','',2,2,'2017-05-25 06:52:39','2017-05-25 06:52:39'),(7,5,4,'£75,000,000','','','Land for sale','Holland Park, London, W11','','','',1,1,'2017-05-29 04:05:24','2017-05-29 04:05:24'),(10,6,5,'158,000','','','4 bedroom terraced house for sale','Shoreham Street, Sheffield, South Yorkshire','','','',1,1,'2017-05-29 15:29:10','2017-05-29 15:29:10'),(11,6,5,'142,000','GBP','','4 bedroom terraced house for sale','Shoreham Street, Sheffield, South Yorkshire','','','',1,1,'2017-05-31 02:44:36','2017-05-31 02:44:36'),(12,6,5,'142,000','GBP','','4 bedroom terraced house for sale','Shoreham Street, Sheffield, South Yorkshire','','','',1,1,'2017-05-31 02:51:05','2017-05-31 02:51:05'),(13,6,5,'139,000','GBP','','4 bedroom terraced house for sale','Shoreham Street, Sheffield, South Yorkshire','','','',1,1,'2017-05-31 14:04:32','2017-05-31 14:04:32'),(14,6,5,'135,000','GBP','Guide Price','4 bedroom terraced house for sale','Shoreham Street, Sheffield, South Yorkshire','','','',1,1,'2017-05-31 14:06:53','2017-05-31 14:06:53'),(15,2,1,'379,000','GBP','','1 bedroom flat for sale','Breakspears Road, Brockley, SE4','One bedroom\nLarge communal garden\nKitchen\nBathroom\nLight and airy\nFirst floor\nBuilding newly painted\nEPC rating D','This beautifully presented one bedroom apartment is located on this popular road in the Brockley conservation area and offers easy access to St Johns station and Farmers market.','',1,1,'2017-05-31 14:12:31','2017-05-31 14:12:31'),(16,2,1,'375,000','GBP','','1 bedroom flat for sale','Breakspears Road, Brockley, SE4','One bedroom\nLarge communal garden\nKitchen\nBathroom\nLight and airy\nFirst floor\nBuilding newly painted\nEPC rating D','This beautifully presented one bedroom apartment is located on this popular road in the Brockley conservation area and offers easy access to St Johns station and Farmers market.','',1,1,'2017-05-31 14:24:24','2017-05-31 14:24:24');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,'Test User','test@test.com','$2y$10$.l31VWIwyqdipYMj.Qz72uSA.37YEAXKmUPAmj.dhOdxJv7Je.Teq','iZBb5lSt8oZTJw7WoMc3G8wQaGUkOmq8nG2eaj6UwsynsFovxmMGHhCI9Vw7','2017-05-06 22:29:09','2017-05-08 02:18:27'),(2,'Alexis Richard','ecmascript.guru@gmail.com','$2y$10$mJcKtxtDue/w.LVjVOOV3OwD.0BXsh.ybiE/rjXpL8D0PPVBBXiYC',NULL,'2017-05-25 06:51:34','2017-05-25 06:51:34');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
