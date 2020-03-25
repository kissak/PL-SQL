--------------------------------------------------------
--  File created - p�ntek-m�jus-12-2017   
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
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('1','Bana','�rp�dn�',to_date('67-J�L.  -21','RR-MON-DD'),'1',to_date('04-J�N.  -24','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('2','Szab�','Lajosn�',to_date('58-OKT.  -29','RR-MON-DD'),'1',to_date('04-AUG.  -25','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('3','Pord�n','Gy�ngyi',to_date('54-SZEPT.-08','RR-MON-DD'),'1',to_date('11-DEC.  -09','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('4','Szerdahelyi','Ad�l',to_date('60-DEC.  -23','RR-MON-DD'),'1',to_date('08-SZEPT.-01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('5','Rezes','Andr�sn�',to_date('73-M�RC. -27','RR-MON-DD'),'1',to_date('03-J�L.  -25','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('6','Babos','Krisztina',to_date('67-NOV.  -18','RR-MON-DD'),'1',to_date('07-�PR.  -06','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('7','M�ri�s','K�roly',to_date('51-JAN.  -13','RR-MON-DD'),'0',to_date('13-J�L.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('8','Mik�','Annam�ria',to_date('72-AUG.  -09','RR-MON-DD'),'1',to_date('12-OKT.  -11','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('9','Solymosi','Andr�sn�',to_date('67-NOV.  -29','RR-MON-DD'),'1',to_date('11-AUG.  -07','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('10','V�rhegyi','Krisztina',to_date('64-OKT.  -06','RR-MON-DD'),'1',to_date('11-AUG.  -12','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('11','Kov�csn�','Brigitta',to_date('78-M�RC. -29','RR-MON-DD'),'1',to_date('13-OKT.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('12','Papp','K�zm�r',to_date('72-OKT.  -16','RR-MON-DD'),'0',to_date('04-AUG.  -31','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('13','Teleki','Annam�ria',to_date('68-OKT.  -03','RR-MON-DD'),'1',to_date('10-NOV.  -13','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('14','Kov�cs','Ad�l',to_date('86-SZEPT.-09','RR-MON-DD'),'1',to_date('11-SZEPT.-17','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('15','Papp','Korn�lia',to_date('66-J�N.  -01','RR-MON-DD'),'1',to_date('03-NOV.  -03','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('16','Vojevogyina','Al�z',to_date('52-JAN.  -17','RR-MON-DD'),'1',to_date('10-M�RC. -22','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('17','T�th','Ferenc',to_date('54-AUG.  -26','RR-MON-DD'),'0',to_date('03-AUG.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('18','Kov�cs','Ad�l',to_date('79-�PR.  -29','RR-MON-DD'),'1',to_date('07-OKT.  -13','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('19','Karajos','Alexa',to_date('65-DEC.  -04','RR-MON-DD'),'1',to_date('07-FEBR. -20','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('20','V�rkonyi','Mikl�sn�',to_date('77-J�N.  -18','RR-MON-DD'),'1',to_date('11-SZEPT.-20','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('21','Fodor','Em�lia',to_date('78-OKT.  -13','RR-MON-DD'),'1',to_date('13-SZEPT.-28','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('22','Papcs�k','Adonisz',to_date('74-M�RC. -22','RR-MON-DD'),'0',to_date('10-FEBR. -16','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('23','Mester','Tiborn�',to_date('53-�PR.  -20','RR-MON-DD'),'1',to_date('05-OKT.  -23','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('24','Vid�k','�ron',to_date('91-OKT.  -28','RR-MON-DD'),'0',to_date('03-M�J.  -19','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('25','Kiss','Gergely',to_date('47-AUG.  -23','RR-MON-DD'),'0',to_date('07-J�L.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('26','Mizi','Krisztina',to_date('70-SZEPT.-20','RR-MON-DD'),'1',to_date('09-�PR.  -28','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('27','Szerdahelyi','Kriszta',to_date('86-M�J.  -17','RR-MON-DD'),'1',to_date('06-NOV.  -15','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('28','Krausz','Attil�n�',to_date('91-J�L.  -27','RR-MON-DD'),'1',to_date('13-JAN.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('29','Lipcsei','Rita',to_date('87-M�J.  -20','RR-MON-DD'),'1',to_date('09-NOV.  -21','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('30','Sz�nt�','K�roly',to_date('62-J�L.  -14','RR-MON-DD'),'0',to_date('11-OKT.  -22','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('31','Bukovics','Erika',to_date('81-JAN.  -17','RR-MON-DD'),'1',to_date('10-M�J.  -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('32','�rdi','L�szl�',to_date('89-M�J.  -31','RR-MON-DD'),'0',to_date('04-NOV.  -15','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('33','Kiss','Gergely',to_date('76-�PR.  -24','RR-MON-DD'),'0',to_date('11-JAN.  -19','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('34','Egressy','Istv�n',to_date('64-AUG.  -31','RR-MON-DD'),'0',to_date('14-JAN.  -31','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('35','Pettendi','Csaba',to_date('79-AUG.  -01','RR-MON-DD'),'0',to_date('11-M�J.  -09','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('36','Fekete','Liza',to_date('68-JAN.  -22','RR-MON-DD'),'1',to_date('11-OKT.  -28','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('37','Jo�','M�ria',to_date('56-M�J.  -06','RR-MON-DD'),'1',to_date('06-SZEPT.-09','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('38','Ko�s','Alajos',to_date('90-DEC.  -14','RR-MON-DD'),'0',to_date('13-NOV.  -16','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('39','Kerekes','Zsombor P�ter',to_date('71-NOV.  -13','RR-MON-DD'),'0',to_date('03-J�L.  -07','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('40','Komondi','Aletta',to_date('71-M�J.  -02','RR-MON-DD'),'1',to_date('11-DEC.  -23','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('41','Mizi','Marietta',to_date('48-J�L.  -30','RR-MON-DD'),'1',to_date('12-J�N.  -21','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('42','�lmosdi','Tibor',to_date('89-AUG.  -31','RR-MON-DD'),'0',to_date('12-M�RC. -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('43','Kerezsi','Anita',to_date('57-SZEPT.-22','RR-MON-DD'),'1',to_date('10-OKT.  -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('44','Kassai','J�nosn�',to_date('60-DEC.  -26','RR-MON-DD'),'1',to_date('05-AUG.  -12','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('45','Pongr�cz','Zolt�nn�',to_date('54-M�RC. -11','RR-MON-DD'),'1',to_date('11-NOV.  -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('46','Keresztes','Tibor',to_date('54-OKT.  -17','RR-MON-DD'),'0',to_date('05-J�L.  -09','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('47','Kiss','Hedvig',to_date('49-FEBR. -08','RR-MON-DD'),'1',to_date('12-NOV.  -23','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('48','R�thn�','�va',to_date('54-J�L.  -25','RR-MON-DD'),'1',to_date('12-AUG.  -19','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('49','P�szti','Annam�ria',to_date('78-J�L.  -28','RR-MON-DD'),'1',to_date('07-M�RC. -29','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('50','MOLN�RN�','J�lia',to_date('47-J�L.  -21','RR-MON-DD'),'1',to_date('13-AUG.  -10','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('51','Er�s','Andrea',to_date('78-J�N.  -28','RR-MON-DD'),'1',to_date('11-M�J.  -18','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('52','Asztalos','�d�m',to_date('48-M�J.  -06','RR-MON-DD'),'0',to_date('12-M�RC. -07','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('53','Eszes','Krisztina',to_date('61-J�N.  -11','RR-MON-DD'),'1',to_date('11-NOV.  -11','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('54','Kov�cs','Marianna',to_date('60-J�L.  -03','RR-MON-DD'),'1',to_date('08-AUG.  -03','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('55','Kov�cs','G�z�n�',to_date('55-J�N.  -27','RR-MON-DD'),'1',to_date('09-M�J.  -14','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('56','Szab�','�kosn�',to_date('79-J�L.  -10','RR-MON-DD'),'1',to_date('06-FEBR. -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('57','Nagy-Sz�nt�','Anna',to_date('91-M�J.  -07','RR-MON-DD'),'1',to_date('13-�PR.  -25','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('58','Kerek','G�bor',to_date('61-NOV.  -04','RR-MON-DD'),'0',to_date('03-NOV.  -19','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('59','Kocsis','Kriszti�n',to_date('74-J�N.  -11','RR-MON-DD'),'0',to_date('07-�PR.  -01','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('60','Veres','Adri�n',to_date('77-OKT.  -20','RR-MON-DD'),'0',to_date('11-J�N.  -16','RR-MON-DD'));
Insert into DOLGOZO (ID,VNEV,KNEV,SZULDAT,NEM,FELV_NAP) values ('61','Kiss','Laura',to_date('78-J�N.  -28','RR-MON-DD'),'1',to_date('07-M�RC. -29','RR-MON-DD'));
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
