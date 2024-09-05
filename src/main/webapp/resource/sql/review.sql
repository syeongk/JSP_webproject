CREATE TABLE `review` (
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) NOT NULL,
  `lecId` int NOT NULL,  
  `review` longtext NOT NULL,
  PRIMARY KEY (`reviewId`),
  FOREIGN KEY (userId) REFERENCES member(userId) ON DELETE CASCADE,
  FOREIGN KEY (lecId) REFERENCES lecture(lecId) ON DELETE CASCADE
  )
  
  INSERT INTO review (userId, lecId, review) values ('ksy1234', 5, '테스트' );
  select * from review
  
  drop table review
