--------------------------------------------------------
--  File created - péntek-május-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object CEGEK2 with DBMS_METADATA attempting internal generator.
CREATE TABLE CEGEK2 
(
  CEGNEV VARCHAR2(256 BYTE) 
, SZEKHELY VARCHAR2(128 BYTE) 
, CID VARCHAR2(20 BYTE) NOT NULL 
, ALAPITAS DATE 
, UZLETIEV_VEGE DATE 
) ;

REM INSERTING into CEGEK2
SET DEFINE OFF;
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Botakõ Kft','Pápa-Tapolcafõ','1',to_date('91-MÁRC. -06','RR-MON-DD'),to_date('91-MÁRC. -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Fólia-CargoPack Zrt.','Zsombó','6',to_date('01-AUG.  -05','RR-MON-DD'),to_date('01-AUG.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Koepfer Hungaria Kft.','Bicske','11',to_date('95-MÁRC. -13','RR-MON-DD'),to_date('95-MÁRC. -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PEMÛ ZRt.','Solymár','16',to_date('05-AUG.  -19','RR-MON-DD'),to_date('05-AUG.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Resilux Közép Európa Kft.','Tuzsér','21',to_date('09-MÁJ.  -01','RR-MON-DD'),to_date('09-MÁJ.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Valeo Auto-Electric Magyarország Kft.','Veszprém','26',to_date('87-DEC.  -31','RR-MON-DD'),to_date('87-DEC.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('AGROPLAST Kft.','Gyál','31',to_date('07-DEC.  -28','RR-MON-DD'),to_date('07-DEC.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BALOGHPLAST','Debrecen','36',to_date('01-AUG.  -19','RR-MON-DD'),to_date('01-AUG.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BOS Voltz Hungária Mûanyagfeldolgozó Bt.','Gyõrladamér','41',to_date('98-MÁRC. -04','RR-MON-DD'),to_date('98-MÁRC. -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('COLOPLAST Magyarország Kft.','Tatabánya/Nyírbátor','46',to_date('09-JAN.  -23','RR-MON-DD'),to_date('09-JAN.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('FÛKE Yacht Kft.','Balatonalmádi','51',to_date('11-ÁPR.  -24','RR-MON-DD'),to_date('11-ÁPR.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GRP Plastocorr Kft. ','Budapest','56',to_date('95-FEBR. -03','RR-MON-DD'),to_date('95-FEBR. -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('KARSAI Holding','Székesfehérvár','61',to_date('99-FEBR. -24','RR-MON-DD'),to_date('99-FEBR. -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('LORANGER Ipari Kft.','Székesfehérvár','66',to_date('03-OKT.  -28','RR-MON-DD'),to_date('03-OKT.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('MIKROPAKK Kft.','Budapest','71',to_date('05-ÁPR.  -22','RR-MON-DD'),to_date('05-ÁPR.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PALOTÁS-MIX Gumiipari Kft.','Kemeneshõgyész','76',to_date('00-MÁJ.  -03','RR-MON-DD'),to_date('00-MÁJ.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Plastimat Magyarország Kft.','Esztergom, Ipari Park','81',to_date('09-ÁPR.  -16','RR-MON-DD'),to_date('09-ÁPR.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('RED-EXT Kft.','Budapest','86',to_date('09-JAN.  -02','RR-MON-DD'),to_date('09-JAN.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('STYRON Kft.','Kóka','91',to_date('01-FEBR. -19','RR-MON-DD'),to_date('01-FEBR. -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('UNITOOL-PLASTIK Kft.','Budapest','96',to_date('88-NOV.  -28','RR-MON-DD'),to_date('88-NOV.  -01','RR-MON-DD'));
Insert into CEGEK2 (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('WAHL Hungária Kft.','Mosonmagyaróvár','101',to_date('12-JÚN.  -20','RR-MON-DD'),to_date('12-JÚN.  -01','RR-MON-DD'));

COMMIT;