CREATE TABLE `post` (
  `postId` int NOT NULL AUTO_INCREMENT,
  `postTitle` varchar(100) NOT NULL,
  `postContent` longtext NOT NULL,
  `userId` varchar(45) NOT NULL,
  `postDate` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`postId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `postUserId` FOREIGN KEY (`userId`) REFERENCES `member` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci