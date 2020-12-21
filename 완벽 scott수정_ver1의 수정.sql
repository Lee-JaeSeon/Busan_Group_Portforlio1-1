drop table market cascade constraints;
drop table maskrate cascade constraints;
drop table review cascade constraints;
drop table customer cascade constraints;
drop table local cascade constraints;
drop table category cascade constraints;

-- category Table Create SQL
CREATE TABLE category
(
    cateid    NUMBER          NULL, 
    shop      VARCHAR2(40)    NULL, 
    CONSTRAINT CATEGORY_PK PRIMARY KEY (cateid)
)
;

-- category Table Create SQL
CREATE TABLE local
(
    localid    NUMBER          NOT NULL, 
    ci         VARCHAR2(40)    NULL, 
    gu         VARCHAR2(40)    NULL, 
    CONSTRAINT LOCAL_PK PRIMARY KEY (localid)
)
;
-- category Table Create SQL
CREATE TABLE market
(
    marketid    NUMBER           NOT NULL, 
    cateid      NUMBER           NOT NULL, 
    name        VARCHAR2(40)     NULL, 
    address     VARCHAR2(100)     NULL, 
    tel         VARCHAR2(40)     NULL, 
    time        DATE             NULL, 
    localid     NUMBER           NULL, 
    img         VARCHAR2(100)    NULL, 
    CONSTRAINT MARKET_PK PRIMARY KEY (marketid)
)
;
ALTER TABLE market
    ADD CONSTRAINT FK_market_cateid_category_cate FOREIGN KEY (cateid)
        REFERENCES category (cateid)
;

ALTER TABLE market
    ADD CONSTRAINT FK_market_localid_local_locali FOREIGN KEY (localid)
        REFERENCES local (localid)
;

-- category Table Create SQL
CREATE TABLE customer
(
    tel         VARCHAR2(40)    NOT NULL, 
    name        VARCHAR2(40)    NOT NULL, 
    password    VARCHAR2(40)    NOT NULL, 
    id          VARCHAR2(40)    NOT NULL, 
    CONSTRAINT CUSTOMER_PK PRIMARY KEY (id)
)
;

-- category Table Create SQL
CREATE TABLE maskrate
(
    maskid      NUMBER    NOT NULL, 
    type1       NUMBER    NULL, 
    type2       NUMBER    NULL, 
    type3       NUMBER    NULL, 
    type4       NUMBER    NULL, 
    marketid    NUMBER    NULL, 
    CONSTRAINT MASKRATE_PK PRIMARY KEY (maskid)
)
;

ALTER TABLE maskrate
    ADD CONSTRAINT FK_maskrate_marketid_market_ma FOREIGN KEY (marketid)
        REFERENCES market (marketid)
;


-- category Table Create SQL
CREATE TABLE review
(
    reviewid    NUMBER           NOT NULL, 
    id          VARCHAR2(40)     NULL, 
    time        TIMESTAMP        NULL, 
    text        VARCHAR2(500)    NULL, 
    marketid    NUMBER           NULL, 
    maskid      NUMBER           NULL, 
    CONSTRAINT REVIEW_PK PRIMARY KEY (reviewid)
)
;

ALTER TABLE review
    ADD CONSTRAINT FK_review_marketid_market_mark FOREIGN KEY (marketid)
        REFERENCES market (marketid)
;

ALTER TABLE review
    ADD CONSTRAINT FK_review_maskid_maskrate_mask FOREIGN KEY (maskid)
        REFERENCES maskrate (maskid)
;

ALTER TABLE review
    ADD CONSTRAINT FK_review_id_customer_id FOREIGN KEY (id)
        REFERENCES customer (id)
;
alter table market modify(time varchar2(80));






