# Petmilly Project

톰캣연동 후 실행 첫 페이지  localhost:본인포트/teamb/home

프로젝트 특징
1) 반려동물 실종 신고 및 임시보호/분양이 가능한 웹 사이트로 구현
2) 게시판 글 작성, 수정, 삭제, 검색 기능 구현(관리자, 회원만 글 작성 가능)
3) 실종 게시판의 경우 글을 작성하면 미승인 상태로 실종 게시판에 등록
   관리자, 작성자가 귀가 완료 처리 시 귀가 완료 게시판에 보이도록 구현
4) 임시보호/분양 게시판의 경우 글을 작성하면 미승인 상태로 관리자 전용 게시판에 등록 
   관리자가 승인 • 보류 • 거절을 판단하여 승인 시 임시보호/분양 
   게시판에 등록        게시판 상세 페이지에서 임시보호 완료를 선택 시 임시보호자의 
   정보를 업데이트       분양 완료를 선택 시 분양 완료 게시판로 이동
5) 전체 게시판은 글 등록자 혹은 관리자만 수정 • 삭제가 가능하며 삭제 버튼 클릭 시 팝업으로 재확인
6) 답글, 댓글 기능 구현
7) 자유게시판 추천 수 기능 구현

화면 구현
1) 메인화면 http://localhost:(포트번호)/teamb/home

