CREATE TABLE Cart (
    userId VARCHAR(255),
    lecId INT,
    PRIMARY KEY (userId, lecId),
    FOREIGN KEY (userId) REFERENCES member(userId) ON DELETE CASCADE,
    FOREIGN KEY (lecId) REFERENCES lecture(lecId) ON DELETE CASCADE
);

show tables
select * from Cart;

DELETE FROM Cart WHERE userId = 'ksy';


drop table member;

insert into cart value('admin', 201000052);

alter table cart add column cartId int not null auto_increment;