INSERT INTO CUSTOMER VALUES( '01039502883', '이재선', '1234', 'JASON');
INSERT INTO CUSTOMER VALUES( '01066208420', '서경아', '1004', 'KYONGAH');
INSERT INTO CUSTOMER VALUES( '01011112222', '전현우', '1004', 'HYUNWO');
INSERT INTO CUSTOMER VALUES( '01033334444', '김민근', '1004', 'MINGUEN');
INSERT INTO CUSTOMER VALUES( '01055556666', '채영환', '1004', 'YOUNGHWAN');
INSERT INTO CUSTOMER VALUES( '01077778888', '황태욱', '1004', 'TAEWOOK');
INSERT INTO CUSTOMER values ('01077778888','김두한','1004','DUHAN');
INSERT INTO CUSTOMER values ('01077778888','도고래','1004','GORAE');
INSERT INTO CUSTOMER values ('01077778888','김염소','1004','YEOMSO');
INSERT INTO CUSTOMER values ('01077778888','김도란','1004','DORAN');
INSERT INTO CUSTOMER values ('01077778888','권오현','1004','OHHYEON');
INSERT INTO CUSTOMER values ('01077778888','김태욱','1004','KIMTAE');
INSERT INTO CUSTOMER values ('01077778888','노량진','1004','NORYANG');
INSERT INTO CUSTOMER values ('01055554444','김테스','1004','TESS');
INSERT INTO CUSTOMER values ('01054447555','강호동','1004','HODONG');
INSERT INTO CUSTOMER values ('01054775411','이순신','1004','SUNSIN');
INSERT INTO CUSTOMER values ('01087445741','김두박','1004','DUBAK');

INSERT INTO CATEGORY VALUES ( 1, '음식점');
INSERT INTO CATEGORY VALUES ( 2, '카페');
INSERT INTO CATEGORY VALUES ( 3, '편의점');

INSERT INTO LOCAL VALUES (1, '부산광역시', '부산진구');

INSERT INTO MARKET VALUES (1, 2, '마이페이보릿쿠키', '부산 부산진구 서전로 37번길26',
'051-756-5115', '평일 12:00-19:00', 1, '../img/마이페이보릿쿠키.jpg');
INSERT INTO MARKET VALUES (2, 2, '베이커스 전포본점', '부산 부산진구 전포대로 209번길15',
'051-807-4047', '평일 10:30-20:00', 1, '../img/베이커스.jpg');
INSERT INTO MARKET VALUES (3, 2, '모던테이블', '부산 부산진구 중앙대로 680번길45-9 3층',
'051-809-0301', '평일 12:00-23:00', 1, '../img/모던테이블.jpg');
INSERT INTO MARKET VALUES (4, 2, '베르크', '부산 부산진구 서전로 58번길115',
'051-992-1113', '평일 12:00-23:00', 1, '../img/베르크.jpg');
INSERT INTO MARKET VALUES (5, 2, '블랙업커피', '부산 부산진구 서전로 37번길26',
'051-944-4952', '평일 10:00-23:00', 1, '../img/블랙업커피.jpg');
INSERT INTO MARKET VALUES (6, 2, '올더어글리쿠키', '부산 부산진구 전포동675-29',
'051-9025-2501', '월요일휴무', 1, '../img/올더어글리쿠키.jpg');
INSERT INTO MARKET VALUES (7, 1, '그집뱃살', '부산 부산진구 중앙대로680번가길 80-30',
'051-807-0377', '평일 17:30 - 03:00', 1, '../img/그집뱃살.jpg');
INSERT INTO MARKET VALUES (8, 1, '페이센동', '부산 부산진구 서전로46번길 6',
'0507-1369-9399', '평일 11:30 - 20:30', 1, '../img/페이센동.jpg');
INSERT INTO MARKET VALUES (9, 1, '3found', '부산 부산진구 성지로 50',
'0507-1330-8853', '매일 11:00 - 21:30', 1, '../img/3found.jpg');
INSERT INTO MARKET VALUES (10, 1, '화남정돼지국밥', '부산 부산진구 중앙대로680번가길 80-3',
'051-807-0377', '평일 17:30 - 03:00', 1, '../img/화남정돼지국밥.jpg');
INSERT INTO MARKET VALUES (11, 1, '카가와식당', '전포역 8번 출구 부산은행 횡단보도 건너편 1층',
'0507-1308-6106', '매일 00:00 - 00:01', 1, '../img/카가와식당.jpg');
INSERT INTO MARKET VALUES (12, 1, '버거샵', '부산 부산진구 동천로108번길',
'051-911-4960', '매일 11:30 - 21:00', 1, '../img/버거샵.jpg');
INSERT INTO MARKET VALUES (13, 3, 'GS25 서면제일점', '부산 부산진구 중앙대로680번길 45-9',
'051-818-2478', '매일', 1, '../img/GS25.jpg');
INSERT INTO MARKET VALUES (14, 3, '이마트24 서면삼정타워점', '부산 부산진구 중앙대로 672',
'051-520-3773', '매일 10:00 - 02:00', 1, '../img/emart24.jpg');
INSERT INTO MARKET VALUES (15, 3, '세븐일레븐 부산밀리오레점', '부산 부산진구 서전로 25 이오스프라자',
'051-817-3372', '매일', 1, '../img/세븐일레븐.jpg');
INSERT INTO MARKET VALUES (16, 3, 'CU 부암점', '부산 부산진구 신천대로 204',
'051-808-3328', '매일', 1, '../img/CU.jpg');
INSERT INTO MARKET VALUES (17, 3, 'GS25 전포제일점', '부산 부산진구 동천로 72',
'051-818-9866', '매일', 1, '../img/GS25.jpg');
INSERT INTO MARKET VALUES (18, 3, 'CU 서면센트럴스타점', '부산 부산진구 신천대로50번길 34',
'051-802-7434', '매일', 1, '../img/CU.jpg');