![image](https://user-images.githubusercontent.com/105031126/172657808-8852648f-f001-4480-83bf-0dbf598586ee.png)

2) 로그인 페이지 http://localhost:(포트번호)/teamb/loginform
![image](https://user-images.githubusercontent.com/105031421/173011919-ac10a6c9-b94d-4dd5-a1af-dec9234d6377.png)

![image](https://user-images.githubusercontent.com/105031126/172658314-434c4c32-6e5b-478d-829b-f518a2032880.png)

3) 임시보호/분양 관리자 게시판 

![image](https://user-images.githubusercontent.com/105031126/172658453-c9fc9831-8862-4a6b-8cbf-882040df8f77.png)

4) 찾아오시는 길 http://localhost:(포트번호)/teamb/location

![image](https://user-images.githubusercontent.com/105031126/172659794-96f7f606-d20d-443f-ad17-41bcc6398d59.png)

5) 회원목록 관리 페이지 http://localhost:(포트번호)/teamb/rehomeadminpage

![image](https://user-images.githubusercontent.com/105031126/172658555-30bc8bf4-d7e0-4235-87a3-6ad662e3a75f.png)

6) 개인 정보 처리 방침 http://localhost:(포트번호)/teamb/policyprivate

![image](https://user-images.githubusercontent.com/105031126/172658811-eb3978de-b2a3-4ee2-b246-399fa9147628.png)

7) 이용약관 http://localhost:(포트번호)/teamb/policyservice

![image](https://user-images.githubusercontent.com/105031126/172658961-48e20117-18c7-42d3-b5af-ddc66f43ddb2.png)

8) 공지 사항 게시판 http://localhost:(포트번호)/teamb/noticeoutform

![image](https://user-images.githubusercontent.com/105031126/172662651-c4e71a33-bf05-4f9b-8af9-6f1559bdf239.png)

9) 실종 게시판 http://localhost:(포트번호)/teamb/missingoutform

![image](https://user-images.githubusercontent.com/105031126/172659951-9a18445c-3715-45e1-99b1-b8e6b23f1005.png)

10) 실종 게시판 상세 페이지 http://localhost:(포트번호)/teamb/missingdetail

![image](https://user-images.githubusercontent.com/105031126/172660420-b973e4d5-4a28-4f3c-8e6d-10c6859582da.png)

11) 임시보호/분양 게시판 http://localhost:(포트번호)/teamb/rehomeoutform

![image](https://user-images.githubusercontent.com/105031126/172660723-037cb719-e524-4644-80c5-f85a3e818d4d.png)

12) 임시보호/분양 상세 페이지 http://localhost:(포트번호)/teamb/rehomedetail

![image](https://user-images.githubusercontent.com/105031126/172660819-6bc9579a-fc1b-451f-bfcb-908e948e7098.png)

13) 자유 게시판 http://localhost:(포트번호)/teamb/board

![image](https://user-images.githubusercontent.com/105031126/172660989-0a628c54-8f89-4522-9d5c-61afd5bcd1af.png)


DB생성 참고
# 관리자 생성 SQL 
INSERT INTO member VALUES (0, 'admin','admin', '관리자', '관리자','','','','');

# 멤버 테이블명 MEMBER
create table member(
mem_no NUMBER(6) PRIMARY KEY,
mem_id VARCHAR2(20),
mem_pw VARCHAR2(20),
mem_name VARCHAR2(12),
mem_nickname VARCHAR2(20),
mem_jumin VARCHAR2(14),
mem_tel VARCHAR2(13),
mem_mail VARCHAR2(40),
mem_address VARCHAR2(100));


# 공지 테이블명 NOTICE
create table notice(
nt_no NUMBER(6) PRIMARY KEY,
mem_no NUMBER(6),
mem_nickname VARCHAR2(20),
nt_writeday DATE DEFAULT SYSDATE,
nt_title VARCHAR2(80),
nt_content VARCHAR2(2000),
nt_readcount NUMBER(6));

# 실종 테이블명 MISSING
create table missing(
mis_no NUMBER(6) PRIMARY KEY,
mis_gb VARCHAR2(10),
mis_gb2 VARCHAR2(10),
mis_title VARCHAR2(80),
mis_pname VARCHAR2(20),
mis_pno VARCHAR2(20),
mis_misdate DATE,
mis_misplace VARCHAR2(50),
mis_image VARCHAR2(30),
mem_no NUMBER(6),
mem_nickname VARCHAR2(20),
mem_tel VARCHAR2(13),
mis_writeday date default sysdate,
mis_content VARCHAR2(2000),
mis_readcount number(6)
);

# 임시보호/분양 테이블명 REHOME
create table rehome(
rh_no NUMBER(6) PRIMARY KEY,
rh_gb1 VARCHAR2(20),
rh_gb2 VARCHAR(20),
rh_gb3 VARCHAR2(10),
rh_title VARCHAR2(80),
rh_pname VARCHAR2(20),
rh_pno VARCHAR2(20),
rh_misdate date,
rh_misplace VARCHAR2(50),
rh_image VARCHAR2(30),
mem_no NUMBER(6,0),
mem_nickname VARCHAR2(20),
mem_tel VARCHAR2(13),
rh_writeday DATE default sysdate,
rh_content VARCHAR2(2000),
rh_readcount NUMBER(6));

# 후기 테이블명 EPILOGUE
CREATE TABLE EPILOGUE(
EP_NO NUMBER(6, 0) PRIMARY KEY,
EP_ORIGINNO NUMBER(6, 0),
EP_GB VARCHAR2(20),
EP_TITLE VARCHAR2(80),
MEM_NO NUMBER(6, 0),
MEM_NICKNAME VARCHAR2(20),
EP_WRITEDAY DATE DEFAULT SYSDATE,
EP_CONTENT VARCHAR2(2000),
EP_READCOUNT NUMBER(6, 0),
EP_IMAGE VARCHAR2(50));

# 자유게시판 테이블명 BOARD
CREATE TABLE BOARD(
BD_NO NUMBER(6, 0) PRIMARY KEY,
BD_TITLE VARCHAR2(80),
MEM_NO NUMBER(6, 0),
MEM_NICKNAME VARCHAR2(20),
BD_WRITEDAY DATE DEFAULT SYSDATE,
BD_CONTENT VARCHAR2(2000),
BD_READCOUNT NUMBER(6, 0),
BD_IMAGE VARCHAR2(50),
BD_LIKES NUMBER(6, 0));

# 댓글 테이블명 REPLY
CREATE TABLE reply(
rep_table VARCHAR2(20),
rep_originno NUMBER(6, 0),
rep_no NUMBER(6, 0) PRIMARY KEY,
rep_id VARCHAR2(20),
rep_writeday DATE DEFAULT SYSDATE,
rep_content VARCHAR2(2000),
rep_repno NUMBER(6, 0),
rep_step NUMBER(6, 0),
rep_indent NUMBER(6, 0)
);


# 추천수 테이블명 LIKES
CREATE TABLE likes(
likes_boardno NUMBER(6, 0),
likes_id VARCHAR2(20),
likes_seq NUMBER(6, 0) PRIMARY KEY
);

# 시퀀스 생성 참고

# 멤버 시퀀스 생성
create SEQUENCE member_seq;

# 공지 시퀀스 생성
CREATE SEQUENCE notice_seq;

# 실종 시퀀스 생성
create SEQUENCE mis_no;

# 임시보호/분양 시퀀스 생성
create SEQUENCE rh_no;

# 후기 시퀀스 생성
CREATE SEQUENCE EP_NO_SEQ;

# 자유게시판 시퀀스 생성
CREATE SEQUENCE BD_NO_SEQ;

# 댓글 테이블 시퀀스 생성
CREATE SEQUENCE rep_no;

# 추천수 시퀀스 생성
CREATE SEQUENCE likes_SEQ;


# 간이 데이터 입력
# NOTICE DATA
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플1', '샘플내용1', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플2', '샘플내용2', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플3', '샘플내용3', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플4', '샘플내용4', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플5', '샘플내용5', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플6', '샘플내용6', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플7', '샘플내용7', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플8', '샘플내용8', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플9', '샘플내용9', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플10', '샘플내용10', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플11', '샘플내용11', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플12', '샘플내용12', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플13', '샘플내용13', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플14', '샘플내용14', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플15', '샘플내용15', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플16', '샘플내용16', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플17', '샘플내용17', 0);
INSERT INTO notice VALUES (NOTICE_SEQ.nextval, 1, '예제용', sysdate, '샘플18', '샘플내용18', 0);

# MISSING DATA
# 실종 게시판 데이터
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글1', '테스트개1', 0000001, sysdate, '실종지1', '1.png', 1, '테스터1', '010-1111-1111', sysdate , '테스트글내용1' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글2', '테스트개2', 0000002, sysdate, '실종지2', '1.png', 2, '테스터2', '010-2222-2222', sysdate , '테스트글내용2' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글3', '테스트개3', 0000003, sysdate, '실종지3', '1.png', 3, '테스터3', '010-3333-3333', sysdate , '테스트글내용3' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글4', '테스트개4', 0000004, sysdate, '실종지4', '1.png', 4, '테스터4', '010-4444-4444', sysdate , '테스트글내용4' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글5', '테스트개5', 0000005, sysdate, '실종지5', '1.png', 5, '테스터5', '010-5555-5555', sysdate , '테스트글내용5' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글6', '테스트개6', 0000006, sysdate, '실종지6', '1.png', 6, '테스터6', '010-6666-6666', sysdate , '테스트글내용6' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글7', '테스트개7', 0000007, sysdate, '실종지7', '1.png', 7, '테스터7', '010-7777-7777', sysdate , '테스트글내용7' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글8', '테스트개8', 0000008, sysdate, '실종지8', '1.png', 8, '테스터8', '010-8888-8888', sysdate , '테스트글내용8' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '실종', '개', '테스트글9', '테스트개9', 0000009, sysdate, '실종지9', '1.png', 9, '테스터9', '010-9999-9999', sysdate , '테스트글내용9' ,0);

# 귀가 완료 게시판 데이터
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글1', '테스트개1', 0000001, sysdate, '실종지1', '1.png', 1, '테스터1', '010-1111-1111', sysdate , '테스트글내용1' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글2', '테스트개2', 0000002, sysdate, '실종지2', '1.png', 2, '테스터2', '010-2222-2222', sysdate , '테스트글내용2' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글3', '테스트개3', 0000003, sysdate, '실종지3', '1.png', 3, '테스터3', '010-3333-3333', sysdate , '테스트글내용3' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글4', '테스트개4', 0000004, sysdate, '실종지4', '1.png', 4, '테스터4', '010-4444-4444', sysdate , '테스트글내용4' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글5', '테스트개5', 0000005, sysdate, '실종지5', '1.png', 5, '테스터5', '010-5555-5555', sysdate , '테스트글내용5' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글6', '테스트개6', 0000006, sysdate, '실종지6', '1.png', 6, '테스터6', '010-6666-6666', sysdate , '테스트글내용6' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글7', '테스트개7', 0000007, sysdate, '실종지7', '1.png', 7, '테스터7', '010-7777-7777', sysdate , '테스트글내용7' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글8', '테스트개8', 0000008, sysdate, '실종지8', '1.png', 8, '테스터8', '010-8888-8888', sysdate , '테스트글내용8' ,0);
INSERT INTO MISSING VALUES(MIS_NO.NEXTVAL, '귀가', '개', '테스트글9', '테스트개9', 0000009, sysdate, '실종지9', '1.png', 9, '테스터9', '010-9999-9999', sysdate , '테스트글내용9' ,0);

