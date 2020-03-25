--------------------------------------------------------
--  File created - péntek-május-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object DOLGOZO with DBMS_METADATA attempting internal generator.

CREATE TABLE DOLGOZO 
(
  ID NUMBER(4, 0) NOT NULL 
, VNEV VARCHAR2(25 BYTE) 
, KNEV VARCHAR2(15 BYTE) 
, SZULDAT DATE 
, NEM NUMBER(1, 0) 
, FELV_NAP DATE 
);

ALTER TABLE DOLGOZO
ADD CONSTRAINT SYS_C0043082 PRIMARY KEY 
(
  ID 
);

REM INSERTING into DOLGOZO
SET DEFINE OFF;
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('1','Bana','Árpádné',to_date('67-JÚL.  -21','RR-MON-DD'),'1',to_date('04-JÚN.  -24','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('2','Szabó','Lajosné',to_date('58-OKT.  -29','RR-MON-DD'),'1',to_date('04-AUG.  -25','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('3','Pordán','Gyöngyi',to_date('54-SZEPT.-08','RR-MON-DD'),'1',to_date('11-DEC.  -09','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('4','Szerdahelyi','Adél',to_date('60-DEC.  -23','RR-MON-DD'),'1',to_date('08-SZEPT.-01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('5','Rezes','Andrásné',to_date('73-MÁRC. -27','RR-MON-DD'),'1',to_date('03-JÚL.  -25','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('6','Babos','Krisztina',to_date('67-NOV.  -18','RR-MON-DD'),'1',to_date('07-ÁPR.  -06','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('7','Máriás','Károly',to_date('51-JAN.  -13','RR-MON-DD'),'0',to_date('13-JÚL.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('8','Mikó','Annamária',to_date('72-AUG.  -09','RR-MON-DD'),'1',to_date('12-OKT.  -11','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('9','Solymosi','Andrásné',to_date('67-NOV.  -29','RR-MON-DD'),'1',to_date('11-AUG.  -07','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('10','Várhegyi','Krisztina',to_date('64-OKT.  -06','RR-MON-DD'),'1',to_date('11-AUG.  -12','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('11','Kovácsné','Brigitta',to_date('78-MÁRC. -29','RR-MON-DD'),'1',to_date('13-OKT.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('12','Papp','Kázmér',to_date('72-OKT.  -16','RR-MON-DD'),'0',to_date('04-AUG.  -31','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('13','Teleki','Annamária',to_date('68-OKT.  -03','RR-MON-DD'),'1',to_date('10-NOV.  -13','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('14','Kovács','Adél',to_date('86-SZEPT.-09','RR-MON-DD'),'1',to_date('11-SZEPT.-17','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('15','Papp','Kornélia',to_date('66-JÚN.  -01','RR-MON-DD'),'1',to_date('03-NOV.  -03','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('16','Vojevogyina','Alíz',to_date('52-JAN.  -17','RR-MON-DD'),'1',to_date('10-MÁRC. -22','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('17','Tóth','Ferenc',to_date('54-AUG.  -26','RR-MON-DD'),'0',to_date('03-AUG.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('18','Kovács','Adél',to_date('79-ÁPR.  -29','RR-MON-DD'),'1',to_date('07-OKT.  -13','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('19','Karajos','Alexa',to_date('65-DEC.  -04','RR-MON-DD'),'1',to_date('07-FEBR. -20','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('20','Várkonyi','Miklósné',to_date('77-JÚN.  -18','RR-MON-DD'),'1',to_date('11-SZEPT.-20','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('21','Fodor','Emília',to_date('78-OKT.  -13','RR-MON-DD'),'1',to_date('13-SZEPT.-28','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('22','Papcsák','Adonisz',to_date('74-MÁRC. -22','RR-MON-DD'),'0',to_date('10-FEBR. -16','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('23','Mester','Tiborné',to_date('53-ÁPR.  -20','RR-MON-DD'),'1',to_date('05-OKT.  -23','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('24','Vidák','Áron',to_date('91-OKT.  -28','RR-MON-DD'),'0',to_date('03-MÁJ.  -19','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('25','Kiss','Gergely',to_date('47-AUG.  -23','RR-MON-DD'),'0',to_date('07-JÚL.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('26','Mizi','Krisztina',to_date('70-SZEPT.-20','RR-MON-DD'),'1',to_date('09-ÁPR.  -28','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('27','Szerdahelyi','Kriszta',to_date('86-MÁJ.  -17','RR-MON-DD'),'1',to_date('06-NOV.  -15','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('28','Krausz','Attiláné',to_date('91-JÚL.  -27','RR-MON-DD'),'1',to_date('13-JAN.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('29','Lipcsei','Rita',to_date('87-MÁJ.  -20','RR-MON-DD'),'1',to_date('09-NOV.  -21','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('30','Szántó','Károly',to_date('62-JÚL.  -14','RR-MON-DD'),'0',to_date('11-OKT.  -22','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('31','Bukovics','Erika',to_date('81-JAN.  -17','RR-MON-DD'),'1',to_date('10-MÁJ.  -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('32','Érdi','László',to_date('89-MÁJ.  -31','RR-MON-DD'),'0',to_date('04-NOV.  -15','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('33','Kiss','Gergely',to_date('76-ÁPR.  -24','RR-MON-DD'),'0',to_date('11-JAN.  -19','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('34','Egressy','István',to_date('64-AUG.  -31','RR-MON-DD'),'0',to_date('14-JAN.  -31','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('35','Pettendi','Csaba',to_date('79-AUG.  -01','RR-MON-DD'),'0',to_date('11-MÁJ.  -09','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('36','Fekete','Liza',to_date('68-JAN.  -22','RR-MON-DD'),'1',to_date('11-OKT.  -28','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('37','Joó','Mária',to_date('56-MÁJ.  -06','RR-MON-DD'),'1',to_date('06-SZEPT.-09','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('38','Koós','Alajos',to_date('90-DEC.  -14','RR-MON-DD'),'0',to_date('13-NOV.  -16','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('39','Kerekes','Zsombor Péter',to_date('71-NOV.  -13','RR-MON-DD'),'0',to_date('03-JÚL.  -07','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('40','Komondi','Aletta',to_date('71-MÁJ.  -02','RR-MON-DD'),'1',to_date('11-DEC.  -23','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('41','Mizi','Marietta',to_date('48-JÚL.  -30','RR-MON-DD'),'1',to_date('12-JÚN.  -21','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('42','Álmosdi','Tibor',to_date('89-AUG.  -31','RR-MON-DD'),'0',to_date('12-MÁRC. -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('43','Kerezsi','Anita',to_date('57-SZEPT.-22','RR-MON-DD'),'1',to_date('10-OKT.  -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('44','Kassai','Jánosné',to_date('60-DEC.  -26','RR-MON-DD'),'1',to_date('05-AUG.  -12','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('45','Pongrácz','Zoltánné',to_date('54-MÁRC. -11','RR-MON-DD'),'1',to_date('11-NOV.  -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('46','Keresztes','Tibor',to_date('54-OKT.  -17','RR-MON-DD'),'0',to_date('05-JÚL.  -09','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('47','Kiss','Hedvig',to_date('49-FEBR. -08','RR-MON-DD'),'1',to_date('12-NOV.  -23','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('48','Rõthné','Éva',to_date('54-JÚL.  -25','RR-MON-DD'),'1',to_date('12-AUG.  -19','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('49','Pászti','Annamária',to_date('78-JÚL.  -28','RR-MON-DD'),'1',to_date('07-MÁRC. -29','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('50','MOLNÁRNÉ','Júlia',to_date('47-JÚL.  -21','RR-MON-DD'),'1',to_date('13-AUG.  -10','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('51','Erõs','Andrea',to_date('78-JÚN.  -28','RR-MON-DD'),'1',to_date('11-MÁJ.  -18','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('52','Asztalos','Ádám',to_date('48-MÁJ.  -06','RR-MON-DD'),'0',to_date('12-MÁRC. -07','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('53','Eszes','Krisztina',to_date('61-JÚN.  -11','RR-MON-DD'),'1',to_date('11-NOV.  -11','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('54','Kovács','Marianna',to_date('60-JÚL.  -03','RR-MON-DD'),'1',to_date('08-AUG.  -03','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('55','Kovács','Gézáné',to_date('55-JÚN.  -27','RR-MON-DD'),'1',to_date('09-MÁJ.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('56','Szabó','Ákosné',to_date('79-JÚL.  -10','RR-MON-DD'),'1',to_date('06-FEBR. -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('57','Nagy-Szántó','Anna',to_date('91-MÁJ.  -07','RR-MON-DD'),'1',to_date('13-ÁPR.  -25','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('58','Kerek','Gábor',to_date('61-NOV.  -04','RR-MON-DD'),'0',to_date('03-NOV.  -19','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('59','Kocsis','Krisztián',to_date('74-JÚN.  -11','RR-MON-DD'),'0',to_date('07-ÁPR.  -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('60','Veres','Adrián',to_date('77-OKT.  -20','RR-MON-DD'),'0',to_date('11-JÚN.  -16','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('61','Kiss','Laura',to_date('78-JÚN.  -28','RR-MON-DD'),'1',to_date('07-MÁRC. -29','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('62','Good','Henrik',to_date('49-FEBR. -08','RR-MON-DD'),'0',to_date('02-JAN.  -01','RR-MON-DD'));
commit;
-- Unable to render INDEX DDL for object SYS_C0043082 with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX SYS_C0043082 ON DOLGOZO (ID ASC) 
LOGGING 
TABLESPACE OKTATAS_DATA 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL
