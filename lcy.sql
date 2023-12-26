--- 게시판 테이블
DROP SEQUENCE bId;
create sequence bId increment by 1 start with 1 nocache;

drop table board;
commit;
CREATE TABLE board (
bGroupKind VARCHAR2(255),
bId NUMBER PRIMARY KEY,
bName VARCHAR2(255) NOT NULL,
bTitle VARCHAR2(255) NOT NULL,
bContent VARCHAR2(4000) NOT NULL,
bEtc VARCHAR2(4000) NULL,
bWriteTime DATE DEFAULT sysdate,
bUpdateTime DATE DEFAULT null,
bHit NUMBER DEFAULT 0,
bGroup NUMBER,
bStep NUMBER DEFAULT 0,
bIndent NUMBER DEFAULT 0,
bDelete VARCHAR2(1) DEFAULT 'Y',
bLike NUMBER DEFAULT 0,
bDislike NUMBER DEFAULT 0
);

--- 게시판 답글
drop table tbl_reply;
drop sequence seq_reply;

CREATE TABLE tbl_reply (
bId NUMBER ,
rId NUMBER ,
replyer VARCHAR2(255) NOT NULL,
replytext VARCHAR2(4000) NOT NULL,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT null,
rGroup NUMBER,--bgroup
rStep NUMBER DEFAULT 0,
rIndent NUMBER DEFAULT 0,
rDelete VARCHAR2(1) DEFAULT 'Y'
);
create sequence seq_reply increment by 1 start with 1;
commit;

select *
from board;

select *
from tbl_reply;

select * from tbl_reply where rId=rId order by rGroup desc,rStep asc;
---업로드 테이블
drop table tbl_attach;
create table tbl_attach(
fullName varchar2(150) not null,
bId number not null,
regdate date default sysdate
);

--- 시큐리티 테이블
select * from authorities;
select * from users;
commit;

drop table users;
create table users(
    username varchar2(30) not null,
    password varchar2(100) not null,
    enabled integer not null -- 아이디 사용여부 0이면 사용 불가 1이면 사용가능
);
commit;

drop table authorities;
create table authorities( --권한
    username varchar2(30) not null,
    authority varchar2(50) not null
);

commit;

--파트너 게시판
drop table partner;

create SEQUENCE seq_partner increment by 1 start with 1;

create table partner(
    pId number,
    pHit NUMBER DEFAULT 0,
    pTitle NVARCHAR2(2000), --제목
    pContent NVARCHAR2(2000), --내용
    username NVARCHAR2(255), --닉네임 -->로그인 할 때 정한 닉네임 FK
    personnel number, --모집 인원
    progress NVARCHAR2(255), --진행방식
    stack NVARCHAR2(255), --기술 스택
    pPosition NVARCHAR2(255), --모집 포지션
    pContact NVARCHAR2(255), --연락 방법
    expectDate NVARCHAR2(255), --예상 기간
    startDate date, --프로젝트 시작일
    writeDate date default sysdate,
    endDate date, --모집 마감일
    pDelete VARCHAR2(1) DEFAULT 'Y'
);

--고용게시판
drop table hire;
drop SEQUENCE seq_hId;
create SEQUENCE seq_hId increment by 1 start with 1;

create table hire(
    hId number,
    hName NVARCHAR2(2000), -- 회사명
    hTitle NVARCHAR2(2000), --제목
    hjob NVARCHAR2(2000), --내용 이거 그냥 종류로 할까봐
    career NVARCHAR2(2000), --경력
    education NVARCHAR2(2000), --학력
    salary NVARCHAR2(2000), --급여
    location NVARCHAR2(2000), --지역
    type NVARCHAR2(2000), -- 근무 형태
    time NVARCHAR2(2000), --근무 시간
    hireToday date default sysdate, --디데이 계산할라고
    starDate date, --모집 마감일
    endDate date, --모집 마감일
    hHit NUMBER DEFAULT 0,
    pDelete VARCHAR2(1) DEFAULT 'Y'
);
select * from hire;
commit;

//스터디
drop table study;
CREATE TABLE study (
    sGroupKind VARCHAR2(255),
    sId NUMBER PRIMARY KEY,
    sName VARCHAR2(255) NOT NULL,
    sTitle VARCHAR2(255) NOT NULL,
    sContent VARCHAR2(4000) NOT NULL, 
    sEtc VARCHAR2(4000) NULL,
    sWriteTime DATE DEFAULT sysdate,
    sUpdateTime DATE DEFAULT null,
    sHit NUMBER DEFAULT 0,
    sGroup NUMBER,
    sStep NUMBER DEFAULT 0,
    sIndent NUMBER DEFAULT 0,
    sDelete VARCHAR2(1) DEFAULT 'Y', 
    sLike NUMBER DEFAULT 0, 
    sDislike NUMBER DEFAULT 0
);

create sequence sId increment by 1 start with 1 nocache;

select * from study_reply;
select * from study;

drop sequence seq_study_reply;
-------스터디 댓글 테이블
drop table study_reply;

CREATE TABLE study_reply (
sId NUMBER ,
sRId NUMBER ,
sReplyer VARCHAR2(255) NOT NULL,
sReplytext VARCHAR2(4000) NOT NULL,
sRegdate DATE DEFAULT sysdate,
sUpdatedate DATE DEFAULT null,

sGroup NUMBER,
sStep NUMBER DEFAULT 0,
sIndent NUMBER DEFAULT 0,
sDelete VARCHAR2(1) DEFAULT 'Y'

);
create sequence seq_study_reply increment by 1 start with 1;
commit;

create table study_attach(
    fullName varchar2(255),
    sid number,
    regdate date default sysdate    
);

---익명테이블
drop table unknown;
CREATE TABLE unknown (
    uGroupKind varchar2(255) default '익명',
    id number primary key,
    uName varchar2(255) not null,
    uTitle varchar2(255) not null,
    uContent varchar2(4000) not null,     
    uWriteTime date default sysdate,
    uUpdateTime date default null,
    uHit number default 0,
    uGroup number,
    uStep number default 0,
    uIndent number default 0,
    uDelete varchar2(1) default 'Y', 
    uLike number default 0, 
    uDislike number default 0
);

drop sequence uboard;
create sequence uboard increment by 1 start with 1;

select * from unknown;
select * from ureply;

drop table ureply;
create table ureply (
    urId number,
    id number,
    rPw varchar2(255) not null,
    replytext varchar2(2000) not null,
    replyer varchar2(255) not null,
    regdate date default sysdate,
    updatedate date default null,
    rGroup NUMBER,
    rStep NUMBER default 0,
    rIndent NUMBER default 0,
    rDelete VARCHAR2(1) DEFAULT 'Y'
);

drop sequence reply; 
create sequence reply increment by 1 start with 1;

drop table attach;
create table attach(
    fullName varchar2(255),
    id number,
    regdate date default sysdate    
);
commit;

--------------------------------------------------------- hr프로젝트 테이블

 create table do(
   do_id NUMBER NOT NULL,
   do_name VARCHAR2(200)
);


create table si(
   si_id NUMBER  NOT NULL,
   si_name VARCHAR2(200),
   do_id NUMBER
);


create table center(
   center_id NUMBER NOT NULL,
   center_name VARCHAR2(200),
   street_address VARCHAR2(200),
   si_id NUMBER
);


   create table category(
   category_id NUMBER NOT NULL,
   category_name VARCHAR2(200),
   center_id number
);



create table jobs(
   job_id number NOT NULL,
   job_title varchar2(200),
   min_salary number,
   max_salary number
);



create table employees(
   employee_id number NOT NULL,
   name varchar2(200),
   email varchar2(200),
   phone varchar2(200),
   salary number,
   commission_pct number,
   job_id number,
   center_id number
);



create table job_history(
   job_history_id number NOT NULL,
   hire_date date,
   end_date date,
   job_id number,
   employee_id number,
   category_id number

);
drop table do;
drop table si;
drop table center;
drop table category;
drop table jobs;
drop table employees;
drop table job_history;


select *
from job_history;
commit;