# REHOME DATA
# 임시보호/분양 게시판 데이터
insert into rehome values (rh_no.nextval, '승인', '임시보호', '개', '테스트1', '양산형개1', 0000001, sysdate, '실종지1', '1.png', 1, '테스터1', '010-1111-1111', sysdate, '테스트용글내용1', 0);
insert into rehome values (rh_no.nextval, '승인', '임시보호', '개', '테스트2', '양산형개2', 0000001, sysdate, '실종지1', '1.png', 1, '테스터2', '010-2222-2222', sysdate, '테스트용글내용2', 0);
insert into rehome values (rh_no.nextval, '승인', '임시보호', '개', '테스트3', '양산형개3', 0000003, sysdate, '실종지3', '1.png', 3, '테스터3', '030-3333-3333', sysdate, '테스트용글내용3', 0);
insert into rehome values (rh_no.nextval, '승인', '임시보호', '개', '테스트4', '양산형개4', 0000004, sysdate, '실종지4', '1.png', 4, '테스터4', '040-4444-4444', sysdate, '테스트용글내용4', 0);
insert into rehome values (rh_no.nextval, '승인', '임시보호', '개', '테스트5', '양산형개5', 0000005, sysdate, '실종지5', '1.png', 5, '테스터5', '050-5555-5555', sysdate, '테스트용글내용5', 0);
insert into rehome values (rh_no.nextval, '승인', '임시보호', '개', '테스트6', '양산형개6', 0000006, sysdate, '실종지6', '1.png', 6, '테스터6', '060-6666-6666', sysdate, '테스트용글내용6', 0);
insert into rehome values (rh_no.nextval, '승인', '임시보호', '개', '테스트7', '양산형개7', 0000007, sysdate, '실종지7', '1.png', 7, '테스터7', '070-7777-7777', sysdate, '테스트용글내용7', 0);
insert into rehome values (rh_no.nextval, '승인', '임시보호', '개', '테스트8', '양산형개8', 0000008, sysdate, '실종지8', '1.png', 8, '테스터8', '080-8888-8888', sysdate, '테스트용글내용8', 0);

