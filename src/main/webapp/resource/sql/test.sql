delete from post where postId > 0;
delete from comment where commentId > 0;
ALTER TABLE post AUTO_INCREMENT = 1;

select * from comment;
select * from member;
select * from post;a