INSERT INTO MASKRATE VALUES ( 1, 3,5,2,2, 1);
INSERT INTO MASKRATE VALUES ( 2, 2,4,3,3, 1);
INSERT INTO MASKRATE VALUES ( 3, 3,5,2,2, 2);
INSERT INTO MASKRATE VALUES ( 4, 1,2,2,1, 3);
INSERT INTO MASKRATE VALUES ( 5, 4,4,4,4, 4);
INSERT INTO MASKRATE VALUES ( 6, 3,3,3,3, 6);
Insert into MASKRATE values (7,4,4,4,4,5);
Insert into MASKRATE values (8,3,3,3,3,8);
Insert into MASKRATE values (9,5,5,5,5,9);
Insert into MASKRATE values (10,6,6,1,2,10);
Insert into MASKRATE values (11,4,2,4,2,11);
Insert into MASKRATE values (12,5,2,3,4,12);
Insert into MASKRATE values (13,4,3,2,1,13);
Insert into MASKRATE values (14,3,2,1,1,14);
Insert into MASKRATE values (15,2,2,2,2,15);
Insert into MASKRATE values (16,2,3,3,2,16);
Insert into MASKRATE values (17,3,2,2,3,17);
Insert into MASKRATE values (18,3,3,3,3,5);
Insert into MASKRATE values (19,3,3,3,3,7);
Insert into MASKRATE values (20,4,4,4,4,18);

INSERT INTO REVIEW VALUES (1, 'JASON', '2020/12/10', '평범', 1 , 1);
INSERT INTO REVIEW VALUES (2, 'KYONGAH', '2020/12/10', '나름', 1 , 2);
INSERT INTO REVIEW VALUES (3, 'MINGUEN', '2020/12/10', '평범', 2 , 3);
INSERT INTO REVIEW VALUES (4, 'YOUNGHWAN', '2020/12/10', '준수', 3 , 4);
INSERT INTO REVIEW VALUES (5, 'TAEWOOK', '2020/12/10', '비쌈', 4 , 5);
INSERT INTO REVIEW VALUES (6, 'HYUNWO', '2020/12/10', '그닥', 6 , 6);
Insert into REVIEW  values (7,'HODONG','20/12/16 09:35:50.348000000','평범',5,7);
Insert into REVIEW  values (8,'TESS','20/12/16 09:36:18.610000000','많이 별로',8,8);
Insert into REVIEW  values (9,'KIMTAE','20/12/16 09:37:16.889000000','무난',9,9);
Insert into REVIEW  values (10,'DORAN','20/12/16 09:37:40.392000000','많이 무난',10,10);
Insert into REVIEW  values (11,'DUHAN','20/12/16 09:38:01.623000000','무난',11,11);
Insert into REVIEW  values (12,'OHHYEON','20/12/16 09:38:36.904000000','무난',12,12);
Insert into REVIEW  values (13,'YEOMSO','20/12/16 09:38:57.938000000','무난',13,13);
Insert into REVIEW  values (14,'GORAE','20/12/16 09:39:18.889000000','별로',14,14);
Insert into REVIEW  values (15,'DUBAK','20/12/16 09:39:40.867000000','찐자 별로',15,15);
Insert into REVIEW  values (16,'SUNSIN','20/12/16 09:40:06.801000000','별로',16,16);
Insert into REVIEW  values (17,'YEOMSO','20/12/16 09:40:34.037000000','구림',17,17);
Insert into REVIEW  values (18,'DUBAK','20/12/16 10:09:26.595000000','보통',5,18);
Insert into REVIEW  values (19,'MINGUEN','20/12/16 11:31:42.038000000','보통',7,19);
Insert into REVIEW  values (20,'DUBAK','20/12/17 10:05:27.567000000','좋음',18,20);