# 분양 완료 게시판 데이터
insert into rehome values (rh_no.nextval, '승인', '분양완료', '개', '테스트1', '양산형개1', 0000001, sysdate, '실종지1', '1.png', 1, '테스터1', '010-1111-1111', sysdate, '테스트용글내용1', 0);
insert into rehome values (rh_no.nextval, '승인', '분양완료', '개', '테스트2', '양산형개2', 0000001, sysdate, '실종지1', '1.png', 1, '테스터2', '010-2222-2222', sysdate, '테스트용글내용2', 0);
insert into rehome values (rh_no.nextval, '승인', '분양완료', '개', '테스트3', '양산형개3', 0000003, sysdate, '실종지3', '1.png', 3, '테스터3', '030-3333-3333', sysdate, '테스트용글내용3', 0);
insert into rehome values (rh_no.nextval, '승인', '분양완료', '개', '테스트4', '양산형개4', 0000004, sysdate, '실종지4', '1.png', 4, '테스터4', '040-4444-4444', sysdate, '테스트용글내용4', 0);
insert into rehome values (rh_no.nextval, '승인', '분양완료', '개', '테스트5', '양산형개5', 0000005, sysdate, '실종지5', '1.png', 5, '테스터5', '050-5555-5555', sysdate, '테스트용글내용5', 0);
insert into rehome values (rh_no.nextval, '승인', '분양완료', '개', '테스트6', '양산형개6', 0000006, sysdate, '실종지6', '1.png', 6, '테스터6', '060-6666-6666', sysdate, '테스트용글내용6', 0);
insert into rehome values (rh_no.nextval, '승인', '분양완료', '개', '테스트7', '양산형개7', 0000007, sysdate, '실종지7', '1.png', 7, '테스터7', '070-7777-7777', sysdate, '테스트용글내용7', 0);
insert into rehome values (rh_no.nextval, '승인', '분양완료', '개', '테스트8', '양산형개8', 0000008, sysdate, '실종지8', '1.png', 8, '테스터8', '080-8888-8888', sysdate, '테스트용글내용8', 0);

# EPILOGUE DATA
실종 , 임시보호/분양 게시판에 출력된 게시물 클릭 후
상세페이지에서 실종 : 귀가완료 , 임시보호/분양: 분양완료 버튼 클릭 후
데이터 확인 가능

# BOARD DATA
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플1', 8, '예제용8', sysdate, '샘플내용1', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플2', 7, '예제용7', sysdate, '샘플내용2', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플3', 6, '예제용6', sysdate, '샘플내용3', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플4', 5, '예제용5', sysdate, '샘플내용4', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플5', 4, '예제용4', sysdate, '샘플내용5', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플6', 3, '예제용3', sysdate, '샘플내용6', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플7', 2, '예제용2', sysdate, '샘플내용7', 0, '1.jpg', 0);
INSERT INTO board VALUES (BD_NO_SEQ.nextval, '자유게시판 샘플8', 1, '예제용1', sysdate, '샘플내용8', 0, '1.jpg', 0);

