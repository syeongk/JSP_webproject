CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL,
  `userId` varchar(45) NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId_idx` (`userId`),
  KEY `commentPostId_idx` (`postId`),
  CONSTRAINT `commentPostId` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentUserId` FOREIGN KEY (`userId`) REFERENCES `member` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
