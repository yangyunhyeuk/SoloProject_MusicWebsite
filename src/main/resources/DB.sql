select * from all_tables;
-----------------------------------------------------------------------------------------------------------------------------
drop table board;
drop table member;
drop table fav;
drop table board;
-----------------------------------------------------------------------------------------------------------------------------
select * from board;
select * from member;
select * from fav;

drop sequence fav_pk_seq;
CREATE SEQUENCE fav_pk_seq INCREMENT BY 1 START WITH 1 MINVALUE 1;

CREATE SEQUENCE fav_pk_seq START WITH 1;
CREATE SEQUENCE board_pk_seq WITH START 1;
CREATE SEQUENCE member_pk_seq WITH START 1;
CREATE TABLE board (
	bnum INT PRIMARY KEY DEFAULT NEXTVAL("board_pk_seq") -- auto_increment
	...
);


-----------------------------------------------------------------------------------------------------------------------------
create table board(
   bnum int primary key, 						-- 게시글 고유넘버
   btitle varchar(30) not null, 				-- 게시글 제목
   filename varchar(30),						-- 파일 이름
   bwriter varchar(50) not null, 				-- 게시글 작성자
   bcontent varchar(100) not null, 				-- 게시글 내용
   bdate date default sysdate not null			-- 게시글 작성일자
);
-----------------------------------------------------------------------------------------------------------------------------
create table member(
   mnum int not null,							-- 회원 고유넘버
   mid varchar(50) primary key,					-- 회원 아이디
   mpw varchar(50) not null,					-- 회원 비밀번호
   mnickname varchar(50) not null,				-- 회원 닉네임
   mphone varchar(50) not null,					-- 회원 휴대폰 번호
   memail varchar(50) not null,					-- 회원 이메일
   maddress varchar(50) not null				-- 회원 집주소
);
-----------------------------------------------------------------------------------------------------------------------------
create table fav(
   fnum int primary key,-- 관심글 고유번호
   mid varchar(50) not null,					-- 회원아이디
   bnum	int not null,							-- 게시글 고유번호
   btitle varchar(30) not null,					-- 게시글 제목
   filename varchar(30)							-- 파일 이름
);
-----------------------------------------------------------------------------------------------------------------------------
create table comm(
   cnum int primary key,						-- 댓글 고유넘버
   ccontent varchar(100) not null,				-- 댓글 내용
   cdate date default sysdate not null,			-- 댓글 작성일자
   bnum int not null,							-- 게시글 번호
   mnickname varchar(50) not null,				-- 회원 닉네임
   mid varchar(50) not null,					-- 회원 아이디
   constraint commdel foreign key (bnum) references board(bnum) on delete cascade -- 게시글&댓글 삭제 제약조건
);
-----------------------------------------------------------------------------------------------------------------------------
INSERT INTO fav VALUES(fav_pk_seq.NEXTVAL,'1','2',3,'4','5')

INSERT INTO MEMBER VALUES(comm_pk_seq.NEXTVAL,'admin','11','하나', '010-1234', 'a@a', '수원')
insert into member values('admin','11','하나', '010-1234', 'a@a', '수원');

INSERT INTO fav VALUES(fav_pk_seq.NEXTVAL,'mid',1,'btitle','filename')
vo.getMid(), vo.getBnum(), vo.getBtitle(), vo.getFilename()


INSERT INTO fav VALUES(fav_pk_seq.NEXTVAL,'1','1','1','1')


insert into member values('dool','22','두울','ADMIN');



bnum btitle filename bwriter bcontent bdate
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','aespa.png','작성자', '내용');


insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','aurora.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','ava.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','birdy.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','blackpink.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','bts.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','chvrches.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','coldplay.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','dontoliver.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','dua.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','ellaerye.png','작성자', '내용');

insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','ellamai.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','ericprydz.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','gryffin.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','imagine.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','jaypark.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','khalid.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','kiiara.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','kimpetras.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','lana.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','macmiller.png','작성자', '내용');

insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','migos.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','miguel.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','mo.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','polog.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','post.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','poter.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','sia.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','taeyeon.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','theweekend.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','Tyler.png','작성자', '내용');

insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','yaeji.png','작성자', '내용');
insert into board (bnum,btitle,filename,bwriter, bcontent) values(board_pk_seq.NEXTVAL,'제목','zara.png','작성자', '내용');































