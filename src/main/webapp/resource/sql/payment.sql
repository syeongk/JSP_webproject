
CREATE TABLE Payment (
  paymentId INT NOT NULL AUTO_INCREMENT,
  cartId INT,
  lecId INT,
  paymentDate VARCHAR(15),
  paymentMethod VARCHAR(15),
  name VARCHAR(45),
  phone VARCHAR(45),
  email VARCHAR(45),
  price INT,
  PRIMARY KEY (paymentId),
  FOREIGN KEY (userId) REFERENCES member(userId) ON DELETE CASCADE
  FOREIGN KEY (lecId) REFERENCES lecture(lecId) ON DELETE CASCADE
);

ALTER TABLE payment DROP COLUMN price;

DELETE FROM payment WHERE name = '김서영';

drop table payment;
select * from payment;

DELETE FROM payment
WHERE name = '김서영';