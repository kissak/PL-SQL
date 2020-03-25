--------------------------------------------------------
--  File created - péntek-május-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object FONOK with DBMS_METADATA attempting internal generator.
CREATE TABLE FONOK 
(
  ID NUMBER(4, 0) 
, FONOK_ID NUMBER(4, 0) 
);

ALTER TABLE FONOK
ADD CONSTRAINT SYS_C0043083 FOREIGN KEY
(
  ID 
)
REFERENCES DOLGOZO
(
  ID 
);

ALTER TABLE FONOK
ADD CONSTRAINT SYS_C0043084 FOREIGN KEY
(
  FONOK_ID 
)
REFERENCES DOLGOZO
(
  ID 
);


REM INSERTING into FONOK
SET DEFINE OFF;
Insert into FONOK (ID,FONOK_ID) values ('1','24');
Insert into FONOK (ID,FONOK_ID) values ('2','17');
Insert into FONOK (ID,FONOK_ID) values ('3','17');
Insert into FONOK (ID,FONOK_ID) values ('4','12');
Insert into FONOK (ID,FONOK_ID) values ('5','36');
Insert into FONOK (ID,FONOK_ID) values ('6','12');
Insert into FONOK (ID,FONOK_ID) values ('7','12');
Insert into FONOK (ID,FONOK_ID) values ('8','12');
Insert into FONOK (ID,FONOK_ID) values ('9','5');
Insert into FONOK (ID,FONOK_ID) values ('10','5');
Insert into FONOK (ID,FONOK_ID) values ('11','5');
Insert into FONOK (ID,FONOK_ID) values ('12','36');
Insert into FONOK (ID,FONOK_ID) values ('13','5');
Insert into FONOK (ID,FONOK_ID) values ('14','24');
Insert into FONOK (ID,FONOK_ID) values ('15','24');
Insert into FONOK (ID,FONOK_ID) values ('16','24');
Insert into FONOK (ID,FONOK_ID) values ('17','36');
Insert into FONOK (ID,FONOK_ID) values ('18','24');
Insert into FONOK (ID,FONOK_ID) values ('19','24');
Insert into FONOK (ID,FONOK_ID) values ('20','24');
Insert into FONOK (ID,FONOK_ID) values ('21','24');
Insert into FONOK (ID,FONOK_ID) values ('22','32');
Insert into FONOK (ID,FONOK_ID) values ('23','32');
Insert into FONOK (ID,FONOK_ID) values ('24','40');
Insert into FONOK (ID,FONOK_ID) values ('25','32');
Insert into FONOK (ID,FONOK_ID) values ('26','32');
Insert into FONOK (ID,FONOK_ID) values ('27','32');
Insert into FONOK (ID,FONOK_ID) values ('28','32');
Insert into FONOK (ID,FONOK_ID) values ('29','32');
Insert into FONOK (ID,FONOK_ID) values ('30','17');
Insert into FONOK (ID,FONOK_ID) values ('31','17');
Insert into FONOK (ID,FONOK_ID) values ('32','40');
Insert into FONOK (ID,FONOK_ID) values ('33','32');
Insert into FONOK (ID,FONOK_ID) values ('34','32');
Insert into FONOK (ID,FONOK_ID) values ('35','40');
Insert into FONOK (ID,FONOK_ID) values ('36','60');
Insert into FONOK (ID,FONOK_ID) values ('37','40');
Insert into FONOK (ID,FONOK_ID) values ('38','32');
Insert into FONOK (ID,FONOK_ID) values ('39','32');
Insert into FONOK (ID,FONOK_ID) values ('40','60');
Insert into FONOK (ID,FONOK_ID) values ('41','40');
Insert into FONOK (ID,FONOK_ID) values ('42','40');
Insert into FONOK (ID,FONOK_ID) values ('43','40');
Insert into FONOK (ID,FONOK_ID) values ('44','40');
Insert into FONOK (ID,FONOK_ID) values ('45','40');
Insert into FONOK (ID,FONOK_ID) values ('46','17');
Insert into FONOK (ID,FONOK_ID) values ('47','17');
Insert into FONOK (ID,FONOK_ID) values ('48','12');
Insert into FONOK (ID,FONOK_ID) values ('49','60');
Insert into FONOK (ID,FONOK_ID) values ('50','17');
Insert into FONOK (ID,FONOK_ID) values ('51','17');
Insert into FONOK (ID,FONOK_ID) values ('52','17');
Insert into FONOK (ID,FONOK_ID) values ('53','12');
Insert into FONOK (ID,FONOK_ID) values ('54','12');
Insert into FONOK (ID,FONOK_ID) values ('55','12');
Insert into FONOK (ID,FONOK_ID) values ('56','12');
Insert into FONOK (ID,FONOK_ID) values ('57','24');
Insert into FONOK (ID,FONOK_ID) values ('58','24');
Insert into FONOK (ID,FONOK_ID) values ('59','24');
Insert into FONOK (ID,FONOK_ID) values ('60','62');
Insert into FONOK (ID,FONOK_ID) values ('61','62');
commit;
