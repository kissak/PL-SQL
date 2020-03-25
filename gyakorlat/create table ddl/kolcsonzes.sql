--------------------------------------------------------
--  File created - p�ntek-m�jus-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object KOLCSONZES with DBMS_METADATA attempting internal generator.


CREATE TABLE KOLCSONZES 
(
  SORSZAM NUMBER(5, 0) GENERATED ALWAYS AS IDENTITY NOT NULL 
, KOLCSONZO NUMBER(3, 0) 
, FILM VARCHAR2(64 BYTE) 
, NAPOK NUMBER(2, 0) DEFAULT 4 
);

CREATE UNIQUE INDEX SYS_C0026319 ON KOLCSONZES (SORSZAM ASC);

ALTER TABLE KOLCSONZES
ADD CONSTRAINT SYS_C0026319 PRIMARY KEY 
(
  SORSZAM 
);

ALTER TABLE KOLCSONZES
ADD CONSTRAINT SYS_C0026320 FOREIGN KEY
(
  KOLCSONZO 
)
REFERENCES KOLCSONZO
(
  KID 
);

ALTER TABLE KOLCSONZES
ADD CONSTRAINT SYS_C0031838 FOREIGN KEY
(
  FILM 
)
REFERENCES DVD
(
  FILM 
);


REM INSERTING into KOLCSONZES
SET DEFINE OFF;
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('117','2','Bilincs �s mosoly','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('118','7','A j�t�knak v�ge','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('119','12','Bonnie �s Clyde','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('120','17','Csillagosok, katon�k','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('121','22','A dzsungel k�nyve','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('122','27','T�z van, bab�m!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('123','32','A f�ld transzban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('124','37','Szigor�an ellen�rz�tt vonatok','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('125','42','A dzsungel k�nyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('126','47','T�z van, bab�m!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('127','52','A f�ld transzban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('128','57','Szigor�an ellen�rz�tt vonatok','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('129','62','Volt egyszer egy Vadnyugat','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('130','2','A majmok bolyg�ja','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('131','7','Arcok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('132','12','Rosemary gyermeke','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('133','17','Ha?','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('302','35','Laputa - Az �gi palota','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('135','27','Producerek','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('136','32','Sz�gyen','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('137','37','2001: �rod�sszeia','14');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('138','42','Farkasok �r�ja','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('139','47','C�lpontok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('140','52','Az �l�halottak �jszak�ja','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('141','57','�jszak�m Maudn�l','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('142','62','A dzsungel k�nyve','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('143','4','T�z van, bab�m!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('144','8','A f�ld transzban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('145','12','Szigor�an ellen�rz�tt vonatok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('146','16','A dzsungel k�nyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('147','20','T�z van, bab�m!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('148','24','A f�ld transzban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('149','28','Szigor�an ellen�rz�tt vonatok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('150','32','Pillang�','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('151','36','A s�rk�ny k�zbel�p','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('152','40','Aljas utc�k','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('153','44','A hossz� b�cs�','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('154','48','A vessz�b�l font ember','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('155','52','Amerikai �jszaka','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('156','56','Ne n�zz vissza!','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('157','60','H�feh�rke �s a h�t t�rpe','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('158','3','Az alvil�g kir�lya','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('159','6','Jezabel','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('160','9','Robin Hood','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('161','12','Nap�leon','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('162','15','�csk�s','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('163','18','D�b�rg� �let','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('164','21','New York kik�t�i','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('165','24','Az andal�ziai kutya','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('166','27','Sz�gyen','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('167','30','2001: �rod�sszeia','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('168','33','Farkasok �r�ja','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('169','36','C�lpontok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('170','39','Az �l�halottak �jszak�ja','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('171','42','�jszak�m Maudn�l','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('172','45','A dzsungel k�nyve','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('173','48','T�z van, bab�m!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('174','51','A f�ld transzban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('175','54','Szigor�an ellen�rz�tt vonatok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('176','57','A dzsungel k�nyve','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('177','60','A fekete macska','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('178','17','Ez t�rt�nt egy �jszaka','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('179','17','A sov�ny ember','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('180','17','Blood kapit�ny','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('181','62','L�zad�s a Bountyn','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('182','62','Botr�ny az oper�ban','14');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('183','18','39 l�pcs�fok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('184','36','Frankenstein menyasszonya','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('185','54','Frakkban �s klakkban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('186','25','Rivaldaf�ny par�d�','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('187','25','Arany�s�k 1933-ban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('188','25','Kacsaleves','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('189','13','Krisztina kir�lyn�','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('301','16','A rettenthetetlen','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('191','39','King Kong','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('192','52','A sivatag fiai','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('193','7','Az akarat diadala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('194','14','Atalante','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('195','21','A fekete macska','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('196','28','Ez t�rt�nt egy �jszaka','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('197','35','A sov�ny ember','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('198','42','Blood kapit�ny','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('199','49','L�zad�s a Bountyn','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('200','56','Botr�ny az oper�ban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('201','2','A nagy �br�nd','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('202','11','Asszonyok a lejt�n','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('203','20','Zola','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('204','29','Iszonyat','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('205','38','J�lia �s a szellemek','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('206','47','Bolond Pierrot','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('207','56','Pillang�','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('208','16','A s�rk�ny k�zbel�p','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('209','16','Aljas utc�k','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('210','28','A hossz� b�cs�','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('211','28','A vessz�b�l font ember','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('212','28','Amerikai �jszaka','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('213','2','Ne n�zz vissza!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('214','11','H�feh�rke �s a h�t t�rpe','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('215','20','Az alvil�g kir�lya','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('216','29','Jezabel','2');
commit;
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('217','38','Robin Hood','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('218','47','Nap�leon','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('219','56','�csk�s','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('220','35','D�b�rg� �let','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('221','35','New York kik�t�i','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('222','35','Az andal�ziai kutya','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('223','2','Sz�gyen','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('224','11','2001: �rod�sszeia','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('225','20','Farkasok �r�ja','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('226','29','C�lpontok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('227','38','C�lpontok','14');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('228','47','Az �l�halottak �jszak�ja','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('229','56','�jszak�m Maudn�l','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('230','2','A dzsungel k�nyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('231','11','T�z van, bab�m!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('232','20','A f�ld transzban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('233','29','Szigor�an ellen�rz�tt vonatok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('234','38','A dzsungel k�nyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('235','47','T�z van, bab�m!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('236','56','Sz�ll a kakukk f�szk�re','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('237','2','Jeanne Dielman, 1080 Br�sszel, Keresked� utca 23.','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('238','2','The Rocky Horror Picture Show','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('239','11','Gyalog galopp','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('240','11','A szabads�g �k�ljoga','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('241','20','Piknik a F�gg� Szikl�n�l','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('242','20','Huszadik sz�zad','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('243','29','A F�ldre pottyant f�rfi','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('244','29','Csillagok h�bor�ja IV: �j rem�ny','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('245','38','Harmadik t�pus� tal�lkoz�sok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('246','38','Ut�nam a v�z�z�n','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('247','47','Annie Hall','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('248','47','A m�rv�nyember','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('249','56','Szombat esti l�z','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('250','56','Rad�rfej','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('251','2','Az amerikai bar�t','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('252','2','A domboknak szeme van','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('303','12','Apokalipszis most','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('254','27','S�hajok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('255','27','Jimmie Blacksmith dala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('256','27','A facip� f�ja','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('257','52','Mennyei napok','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('258','52','Holtak hajnala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('259','52','A Shaolin 36 pr�bat�tele','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('260','2','A nagy sz�v�s','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('261','2','Halloween ? A r�m�let �jszak�ja','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('262','2','Maria Braun h�zass�ga','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('263','7','Ragyog� karrierem','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('264','7','Sztalker','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('265','7','A nyolcadik utas: a Hal�l','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('266','12','Az utols� gy�ny�r� ny�r','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('267','12','Bonnie �s Clyde','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('268','12','Mindhal�lig zene','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('269','17','Isten hozta, Mr.!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('270','17','Kramer kontra Kramer','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('271','17','Brian �lete','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('272','22','Apokalipszis most','14');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('273','22','A pac�k','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('274','22','Az amerikai bar�t','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('275','27','A domboknak szeme van','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('304','6','Harcosok klubja','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('277','27','S�hajok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('278','32','Jimmie Blacksmith dala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('279','32','A facip� f�ja','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('280','32','Mennyei napok','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('281','37','Holtak hajnala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('282','37','Bilincs �s mosoly','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('283','37','A j�t�knak v�ge','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('284','42','Bonnie �s Clyde','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('285','42','Csillagosok, katon�k','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('286','42','A dzsungel k�nyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('287','47','T�z van, bab�m!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('288','47','A f�ld transzban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('289','47','Szigor�an ellen�rz�tt vonatok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('290','52','A dzsungel k�nyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('291','52','T�z van, bab�m!','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('292','52','Mindhal�lig zene','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('293','57','Isten hozta, Mr.!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('294','57','Kramer kontra Kramer','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('295','57','Brian �lete','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('296','62','Apokalipszis most','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('297','62','Holtak hajnala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('298','62','Szigor�an ellen�rz�tt vonatok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('305','12','A sebhelyesarc�','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('306','7','H�ts� ablak','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('307','7','A nagy balh�','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('308','9','Egy csod�latos elme','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('309','6','A herceg menyasszonya','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('310','60','Az elef�ntember','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('311','18','Szigor�an bizalmas','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('312','9','Az elveszett frigyl�da fosztogat�i','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('313','58','A f�lelem b�re','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('314','24','Biciklitolvajok','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('315','49','Szerelemre hangolva','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('316','33','Ac�ll�ved�k','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('317','51','Szemt�l szemben','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('318','48','K�z�ns�ges b�n�z�k','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('319','2','Ne b�nts�tok a feketerig�t!','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('320','55','Oldboy','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('321','57','A sebhelyesarc�','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('322','53','Egy makul�tlan elme �r�k ragyog�sa','5');
commit;
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('323','11','Sz�d�l�s','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('324','4','A nap v�ge','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('325','55','Aranypolg�r','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('326','33','Mement�','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('327','35','Id�tlen id�kig','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('328','12','Kutyaszor�t�ban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('329','45','H�rom sz�n: piros','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('330','34','A gy�l�let','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('331','35','Gran Torino','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('332','58','Szigor�an piszkos �gyek','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('333','44','Szemt�l szemben','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('334','50','Apokalipszis most','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('335','30','Nem f�l�nk a farkast�l','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('336','9','Aranypolg�r','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('337','24','Casino','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('338','15','Hotel Ruanda','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('339','46','A hal�l jele','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('340','6','Mary �s Max','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('341','10','Id�tlen id�kig','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('342','13','Modern id�k','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('343','36','V�rz� olaj','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('344','45','Szentj�nosbogarak s�rja','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('345','8','Az elef�ntember','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('346','11','D�lid�','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('347','40','12 majom','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('348','62','Bl�ff','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('349','32','A kir�ly besz�de','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('350','21','Laputa - Az �gi palota','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('351','41','8 �s 1/2','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('352','38','Szemekbe z�rt titkok','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('353','23','Egy csod�latos elme','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('354','55','A herceg menyasszonya','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('355','51','K�nikulai d�lut�n','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('356','10','Taxisof�r','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('357','23','Toy Story 3','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('358','60','Van, aki forr�n szereti','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('359','24','Idegenek a vonaton','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('360','51','Hatodik �rz�k','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('361','37','Aranyl�z','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('362','2','Id�tlen id�kig','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('363','26','8 �s 1/2','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('364','16','H�rom sz�n: piros','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('365','25','A f�lelem b�re','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('366','45','Nagyv�rosi f�nyek','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('367','62','A dolog','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('368','29','Oldboy','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('369','25','A dolog','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('370','34','Sz�ll a kakukk f�szk�re','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('371','55','Gyilkoss�g telefonh�v�sra','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('372','29','Idegenek a vonaton','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('373','16','Az elef�ntember','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('374','54','A f�lelem b�re','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('375','49','A t�gla','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('376','12','Ne b�nts�tok a feketerig�t!','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('377','9','Hatodik �rz�k','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('378','52','Trainspotting','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('379','17','Ap�m nev�ben','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('380','27','Volt egyszer egy Amerika','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('381','49','Ryan k�zleg�ny megment�se','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('382','24','Amerikai sz�ps�g','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('383','22','Brian �lete','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('384','41','A szarvasvad�sz','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('385','52','�t a vadonba','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('386','58','Gyilkoss�g telefonh�v�sra','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('387','10','Donnie Darko','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('388','39','A dolog','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('389','51','A t�gla','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('390','8','A herceg menyasszonya','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('391','43','Harcosok klubja','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('392','29','Ponyvareg�ny','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('393','16','Nincs bocs�nat','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('394','35','A f�lelem b�re','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('395','55','Fanny �s Alexander','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('396','50','A test�r','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('397','53','D�lid�','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('398','3','Rocky','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('399','21','Volt egyszer egy Amerika','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('400','9','A v�ndorl� palota','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('401','41','Egy makul�tlan elme �r�k ragyog�sa','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('402','25','V�rz� olaj','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('403','31','K�nikulai d�lut�n','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('404','60','Ponyvareg�ny','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('405','62','Aranyl�z','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('406','46','Viharsziget','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('407','50','Nauszika - A sz�l harcosai','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('408','38','Aranyl�z','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('409','7','Mement�','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('410','33','Eredet','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('411','2','Casino','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('412','38','Laputa - Az �gi palota','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('413','26','Amerikai sz�ps�g','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('414','31','Keresztapa','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('415','54','A v�ndorl� palota','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('416','36','A dikt�tor','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('417','55','Egy makul�tlan elme �r�k ragyog�sa','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('418','39','A v�ndorl� palota','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('419','45','Ryan k�zleg�ny megment�se','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('420','3','Viharsziget','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('421','48','Trainspotting','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('422','25','Gandhi','4');
commit;
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('423','20','A tengeralattj�r�','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('424','30','A rettenthetetlen','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('425','8','A tengeralattj�r�','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('426','8','Hetedik','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('427','58','D�h�ng� bika','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('428','15','A gonosz �rint�se','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('429','2','D�lid�','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('430','30','Szerelemre hangolva','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('431','7','Gladi�tor','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('432','37','D�h�ng� bika','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('433','44','Szemt�l szemben','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('434','54','Modern id�k','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('435','13','Szemt�l szemben','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('436','41','Fanny �s Alexander','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('437','22','Az elef�ntember','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('438','25','Nem f�l�nk a farkast�l','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('439','16','V�rz� olaj','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('440','46','A gy�l�let','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('441','27','Hal�lsoron','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('442','11','A f�lelem b�re','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('443','11','Casino','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('444','3','Hal�lsoron','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('445','48','Gandhi','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('446','23','Keresztapa 2','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('447','49','K�nai negyed','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('448','46','Idegenek a vonaton','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('449','48','Gandhi','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('450','23','Ac�ll�ved�k','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('451','48','Akira','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('452','46','Sz�rnyas fejvad�sz','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('453','4','Rocky','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('454','16','H�rom sz�n: piros','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('455','34','Fanny �s Alexander','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('456','51','Chihiro szellemorsz�gban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('457','26','A nap v�ge','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('458','12','Szerelemre hangolva','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('459','10','Nagymen�k','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('460','14','Nem f�l�nk a farkast�l','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('461','13','Szentj�nosbogarak s�rja','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('462','46','Modern id�k','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('463','40','D�lid�','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('464','53','A faun labirintusa','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('465','57','A rettenthetetlen','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('466','2','A hal�l jele','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('467','37','A t�gla','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('468','53','Hetedik','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('469','45','A zongorista','2');
commit;
-- Unable to render INDEX DDL for object SYS_C0026319 with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX SYS_C0026319 ON KOLCSONZES (SORSZAM ASC);
