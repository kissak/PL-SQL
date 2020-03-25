--------------------------------------------------------
--  File created - péntek-május-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object IRODALOM with DBMS_METADATA attempting internal generator.
CREATE TABLE IRODALOM 
(
  NÉV VARCHAR2(26 BYTE) 
, EREDETI_NÉV VARCHAR2(128 BYTE) 
, SZÜLETÉSI_IDÕ DATE 
, SZÜLETÉSI_HELY VARCHAR2(26 BYTE) 
, HALÁL_IDEJE DATE 
, HALÁL_HELYE VARCHAR2(26 BYTE) 
) ;

REM INSERTING into IRODALOM
SET DEFINE OFF;
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Abonyi Lajos','Márton Ferenc',to_date('33-JAN.  -09','RR-MON-DD'),'Kisternye',to_date('98-ÁPR.  -28','RR-MON-DD'),'Abony');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Ábrányi Emil (id.)',null,to_date('20-NOV.  -20','RR-MON-DD'),'Szentgyörgybárány',to_date('50-ÁPR.  -07','RR-MON-DD'),'Buda');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Ács Gedeon',null,to_date('19-AUG.  -31','RR-MON-DD'),'Bellye',to_date('87-NOV.  -12','RR-MON-DD'),'Csúza');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Ady Endre','Ady András Endre',to_date('77-NOV.  -22','RR-MON-DD'),'Érdmindszent',to_date('19-JAN.  -27','RR-MON-DD'),'Budapest');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Áprily Lajos','Jékely Lajos',to_date('87-NOV.  -14','RR-MON-DD'),'Brassó',to_date('67-AUG.  -06','RR-MON-DD'),'Budapest');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Arany János',null,to_date('17-MÁRC. -02','RR-MON-DD'),'Nagyszalonta',to_date('82-OKT.  -22','RR-MON-DD'),'Budapest');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Babits Mihály','Babits Mihály Lálszló Ákos',to_date('83-NOV.  -26','RR-MON-DD'),'Szekszárd',to_date('41-AUG.  -04','RR-MON-DD'),'Budapest');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Bajza Jenõ',null,to_date('40-MÁRC. -04','RR-MON-DD'),'Pest',to_date('63-OKT.  -28','RR-MON-DD'),'Pest');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Balassi Bálint','Balassa Bálint',to_date('54-OKT.  -20','RR-MON-DD'),'Zólyom',to_date('94-MÁJ.  -30','RR-MON-DD'),'Esztergom-Szentkirály');
Insert into IRODALOM ("NÉV","EREDETI_NÉV","SZÜLETÉSI_IDÕ","SZÜLETÉSI_HELY","HALÁL_IDEJE","HALÁL_HELYE") values ('Benedek Elek',null,to_date('59-SZEPT.-30','RR-MON-DD'),'Kisbacon',to_date('29-AUG.  -17','RR-MON-DD'),'Kisbacon');
commit;
