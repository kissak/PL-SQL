--------------------------------------------------------
--  File created - p�ntek-m�jus-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object IRODALOM with DBMS_METADATA attempting internal generator.
CREATE TABLE IRODALOM 
(
  N�V VARCHAR2(26 BYTE) 
, EREDETI_N�V VARCHAR2(128 BYTE) 
, SZ�LET�SI_ID� DATE 
, SZ�LET�SI_HELY VARCHAR2(26 BYTE) 
, HAL�L_IDEJE DATE 
, HAL�L_HELYE VARCHAR2(26 BYTE) 
) ;

REM INSERTING into IRODALOM
SET DEFINE OFF;
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('Abonyi Lajos','M�rton Ferenc',to_date('33-JAN.  -09','RR-MON-DD'),'Kisternye',to_date('98-�PR.  -28','RR-MON-DD'),'Abony');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('�br�nyi Emil (id.)',null,to_date('20-NOV.  -20','RR-MON-DD'),'Szentgy�rgyb�r�ny',to_date('50-�PR.  -07','RR-MON-DD'),'Buda');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('�cs Gedeon',null,to_date('19-AUG.  -31','RR-MON-DD'),'Bellye',to_date('87-NOV.  -12','RR-MON-DD'),'Cs�za');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('Ady Endre','Ady Andr�s Endre',to_date('77-NOV.  -22','RR-MON-DD'),'�rdmindszent',to_date('19-JAN.  -27','RR-MON-DD'),'Budapest');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('�prily Lajos','J�kely Lajos',to_date('87-NOV.  -14','RR-MON-DD'),'Brass�',to_date('67-AUG.  -06','RR-MON-DD'),'Budapest');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('Arany J�nos',null,to_date('17-M�RC. -02','RR-MON-DD'),'Nagyszalonta',to_date('82-OKT.  -22','RR-MON-DD'),'Budapest');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('Babits Mih�ly','Babits Mih�ly L�lszl� �kos',to_date('83-NOV.  -26','RR-MON-DD'),'Szeksz�rd',to_date('41-AUG.  -04','RR-MON-DD'),'Budapest');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('Bajza Jen�',null,to_date('40-M�RC. -04','RR-MON-DD'),'Pest',to_date('63-OKT.  -28','RR-MON-DD'),'Pest');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('Balassi B�lint','Balassa B�lint',to_date('54-OKT.  -20','RR-MON-DD'),'Z�lyom',to_date('94-M�J.  -30','RR-MON-DD'),'Esztergom-Szentkir�ly');
Insert into IRODALOM ("N�V","EREDETI_N�V","SZ�LET�SI_ID�","SZ�LET�SI_HELY","HAL�L_IDEJE","HAL�L_HELYE") values ('Benedek Elek',null,to_date('59-SZEPT.-30','RR-MON-DD'),'Kisbacon',to_date('29-AUG.  -17','RR-MON-DD'),'Kisbacon');
commit;
