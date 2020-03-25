--------------------------------------------------------
--  File created - p�ntek-m�jus-12-2017   
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
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Botak� Kft','P�pa-Tapolcaf�','1',to_date('91-M�RC. -06','RR-MON-DD'),to_date('91-M�RC. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Continental Automotive Hungary Kft.','Budapest','2',to_date('96-M�J.  -27','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Curver Magyarorsz�g Gy�rt� �s Kereskedelmi Kft.','Ebes, Zsong-v�lgy','3',to_date('86-NOV.  -29','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('FCI Connectors Hungary Kft./Delphi Connection System Hungary Kft.','Tatab�nya','4',to_date('06-DEC.  -21','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('FLEXTRONICS','S�rv�r','5',to_date('03-AUG.  -05','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('F�lia-CargoPack Zrt.','Zsomb�','6',to_date('01-AUG.  -05','RR-MON-DD'),to_date('01-AUG.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Furukawa Electrix Technol�giai Int�zet Kft.','Budapest','7',to_date('93-J�N.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GRABOPLAST Padl�gy�rt� Zrt.  Grabofloor Tatab�nyai gy�r','Tatab�nya','8',to_date('11-OKT.  -22','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('H�bner Gumi �s M�ayagipari Kft.','Ny�regyh�za','9',to_date('89-SZEPT.-18','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('J�sz-Plasztik Kft.','J�szber�ny','10',to_date('06-NOV.  -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Koepfer Hungaria Kft.','Bicske','11',to_date('95-M�RC. -13','RR-MON-DD'),to_date('95-M�RC. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Klorid Zrt.','P�sp�klad�ny','12',to_date('91-FEBR. -04','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('M�ki Labor M�anyag Vizsg�l� �s Fejleszt� Kft.','Budapest','13',to_date('97-OKT.  -31','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('NAUTIC BOAT ','Budapest','14',to_date('11-OKT.  -03','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('OBO Bettermann Hungary Kft.','Bugyi','15',to_date('06-M�RC. -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PEM� ZRt.','Solym�r','16',to_date('05-AUG.  -19','RR-MON-DD'),to_date('05-AUG.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Plastweld','Veresegyh�za','17',to_date('89-OKT.  -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Polyduct M�anyagipari Zrt.','N�dudvar','18',to_date('03-OKT.  -01','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Pro-Form Kft.','Ecser','19',to_date('88-M�J.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Quadrant CMS Hungary Kft.','Szigetszentmikl�s','20',to_date('88-J�L.  -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Resilux K�z�p Eur�pa Kft.','Tuzs�r','21',to_date('09-M�J.  -01','RR-MON-DD'),to_date('09-M�J.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Rhinopro Kft.','Barcs','22',to_date('99-M�RC. -15','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Richard Fritz Kft','Asz�d','23',to_date('08-�PR.  -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Robert Bosch Elektronika Kft.','Hatvan','24',to_date('09-JAN.  -22','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('SIMON M�anyagfeldolgoz� Egy�ni C�g','Szabadbatty�n','25',to_date('89-SZEPT.-18','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Valeo Auto-Electric Magyarorsz�g Kft.','Veszpr�m','26',to_date('87-DEC.  -31','RR-MON-DD'),to_date('87-DEC.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('VIDEOTON Elektro-Plast Kft','Kaposv�r','27',to_date('99-M�RC. -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Villeroy & Boch Magyarorsz�g Kft.','H�dmez�v�s�rhely','28',to_date('97-DEC.  -22','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('V&V Crane kft Plasteverest M�anyagfeldolgoz�','Buda�rs','29',to_date('94-NOV.  -20','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Zoltek Zrt.','Nyerges�jfalu','30',to_date('10-SZEPT.-25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('AGROPLAST Kft.','Gy�l','31',to_date('07-DEC.  -28','RR-MON-DD'),to_date('07-DEC.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Ajkai Elektronikai Kft.','Ajka','32',to_date('91-M�J.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('API 55 BT','Szeged','33',to_date('03-�PR.  -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Audi Hungaria Motor Kft.','Gy�r','34',to_date('10-M�RC. -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('AVIUS Kft.','Nagykanizsa','35',to_date('94-J�N.  -05','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BALOGHPLAST','Debrecen','36',to_date('01-AUG.  -19','RR-MON-DD'),to_date('01-AUG.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BAUSCH Kft.','Budapest','37',to_date('13-JAN.  -30','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BC-Ongropack Kft.','Kazincbarcika','38',to_date('03-AUG.  -12','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Bekomold','Budapest','39',to_date('96-M�RC. -04','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('B�lap�tfalvi F�lia �zem','B�lap�tfalva','40',to_date('12-NOV.  -06','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('BOS Voltz Hung�ria M�anyagfeldolgoz� Bt.','Gy�rladam�r','41',to_date('98-M�RC. -04','RR-MON-DD'),to_date('98-M�RC. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('C.S.I. Alba Kft.','Sz�kesfeh�rv�r','42',to_date('98-DEC.  -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('CasCade','Hal�sztelek','43',to_date('86-FEBR. -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('CF MAYER','Nagyoroszi','44',to_date('04-J�N.  -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('COATS HUNGARY','Budapest ','45',to_date('04-M�RC. -07','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('COLOPLAST Magyarorsz�g Kft.','Tatab�nya/Ny�rb�tor','46',to_date('09-JAN.  -23','RR-MON-DD'),to_date('09-JAN.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Continental Teves M�anyagipari Kft.','Veszpr�m','47',to_date('07-DEC.  -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Contitech Rubber Kft.       Taurus, Phoenix','Szeged','48',to_date('06-DEC.  -20','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Dekorsy Kft.','Sopron','49',to_date('91-M�RC. -09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Euroform Szersz�mgy�rt� Kft.','Budapest','50',to_date('07-FEBR. -03','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('F�KE Yacht Kft.','Balatonalm�di','51',to_date('11-�PR.  -24','RR-MON-DD'),to_date('11-�PR.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GALVANPLASTIK Kft.','Sz�kesfeh�rv�r','52',to_date('09-J�L.  -19','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Graboplast   ','Gy�r','53',to_date('97-AUG.  -23','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Gr�nit Kft. ','Budapest','54',to_date('90-J�L.  -21','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GRAVITAS 2000Kft.','Budapest','55',to_date('86-OKT.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('GRP Plastocorr Kft. ','Budapest','56',to_date('95-FEBR. -03','RR-MON-DD'),to_date('95-FEBR. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Gy�riplast M�anyagipari Kft','Gy�r','57',to_date('98-AUG.  -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('HENKEL K�r�slad�nyi Gy�ra','K�r�slad�ny','58',to_date('00-�PR.  -26','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('IBV Hung�ria Kft.','Kiskunf�legyh�za','59',to_date('91-OKT.  -09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('KAPOSPLAST M�anyagipari Kft.','Kaposv�r','60',to_date('12-SZEPT.-05','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('KARSAI Holding','Sz�kesfeh�rv�r','61',to_date('99-FEBR. -24','RR-MON-DD'),to_date('99-FEBR. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Kays Kft.','Mosonmagyar�v�r','62',to_date('88-�PR.  -17','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Kerox Kft.','Di�sd','63',to_date('90-JAN.  -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('LEGO Manufacturing Kft.','Ny�regyh�za','64',to_date('07-M�RC. -09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('LOCOMO Kft.','1115 Budapest','65',to_date('03-NOV.  -30','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('LORANGER Ipari Kft.','Sz�kesfeh�rv�r','66',to_date('03-OKT.  -28','RR-MON-DD'),to_date('03-OKT.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Lufthansa Technik Kft.','Ferihegy Airport','67',to_date('06-DEC.  -05','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('M�traplast Kft.','Budapest','68',to_date('97-SZEPT.-27','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Max Magyar M�anyagfr�ccs�nt� Kft.','Tarj�n (Tatab�ny�t�l 15 km-re)','69',to_date('02-M�RC. -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Metrimed Orvosi M�szergy�rt� Kft.','H�dmez�v�s�rhely ','70',to_date('89-M�RC. -15','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('MIKROPAKK Kft.','Budapest','71',to_date('05-�PR.  -22','RR-MON-DD'),to_date('05-�PR.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Nolato Hungary Kft.','Mosonmagyar�v�r','72',to_date('02-M�RC. -01','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('NOVOCOOP M�anyagfeldolgoz� Kft.','Hatvan','73',to_date('89-J�L.  -06','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('OVM-KARSAI Rt','Orosh�za','74',to_date('88-OKT.  -04','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('�KO-Pack Kht.','Budapest','75',to_date('07-M�RC. -21','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PALOT�S-MIX Gumiipari Kft.','Kemenesh�gy�sz','76',to_date('00-M�J.  -03','RR-MON-DD'),to_date('00-M�J.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Pannon-Effekt Kft.','Debrecen','77',to_date('95-FEBR. -02','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Pannonplast M�szaki M�anyagok Rt.  ( V.SZ.M. )','Budapest','78',to_date('03-FEBR. -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Pannunion Nyrt.','Szombathely','79',to_date('02-NOV.  -08','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PAUGER Carbon Kft.','K�pln�sny�k','80',to_date('95-FEBR. -06','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Plastimat Magyarorsz�g Kft.','Esztergom, Ipari Park','81',to_date('09-�PR.  -16','RR-MON-DD'),to_date('09-�PR.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('POLINVENT Kft.','Gy�l','82',to_date('97-M�J.  -03','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('PolyOne Kft.','Gy�r','83',to_date('94-M�J.  -06','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Procter and Gamble','Cs�m�r','84',to_date('06-SZEPT.-24','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('RATIPUR','Koml�','85',to_date('88-FEBR. -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('RED-EXT Kft.','Budapest','86',to_date('09-JAN.  -02','RR-MON-DD'),to_date('09-JAN.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('S-Elastic Kft.','Budapest','87',to_date('00-SZEPT.-09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('SIROMA Plast Kft.','Nagykanizsa','88',to_date('88-SZEPT.-10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('SKS Szersz�mk�sz�t� Kft.','Ajka','89',to_date('97-�PR.  -28','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Star Plus Kft.','Fels�zsolca','90',to_date('00-M�J.  -25','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('STYRON Kft.','K�ka','91',to_date('01-FEBR. -19','RR-MON-DD'),to_date('01-FEBR. -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Szarvasi Vas-F�mipari Rt.','Szarvas','92',to_date('99-JAN.  -21','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('SZEPLAST Kft.','Szeged','93',to_date('06-FEBR. -09','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('TYCO Electronics','Esztergom','94',to_date('00-M�J.  -27','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('UFM Bt.','Mosonmagyar�v�r','95',to_date('06-NOV.  -10','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('UNITOOL-PLASTIK Kft.','Budapest','96',to_date('88-NOV.  -28','RR-MON-DD'),to_date('88-NOV.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('U-SHIN EUROPE Kft.','Kisb�r','97',to_date('89-AUG.  -02','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Varinex Rt.','Budapest','98',to_date('07-�PR.  -16','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('VIDEOTON Holding PLASTIC V�llalat',' Sz�kesfeh�rv�r','99',to_date('89-JAN.  -02','RR-MON-DD'),null);
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('VT Plastic Gy�rt� Kft.(Videoton)','Sz�kesfeh�rv�r','100',to_date('93-M�RC. -12','RR-MON-DD'),null);
commit;
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('WAHL Hung�ria Kft.','Mosonmagyar�v�r','101',to_date('12-J�N.  -20','RR-MON-DD'),to_date('12-J�N.  -01','RR-MON-DD'));
Insert into CEGEK (CEGNEV,SZEKHELY,CID,ALAPITAS,UZLETIEV_VEGE) values ('Magyar �llam','Budapest','0',null,null);
commit;