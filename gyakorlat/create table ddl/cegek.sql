--------------------------------------------------------
--  File created - péntek-május-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object CEGEK with DBMS_METADATA attempting internal generator.

CREATE TABLE CEGEK 
(
  CEGNEV VARCHAR2(256 BYTE) 
, SZEKHELY VARCHAR2(128 BYTE) 
, CID VARCHAR2(20 BYTE) NOT NULL 
, ALAPITAS DATE 
, UZLETIEV_VEGE DATE 
);

ALTER TABLE CEGEK
ADD CONSTRAINT CEGEK_PK PRIMARY KEY 
(
  CID 
);



REM INSERTING into CEGEK
SET DEFINE OFF;
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Botakõ Kft','Pápa-Tapolcafõ','1',to_date('91-MÁRC. -06','RR-MON-DD'),to_date('91-MÁRC. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Continental Automotive Hungary Kft.','Budapest','2',to_date('96-MÁJ.  -27','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Curver Magyarország Gyártó és Kereskedelmi Kft.','Ebes, Zsong-völgy','3',to_date('86-NOV.  -29','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('FCI Connectors Hungary Kft./Delphi Connection System Hungary Kft.','Tatabánya','4',to_date('06-DEC.  -21','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('FLEXTRONICS','Sárvár','5',to_date('03-AUG.  -05','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Fólia-CargoPack Zrt.','Zsombó','6',to_date('01-AUG.  -05','RR-MON-DD'),to_date('01-AUG.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Furukawa Electrix Technológiai Intézet Kft.','Budapest','7',to_date('93-JÚN.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GRABOPLAST Padlógyártó Zrt.  Grabofloor Tatabányai gyár','Tatabánya','8',to_date('11-OKT.  -22','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Hübner Gumi és Mûayagipari Kft.','Nyíregyháza','9',to_date('89-SZEPT.-18','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Jász-Plasztik Kft.','Jászberény','10',to_date('06-NOV.  -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Koepfer Hungaria Kft.','Bicske','11',to_date('95-MÁRC. -13','RR-MON-DD'),to_date('95-MÁRC. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Klorid Zrt.','Püspökladány','12',to_date('91-FEBR. -04','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Mûki Labor Mûanyag Vizsgáló és Fejlesztõ Kft.','Budapest','13',to_date('97-OKT.  -31','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('NAUTIC BOAT ','Budapest','14',to_date('11-OKT.  -03','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('OBO Bettermann Hungary Kft.','Bugyi','15',to_date('06-MÁRC. -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PEMÛ ZRt.','Solymár','16',to_date('05-AUG.  -19','RR-MON-DD'),to_date('05-AUG.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Plastweld','Veresegyháza','17',to_date('89-OKT.  -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Polyduct Mûanyagipari Zrt.','Nádudvar','18',to_date('03-OKT.  -01','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Pro-Form Kft.','Ecser','19',to_date('88-MÁJ.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Quadrant CMS Hungary Kft.','Szigetszentmiklós','20',to_date('88-JÚL.  -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Resilux Közép Európa Kft.','Tuzsér','21',to_date('09-MÁJ.  -01','RR-MON-DD'),to_date('09-MÁJ.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Rhinopro Kft.','Barcs','22',to_date('99-MÁRC. -15','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Richard Fritz Kft','Aszód','23',to_date('08-ÁPR.  -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Robert Bosch Elektronika Kft.','Hatvan','24',to_date('09-JAN.  -22','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('SIMON Mûanyagfeldolgozó Egyéni Cég','Szabadbattyán','25',to_date('89-SZEPT.-18','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Valeo Auto-Electric Magyarország Kft.','Veszprém','26',to_date('87-DEC.  -31','RR-MON-DD'),to_date('87-DEC.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('VIDEOTON Elektro-Plast Kft','Kaposvár','27',to_date('99-MÁRC. -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Villeroy & Boch Magyarország Kft.','Hódmezõvásárhely','28',to_date('97-DEC.  -22','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('V&V Crane kft Plasteverest Mûanyagfeldolgozó','Budaörs','29',to_date('94-NOV.  -20','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Zoltek Zrt.','Nyergesújfalu','30',to_date('10-SZEPT.-25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('AGROPLAST Kft.','Gyál','31',to_date('07-DEC.  -28','RR-MON-DD'),to_date('07-DEC.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Ajkai Elektronikai Kft.','Ajka','32',to_date('91-MÁJ.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('API 55 BT','Szeged','33',to_date('03-ÁPR.  -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Audi Hungaria Motor Kft.','Gyõr','34',to_date('10-MÁRC. -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('AVIUS Kft.','Nagykanizsa','35',to_date('94-JÚN.  -05','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BALOGHPLAST','Debrecen','36',to_date('01-AUG.  -19','RR-MON-DD'),to_date('01-AUG.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BAUSCH Kft.','Budapest','37',to_date('13-JAN.  -30','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BC-Ongropack Kft.','Kazincbarcika','38',to_date('03-AUG.  -12','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Bekomold','Budapest','39',to_date('96-MÁRC. -04','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Bélapátfalvi Fólia üzem','Bélapátfalva','40',to_date('12-NOV.  -06','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BOS Voltz Hungária Mûanyagfeldolgozó Bt.','Gyõrladamér','41',to_date('98-MÁRC. -04','RR-MON-DD'),to_date('98-MÁRC. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('C.S.I. Alba Kft.','Székesfehérvár','42',to_date('98-DEC.  -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('CasCade','Halásztelek','43',to_date('86-FEBR. -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('CF MAYER','Nagyoroszi','44',to_date('04-JÚN.  -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('COATS HUNGARY','Budapest ','45',to_date('04-MÁRC. -07','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('COLOPLAST Magyarország Kft.','Tatabánya/Nyírbátor','46',to_date('09-JAN.  -23','RR-MON-DD'),to_date('09-JAN.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Continental Teves Mûanyagipari Kft.','Veszprém','47',to_date('07-DEC.  -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Contitech Rubber Kft.       Taurus, Phoenix','Szeged','48',to_date('06-DEC.  -20','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Dekorsy Kft.','Sopron','49',to_date('91-MÁRC. -09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Euroform Szerszámgyártó Kft.','Budapest','50',to_date('07-FEBR. -03','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('FÛKE Yacht Kft.','Balatonalmádi','51',to_date('11-ÁPR.  -24','RR-MON-DD'),to_date('11-ÁPR.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GALVANPLASTIK Kft.','Székesfehérvár','52',to_date('09-JÚL.  -19','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Graboplast   ','Gyõr','53',to_date('97-AUG.  -23','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Gránit Kft. ','Budapest','54',to_date('90-JÚL.  -21','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GRAVITAS 2000Kft.','Budapest','55',to_date('86-OKT.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GRP Plastocorr Kft. ','Budapest','56',to_date('95-FEBR. -03','RR-MON-DD'),to_date('95-FEBR. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Gyõriplast Mûanyagipari Kft','Gyõr','57',to_date('98-AUG.  -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('HENKEL Kõrösladányi Gyára','Kõrösladány','58',to_date('00-ÁPR.  -26','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('IBV Hungária Kft.','Kiskunfélegyháza','59',to_date('91-OKT.  -09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('KAPOSPLAST Mûanyagipari Kft.','Kaposvár','60',to_date('12-SZEPT.-05','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('KARSAI Holding','Székesfehérvár','61',to_date('99-FEBR. -24','RR-MON-DD'),to_date('99-FEBR. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Kays Kft.','Mosonmagyaróvár','62',to_date('88-ÁPR.  -17','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Kerox Kft.','Diósd','63',to_date('90-JAN.  -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('LEGO Manufacturing Kft.','Nyíregyháza','64',to_date('07-MÁRC. -09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('LOCOMO Kft.','1115 Budapest','65',to_date('03-NOV.  -30','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('LORANGER Ipari Kft.','Székesfehérvár','66',to_date('03-OKT.  -28','RR-MON-DD'),to_date('03-OKT.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Lufthansa Technik Kft.','Ferihegy Airport','67',to_date('06-DEC.  -05','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Mátraplast Kft.','Budapest','68',to_date('97-SZEPT.-27','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Max Magyar Mûanyagfröccsöntõ Kft.','Tarján (Tatabányától 15 km-re)','69',to_date('02-MÁRC. -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Metrimed Orvosi Mûszergyártó Kft.','Hódmezõvásárhely ','70',to_date('89-MÁRC. -15','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('MIKROPAKK Kft.','Budapest','71',to_date('05-ÁPR.  -22','RR-MON-DD'),to_date('05-ÁPR.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Nolato Hungary Kft.','Mosonmagyaróvár','72',to_date('02-MÁRC. -01','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('NOVOCOOP Mûanyagfeldolgozó Kft.','Hatvan','73',to_date('89-JÚL.  -06','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('OVM-KARSAI Rt','Orosháza','74',to_date('88-OKT.  -04','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('ÕKO-Pack Kht.','Budapest','75',to_date('07-MÁRC. -21','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PALOTÁS-MIX Gumiipari Kft.','Kemeneshõgyész','76',to_date('00-MÁJ.  -03','RR-MON-DD'),to_date('00-MÁJ.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Pannon-Effekt Kft.','Debrecen','77',to_date('95-FEBR. -02','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Pannonplast Mûszaki Mûanyagok Rt.  ( V.SZ.M. )','Budapest','78',to_date('03-FEBR. -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Pannunion Nyrt.','Szombathely','79',to_date('02-NOV.  -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PAUGER Carbon Kft.','Káplnásnyék','80',to_date('95-FEBR. -06','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Plastimat Magyarország Kft.','Esztergom, Ipari Park','81',to_date('09-ÁPR.  -16','RR-MON-DD'),to_date('09-ÁPR.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('POLINVENT Kft.','Gyál','82',to_date('97-MÁJ.  -03','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PolyOne Kft.','Gyõr','83',to_date('94-MÁJ.  -06','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Procter and Gamble','Csömör','84',to_date('06-SZEPT.-24','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('RATIPUR','Komló','85',to_date('88-FEBR. -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('RED-EXT Kft.','Budapest','86',to_date('09-JAN.  -02','RR-MON-DD'),to_date('09-JAN.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('S-Elastic Kft.','Budapest','87',to_date('00-SZEPT.-09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('SIROMA Plast Kft.','Nagykanizsa','88',to_date('88-SZEPT.-10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('SKS Szerszámkészítõ Kft.','Ajka','89',to_date('97-ÁPR.  -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Star Plus Kft.','Felsõzsolca','90',to_date('00-MÁJ.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('STYRON Kft.','Kóka','91',to_date('01-FEBR. -19','RR-MON-DD'),to_date('01-FEBR. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Szarvasi Vas-Fémipari Rt.','Szarvas','92',to_date('99-JAN.  -21','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('SZEPLAST Kft.','Szeged','93',to_date('06-FEBR. -09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('TYCO Electronics','Esztergom','94',to_date('00-MÁJ.  -27','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('UFM Bt.','Mosonmagyaróvár','95',to_date('06-NOV.  -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('UNITOOL-PLASTIK Kft.','Budapest','96',to_date('88-NOV.  -28','RR-MON-DD'),to_date('88-NOV.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('U-SHIN EUROPE Kft.','Kisbér','97',to_date('89-AUG.  -02','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Varinex Rt.','Budapest','98',to_date('07-ÁPR.  -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('VIDEOTON Holding PLASTIC Vállalat',' Székesfehérvár','99',to_date('89-JAN.  -02','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('VT Plastic Gyártó Kft.(Videoton)','Székesfehérvár','100',to_date('93-MÁRC. -12','RR-MON-DD'),null);
commit;
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('WAHL Hungária Kft.','Mosonmagyaróvár','101',to_date('12-JÚN.  -20','RR-MON-DD'),to_date('12-JÚN.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Magyar Állam','Budapest','0',null,null);
commit;