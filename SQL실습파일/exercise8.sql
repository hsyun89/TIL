--생성 파일명 : exercise8.sql
-- jdbctest 라는 사용자로 접속해서 이 테이블들을 생성한다.
--
--1. 테이블명 : visitor
--    컬럼 사양 : name - 한글 기준으로 최대 6자를 저장할 수 있게
--                   writedate - 날짜와 시간을 저장할 수 있게 
--                   memo - 한글 기준으로 최대 60자를 저장할 수 있게
--                   [visitor 테이블에 데이터를 3개 행을 입력]
--	      날짜 데이터 : 1개 : 현재시간,  
--                                      1개 : 2017년 12월 25일, 
--                                      1개 : 1999년 8월 11일
--
create table visitor(
name varchar2(18),
writedate date,
memo varchar2(180)
);
insert into visitor(writedate) values(sysdate);
insert into visitor(writedate) values(to_date('2017년12월25일','yyyy"년"mm"월"dd"일"'));
insert into visitor(writedate) values(to_date('1999년8월11일','yyyy"년"mm"월"dd"일"'));


-- 2. 테이블명 : member
--    컬럼 사양 : m_id -  영문 기준으로 최대 12자를 저장할 수 있게 - primary key
--	     m_pwd - 영문 기준으로 최대 12자를 저장할 수 있게 - not null
--                   name - 한글 기준으로 최대 6자를 저장할 수 있게  - not null
--                   joindate - 날짜와 시간을 저장할 수 있게  - 기본값 sysdate
create table member(
m_id varchar2(12) primary key
,m_pwd varchar2(12) not null
,name varchar2(18) not null
,joindate date default sysdate
);
-- 
-- 3. 테이블명 : news
--     컬럼사양 : id - 길이가 8인 숫자 타입 - primary key
--                    writer - 한글 기준으로 최대 6자를 저장할 수 있게
--	      title - 한글 기준으로 최대 40자를 저장할 수 있게
--	      content - 한글 기준으로 최대 300자를 저장할 수 있게
--                     writedate - 날짜와 시간을 저장할 수 있게
--                     cnt - 길이가 8인 숫자 타입
--
--     시퀀스 생성 : news_seq - 1부터 시작, 1씩 증가
create table news(
id number(8) primary key
,title varchar2(120)
,content varchar2(900)
,writedate date
,cnt number(8)
);

create sequence new_seq
increment by 1
start with -1
nomaxvalue
minvalue -1
nocycle
nocache;

--
-- 4. 테이블명 : meeting
--     컬럼사양 : id - 길이가 8인 숫자 타입 - primary key
--                   name - 한글 기준으로 최대 6자를 저장할 수 있게
-- 	      title - 한글 기준으로 최대 40자를 저장할 수 있게 
--	      meetingdate - 날짜와 시간을 저장할 수 있게
--
--      시퀀스 생성 : meeting_seq - 1부터 시작, 1씩 증가
create table meeting(
id number(8) primary key
,name varchar2(18)
,title varchar2(120)
,meetingdate date
);

create sequence meeting_seq
increment by 1
start with -1
nomaxvalue
minvalue -1
nocycle
nocache;
--
--5. 테이블명 : imgtest
--     컬럼사양 : name - 한글 기준으로 최대 6자를 저장할 수 있게 - primary key
--                   imgcontent - 이미지를 데이터로 저장할 수 있게 (blob)
--
--
create table imgtest(
name varchar2(18)
,imgcontent blob
);

select * from tab;
select * from user_sequences;


--
--
--
--
--
--
--
--
