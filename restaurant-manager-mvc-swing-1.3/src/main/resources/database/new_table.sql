CREATE TABLE IF NOT EXISTS `customer` (
    `customerId` int NOT NULL AUTO_INCREMENT,
    `phoneNumber` varchar(20) NOT NULL,
    `name` varchar(50) NULL,
    `address` varchar(250) NULL,
    PRIMARY KEY (`customerId`)
);

CREATE TABLE IF NOT EXISTS `table` (
    `tableId` int NOT NULL AUTO_INCREMENT,
    `name` varchar(45) NOT NULL,
    `status` varchar(45) NOT NULL DEFAULT 'free' COMMENT 'free-Trống\nserving-Đang phục vụ\nreserving-Đặt trước',
    PRIMARY KEY (`tableId`)
);

CREATE TABLE IF NOT EXISTS `employee` (
    `employeeId` int NOT NULL AUTO_INCREMENT,
    `username` varchar(50) UNIQUE NOT NULL,
    `password` varchar(50) NOT NULL,
    `name` varchar(50) NOT NULL,
    `phoneNumber` varchar(20) NOT NULL DEFAULT '',
    `startDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `permission` varchar(50) NOT NULL COMMENT 'manager-quản lý\r\nstaff-nhân viên\r\ninactive-nghỉ việc',
    `salary` int NOT NULL,
    PRIMARY KEY (`employeeId`)
);

CREATE TABLE IF NOT EXISTS `food_category` (
    `foodCategoryId` int NOT NULL AUTO_INCREMENT,
    `name` varchar(50) UNIQUE NOT NULL,
    `slug` varchar(50) NOT NULL,
    PRIMARY KEY (`foodCategoryId`)
);

CREATE TABLE IF NOT EXISTS `food_item` (
    `foodItemId` int NOT NULL AUTO_INCREMENT,
    `name` varchar(50) UNIQUE NOT NULL,
    `description` varchar(500) NULL,
    `imagePath` varchar(50) NULL,
    `unitName` varchar(20) NOT NULL,
    `unitPrice` bigint NOT NULL,
    `foodCategoryId` int NOT NULL,
    PRIMARY KEY (`foodItemId`),
    FOREIGN KEY (`foodCategoryId`) REFERENCES `food_category` (`foodCategoryId`)
);

CREATE TABLE IF NOT EXISTS `order` (
    `orderId` int NOT NULL AUTO_INCREMENT,
    `employeeId` int NOT NULL,
    `tableId` int NULL,
    `customerId` int NULL,
    `type` varchar(45) NOT NULL DEFAULT 'local' COMMENT 'local - tại quán\nonline - đặt online',
    `status` varchar(45) NOT NULL DEFAULT 'unpaid' COMMENT 'unpaid - chưa thanh toán\npaid - đã thanh toán',
    `orderDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `payDate` TIMESTAMP NULL DEFAULT NULL,
    `paidAmount` bigint NULL DEFAULT 0,
    `rebate` bigint NOT NULL DEFAULT 0,
    `totalAmount` bigint NOT NULL DEFAULT 0,
    `discount` int NOT NULL DEFAULT 0,
    CHECK(discount >= 0 AND discount <= 100),
    PRIMARY KEY (`orderId`),
    FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
    FOREIGN KEY (`tableId`) REFERENCES `table` (`tableId`),
    FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
);

CREATE TABLE IF NOT EXISTS `shipment` (
    `orderId` int NOT NULL,
    `customerId` int NOT NULL,
    `employeeId` int NOT NULL,
    `status` varchar(45) NOT NULL DEFAULT 'topay' COMMENT 'topay - chờ xác nhận\ntoship - chờ lấy hàng\ntoreceive - đang giao\ncompleted - hoàn thành\ncancelled - đã hủy',
    `startDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `endDate` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`orderId`),
    FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
    FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
    FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`)
);

