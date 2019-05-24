--���� ���ϸ� : exercise8.sql
-- jdbctest ��� ����ڷ� �����ؼ� �� ���̺���� �����Ѵ�.
--
--1. ���̺�� : visitor
--    �÷� ��� : name - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ�
--                   writedate - ��¥�� �ð��� ������ �� �ְ� 
--                   memo - �ѱ� �������� �ִ� 60�ڸ� ������ �� �ְ�
--                   [visitor ���̺� �����͸� 3�� ���� �Է�]
--	      ��¥ ������ : 1�� : ����ð�,  
--                                      1�� : 2017�� 12�� 25��, 
--                                      1�� : 1999�� 8�� 11��
--
create table visitor(
name varchar2(18),
writedate date,
memo varchar2(180)
);
insert into visitor(writedate) values(sysdate);
insert into visitor(writedate) values(to_date('2017��12��25��','yyyy"��"mm"��"dd"��"'));
insert into visitor(writedate) values(to_date('1999��8��11��','yyyy"��"mm"��"dd"��"'));


-- 2. ���̺�� : member
--    �÷� ��� : m_id -  ���� �������� �ִ� 12�ڸ� ������ �� �ְ� - primary key
--	     m_pwd - ���� �������� �ִ� 12�ڸ� ������ �� �ְ� - not null
--                   name - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ�  - not null
--                   joindate - ��¥�� �ð��� ������ �� �ְ�  - �⺻�� sysdate
create table member(
m_id varchar2(12) primary key
,m_pwd varchar2(12) not null
,name varchar2(18) not null
,joindate date default sysdate
);
-- 
-- 3. ���̺�� : news
--     �÷���� : id - ���̰� 8�� ���� Ÿ�� - primary key
--                    writer - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ�
--	      title - �ѱ� �������� �ִ� 40�ڸ� ������ �� �ְ�
--	      content - �ѱ� �������� �ִ� 300�ڸ� ������ �� �ְ�
--                     writedate - ��¥�� �ð��� ������ �� �ְ�
--                     cnt - ���̰� 8�� ���� Ÿ��
--
--     ������ ���� : news_seq - 1���� ����, 1�� ����
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
-- 4. ���̺�� : meeting
--     �÷���� : id - ���̰� 8�� ���� Ÿ�� - primary key
--                   name - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ�
-- 	      title - �ѱ� �������� �ִ� 40�ڸ� ������ �� �ְ� 
--	      meetingdate - ��¥�� �ð��� ������ �� �ְ�
--
--      ������ ���� : meeting_seq - 1���� ����, 1�� ����
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
--5. ���̺�� : imgtest
--     �÷���� : name - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ� - primary key
--                   imgcontent - �̹����� �����ͷ� ������ �� �ְ� (blob)
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