CREATE TABLE IF NOT EXISTS `order_item` (
    `orderId` int NOT NULL,
    `foodItemId` int NOT NULL,
    `toppingId` int NOT NULL DEFAULT 1,
    `quantity` int NOT NULL DEFAULT 1,
    `foodPrice` bigint(20) NOT NULL DEFAULT 0,
    `toppingPrice` bigint(20) NOT NULL DEFAULT 0,
    `note` varchar(100) NULL,
    PRIMARY KEY (`orderId`, `foodItemId`, `toppingId`),
    FOREIGN KEY (`foodItemId`) REFERENCES `food_item` (`foodItemId`),
    FOREIGN KEY (`toppingId`) REFERENCES `food_item` (`foodItemId`),
    FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`)
);

CREATE TABLE IF NOT EXISTS `topping` (
    `toppingId` int NOT NULL AUTO_INCREMENT,
    `name` varchar(50) UNIQUE NOT NULL,
    `price` bigint NOT NULL,
    PRIMARY KEY (`toppingId`)
);

CREATE TABLE IF NOT EXISTS `session` (
    `sessionId` int NOT NULL AUTO_INCREMENT,
    `employeeId` int NOT NULL,
    `startTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `endTime` TIMESTAMP NULL DEFAULT NULL,
    `message` varchar(200) DEFAULT NULL,
    PRIMARY KEY (`sessionId`),
    FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`)
);
-- INSERT INTO `customer` VALUES (1,'0911175581','Cường','Nghệ An','2000-04-09 10:00:00'),(2,'0911175581','Linh','Hà Nội','2000-09-16 10:00:00');
-- INSERT INTO `employee` VALUES (1,'admin','admin','Admin','0911175581','2020-11-23 17:00:00','manager',10600000),(2,'nhanvien','2','Tea','0911175581','2020-11-24 05:15:08','staff',0),(5,'cuong','cuong12345','Trần Đức Cường','0911175582','2020-12-16 14:11:54','manager',0),(6,'anh','anh12345','Đỗ Tuấn Anh','12324123','2020-12-16 14:21:20','manager',0),(7,'son','son12345','Nguyễn Lam Sơn','123','2020-12-16 14:22:12','manager',0),(27,'karma','1','Milk','1','2020-12-23 16:52:39','staff',0);
-- INSERT INTO `food_category` VALUES (1,'Đồ Ăn','do-an'),(2,'Trà Sữa','tra-sua'),(3,'Cà Phê','ca-phe'),(4,'Topping','topping');
-- INSERT INTO `food_item` VALUES (1,'No Topping','','','Phần',0,4),(2,'Trân Châu Tuyết Sợi',NULL,NULL,'Phần',10000,4),(3,'Trân Châu Đen',NULL,NULL,'Phần',10000,4),(4,'Trân Châu Trắng',NULL,NULL,'Phần',10000,4),(5,'Trà Sữa Trân Châu','','tra-sua-tran-chau-2020-12-23-08-54-16.png','Ly',50000,2),(6,'Trà Sữa Sương Sáo',NULL,NULL,'Ly',45000,2),(7,'Trà Sữa Matcha(L)','','','Ly',50000,2),(8,'Sữa Tươi Trân Châu Đường Đen',NULL,NULL,'Ly',45000,2),(9,'Bánh Flan','','','Cái',10000,1),(10,'Hướng dương',NULL,NULL,'Túi',10000,1),(11,'Cafe truyền thống',NULL,NULL,'Cốc',35000,3),(12,'Espresso',NULL,NULL,'Cốc',45000,3),(13,'Trà Sữa Matcha(XL)',NULL,NULL,'Ly',25000,2),(14,'Trà Sữa Ô Long','','','Ly',20000,2),(15,'Trà Đào','','tra-ao-2020-12-23-08-54-25.png','Ly',40000,2),(16,'Trà Đào(L)','','tra-ao-l-2020-12-23-08-54-33.png','Ly',50000,2),(18,'Trà Nhãn - Sen','','tra-nhan---sen-2020-12-23-08-53-58.png','Ly',45000,2);
-- INSERT INTO `order` VALUES (1,1,1,'local','paid','2020-11-24 07:28:41','2020-12-01 10:40:46',450000,450000,0),(2,1,1,'online','paid','2020-11-24 08:05:08','2020-12-23 06:33:51',406000,406000,0),(3,1,3,'local','paid','2020-12-16 08:55:36','2020-12-23 06:34:01',550000,550000,5),(8,1,5,'local','paid','2020-12-23 02:41:01','2020-12-22 19:41:37',95000,95000,0),(11,2,1,'online','paid','2020-12-25 06:58:16','2020-12-24 23:59:58',0,0,0),(12,1,1,'online','paid','2020-12-25 06:58:23','2020-12-28 09:11:53',7555555,75000,0),(13,1,1,'online','paid','2020-12-25 06:58:28',NULL,365000,365000,0),(15,1,11,'local','paid','2021-01-01 02:14:30','2021-01-01 12:59:41',521250,695000,25),(16,7,3,'online','paid','2021-01-02 15:13:30','2021-01-02 18:21:15',669700,905000,26),(17,5,5,'local','paid','2021-01-05 17:54:05','2021-01-06 00:42:49',569400,730000,22),(18,27,11,'local','paid','2021-01-08 17:11:40','2021-01-09 01:25:39',1686250,1775000,5),(19,27,3,'local','paid','2021-01-02 07:06:30','2021-01-02 16:31:15',567450,585000,3),(20,7,8,'local','paid','2021-01-08 19:50:09','2021-01-08 20:13:59',610500,825000,26),(21,1,4,'local','paid','2020-12-23 09:26:40','2020-12-23 14:27:37',388800,540000,28),(22,1,10,'online','paid','2021-01-09 21:24:21','2021-01-10 07:18:55',1345900,1565000,14),(23,5,10,'local','paid','2021-01-04 20:17:08','2021-01-05 01:39:10',786600,1035000,24),(24,6,15,'local','paid','2020-12-25 02:41:36','2020-12-25 04:31:37',423750,565000,25),(25,6,5,'local','paid','2020-12-21 06:03:00','2020-12-21 07:41:33',592900,770000,23),(26,2,11,'local','paid','2020-12-31 23:31:08','2021-01-01 02:52:21',55200,60000,8),(27,6,15,'online','paid','2021-01-04 03:03:06','2021-01-04 04:54:38',847400,1115000,24),(28,27,2,'local','paid','2020-12-26 08:36:06','2020-12-26 16:45:35',943950,1085000,13),(29,6,4,'local','paid','2021-01-02 03:58:53','2021-01-02 08:06:09',783900,1005000,22),(30,27,10,'local','paid','2020-12-28 08:37:50','2020-12-28 15:12:26',165000,165000,0),(31,1,1,'local','paid','2020-12-26 10:58:11','2020-12-26 16:41:37',1552000,1600000,3),(32,2,4,'local','paid','2020-12-22 00:00:10','2020-12-22 11:30:26',843750,1125000,25),(33,6,7,'online','paid','2020-12-25 22:56:52','2020-12-26 05:23:57',40050,45000,11),(34,2,4,'local','paid','2020-12-30 12:41:49','2020-12-30 14:53:10',922500,1230000,25);
-- INSERT INTO `order_item` VALUES (1,7,1,1,50000,0,NULL),(1,16,1,8,50000,0,''),(2,8,1,2,43000,0,''),(2,9,1,8,10000,0,NULL),(2,15,1,6,40000,0,''),(3,5,4,5,40000,10000,''),(3,15,3,10,30000,0,''),(8,5,1,1,50000,0,''),(8,6,1,1,45000,0,''),(12,7,1,1,50000,0,''),(12,13,1,1,25000,0,''),(13,6,2,3,45000,10000,''),(13,9,1,5,10000,0,''),(13,10,1,4,10000,0,''),(13,18,3,2,45000,10000,''),(15,5,1,1,50000,0,''),(15,6,4,2,45000,10000,''),(15,11,1,5,35000,0,''),(15,18,1,8,45000,0,''),(16,7,1,9,50000,0,''),(16,7,4,1,50000,10000,''),(16,11,1,6,35000,0,''),(16,12,1,1,45000,0,''),(16,13,4,4,25000,10000,''),(17,8,2,8,45000,10000,''),(17,15,4,4,40000,10000,''),(17,18,1,2,45000,0,''),(18,5,1,11,50000,0,''),(18,6,2,6,45000,10000,''),(18,6,4,6,45000,10000,''),(18,9,1,4,10000,0,''),(18,11,1,2,35000,0,''),(18,12,1,3,45000,0,''),(18,13,1,4,25000,0,''),(18,18,4,4,45000,10000,''),(19,5,1,8,50000,0,''),(19,9,1,2,10000,0,''),(19,18,2,3,45000,10000,''),(20,7,1,7,50000,0,''),(20,8,2,1,45000,10000,''),(20,11,1,12,35000,0,''),(21,7,2,2,50000,10000,''),(21,16,2,7,50000,10000,''),(22,6,2,2,45000,10000,''),(22,10,1,3,10000,0,''),(22,12,1,9,45000,0,''),(22,15,1,3,40000,0,''),(22,16,2,8,50000,10000,''),(22,16,3,7,50000,10000,''),(23,5,1,4,50000,0,''),(23,15,2,3,40000,10000,''),(23,16,4,5,50000,10000,''),(23,18,4,7,45000,10000,''),(24,8,1,9,45000,0,''),(24,8,3,1,45000,10000,''),(24,11,1,3,35000,0,''),(25,5,3,2,50000,10000,''),(25,6,4,8,45000,10000,''),(25,9,1,6,10000,0,''),(25,14,2,5,20000,10000,''),(26,10,1,6,10000,0,''),(27,5,4,9,50000,10000,''),(27,12,1,5,45000,0,''),(27,13,2,1,25000,10000,''),(27,13,3,5,25000,10000,''),(27,14,1,7,20000,0,''),(28,6,4,3,45000,10000,''),(28,9,1,23,10000,0,''),(28,11,1,7,35000,0,''),(28,13,1,1,25000,0,''),(28,16,2,1,50000,10000,''),(28,18,1,8,45000,0,''),(29,5,1,6,50000,0,''),(29,7,1,7,50000,0,''),(29,10,1,7,10000,0,''),(29,12,1,3,45000,0,''),(29,13,1,6,25000,0,''),(30,5,3,2,50000,10000,''),(30,12,1,1,45000,0,''),(31,5,3,9,50000,10000,''),(31,9,1,2,10000,0,''),(31,12,1,2,45000,0,''),(31,13,3,5,25000,10000,''),(31,15,1,4,40000,0,''),(31,15,3,6,40000,10000,''),(31,18,1,7,45000,0,''),(32,5,1,6,50000,0,''),(32,7,3,6,50000,10000,''),(32,9,1,6,10000,0,''),(32,10,1,2,10000,0,''),(32,13,3,4,25000,10000,''),(32,13,4,7,25000,10000,''),(33,6,1,1,45000,0,''),(34,10,1,9,10000,0,''),(34,12,1,2,45000,0,''),(34,14,4,1,20000,10000,''),(34,16,2,10,50000,10000,''),(34,16,3,7,50000,10000,'');
-- INSERT INTO `session` VALUES (20,1,'2020-12-26 05:58:09','2020-12-26 05:58:15','logout'),(21,2,'2020-12-26 10:21:50','2020-12-26 10:22:06','logout'),(23,2,'2020-12-26 10:22:59','2020-12-26 12:13:20','logout'),(24,1,'2020-12-26 15:46:25','2020-12-26 15:47:22','logout'),(25,1,'2020-12-27 05:46:33','2020-12-27 06:53:14','logout'),(26,1,'2020-12-27 06:55:49','2020-12-27 07:25:30','logout'),(27,1,'2020-12-27 07:25:37','2020-12-27 09:37:44','logout'),(28,1,'2020-12-27 09:39:08','2020-12-27 09:51:08','logout'),(30,1,'2020-12-27 15:13:40','2020-12-27 15:13:51','logout'),(31,1,'2020-12-27 15:14:33','2020-12-27 15:15:08','logout'),(32,1,'2020-12-27 15:15:23','2020-12-27 15:15:32','logout'),(33,1,'2020-12-27 15:18:00','2020-12-27 15:18:05','logout'),(34,1,'2020-12-27 15:19:20','2020-12-27 15:19:25','logout'),(35,1,'2020-12-28 15:30:20','2020-12-28 15:31:00','logout'),(36,1,'2020-12-28 15:35:36','2020-12-28 15:36:39','logout'),(37,1,'2020-12-28 15:36:53','2020-12-28 15:37:03','logout'),(38,1,'2020-12-28 16:10:47','2020-12-28 16:17:10','logout'),(39,1,'2020-12-28 16:20:28','2020-12-28 16:21:11','logout'),(40,1,'2020-12-28 16:21:43','2020-12-28 16:21:58','logout'),(41,1,'2020-12-28 16:22:09','2020-12-28 16:22:20','logout'),(42,1,'2020-12-28 16:22:31','2020-12-28 16:22:53','logout'),(43,1,'2020-12-28 16:23:04','2020-12-28 16:23:17','logout'),(44,1,'2020-12-28 16:23:27',NULL,'login'),(45,1,'2020-12-28 16:37:35','2020-12-28 16:37:47','logout'),(46,1,'2020-12-28 16:39:34','2020-12-28 16:39:53','logout'),(47,1,'2020-12-28 16:40:02','2020-12-28 16:40:14','logout'),(48,1,'2020-12-29 07:17:33','2020-12-29 07:17:42','logout'),(49,1,'2020-12-29 07:18:06','2020-12-29 07:18:14','logout'),(50,1,'2020-12-29 07:18:23','2020-12-29 07:18:28','logout'),(51,1,'2020-12-29 07:18:37','2020-12-29 07:18:44','logout'),(52,1,'2020-12-29 07:18:54','2020-12-29 07:19:00','logout'),(53,1,'2020-12-29 07:19:12','2020-12-29 07:19:18','logout'),(54,1,'2020-12-29 07:19:33','2020-12-29 07:19:38','logout'),(55,1,'2021-01-09 03:42:06',NULL,'login'),(56,1,'2021-01-10 14:17:16','2021-01-10 14:17:42','logout'),(57,1,'2021-01-10 14:20:51','2021-01-10 14:21:12','logout');
-- INSERT INTO `shipment` VALUES (2,1,'Nguyễn Văn B','09421321323',0,'toreceive',NULL,'2020-11-23 17:00:00',NULL),(11,1,'Nguyễn Văn B','09421321323',0,'toreceive',NULL,'2020-12-25 06:58:48',NULL);
-- INSERT INTO `table` VALUES (1,'Bàn 1','free'),(2,'Bàn 2','free'),(3,'Bàn 3','free'),(4,'Bàn 4','free'),(5,'Bàn 5','free'),(6,'Bàn 6','free'),(7,'Bàn 7','free'),(8,'Bàn 8','free'),(10,'Bàn 10','free'),(11,'Bàn 11','free'),(15,'Bàn 12','free');
