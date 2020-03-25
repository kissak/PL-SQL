--------------------------------------------------------
--  File created - péntek-május-12-2017   
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
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('117','2','Bilincs és mosoly','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('118','7','A játéknak vége','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('119','12','Bonnie és Clyde','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('120','17','Csillagosok, katonák','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('121','22','A dzsungel könyve','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('122','27','Tûz van, babám!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('123','32','A föld transzban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('124','37','Szigorúan ellenõrzött vonatok','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('125','42','A dzsungel könyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('126','47','Tûz van, babám!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('127','52','A föld transzban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('128','57','Szigorúan ellenõrzött vonatok','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('129','62','Volt egyszer egy Vadnyugat','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('130','2','A majmok bolygója','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('131','7','Arcok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('132','12','Rosemary gyermeke','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('133','17','Ha?','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('302','35','Laputa - Az égi palota','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('135','27','Producerek','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('136','32','Szégyen','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('137','37','2001: Ûrodüsszeia','14');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('138','42','Farkasok órája','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('139','47','Célpontok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('140','52','Az élõhalottak éjszakája','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('141','57','Éjszakám Maudnál','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('142','62','A dzsungel könyve','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('143','4','Tûz van, babám!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('144','8','A föld transzban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('145','12','Szigorúan ellenõrzött vonatok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('146','16','A dzsungel könyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('147','20','Tûz van, babám!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('148','24','A föld transzban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('149','28','Szigorúan ellenõrzött vonatok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('150','32','Pillangó','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('151','36','A sárkány közbelép','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('152','40','Aljas utcák','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('153','44','A hosszú búcsú','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('154','48','A vesszõbõl font ember','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('155','52','Amerikai éjszaka','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('156','56','Ne nézz vissza!','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('157','60','Hófehérke és a hét törpe','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('158','3','Az alvilág királya','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('159','6','Jezabel','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('160','9','Robin Hood','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('161','12','Napóleon','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('162','15','Öcskös','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('163','18','Dübörgõ élet','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('164','21','New York kikötõi','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('165','24','Az andalúziai kutya','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('166','27','Szégyen','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('167','30','2001: Ûrodüsszeia','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('168','33','Farkasok órája','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('169','36','Célpontok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('170','39','Az élõhalottak éjszakája','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('171','42','Éjszakám Maudnál','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('172','45','A dzsungel könyve','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('173','48','Tûz van, babám!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('174','51','A föld transzban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('175','54','Szigorúan ellenõrzött vonatok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('176','57','A dzsungel könyve','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('177','60','A fekete macska','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('178','17','Ez történt egy éjszaka','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('179','17','A sovány ember','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('180','17','Blood kapitány','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('181','62','Lázadás a Bountyn','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('182','62','Botrány az operában','14');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('183','18','39 lépcsõfok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('184','36','Frankenstein menyasszonya','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('185','54','Frakkban és klakkban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('186','25','Rivaldafény parádé','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('187','25','Aranyásók 1933-ban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('188','25','Kacsaleves','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('189','13','Krisztina királynõ','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('301','16','A rettenthetetlen','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('191','39','King Kong','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('192','52','A sivatag fiai','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('193','7','Az akarat diadala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('194','14','Atalante','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('195','21','A fekete macska','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('196','28','Ez történt egy éjszaka','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('197','35','A sovány ember','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('198','42','Blood kapitány','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('199','49','Lázadás a Bountyn','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('200','56','Botrány az operában','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('201','2','A nagy ábránd','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('202','11','Asszonyok a lejtõn','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('203','20','Zola','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('204','29','Iszonyat','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('205','38','Júlia és a szellemek','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('206','47','Bolond Pierrot','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('207','56','Pillangó','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('208','16','A sárkány közbelép','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('209','16','Aljas utcák','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('210','28','A hosszú búcsú','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('211','28','A vesszõbõl font ember','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('212','28','Amerikai éjszaka','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('213','2','Ne nézz vissza!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('214','11','Hófehérke és a hét törpe','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('215','20','Az alvilág királya','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('216','29','Jezabel','2');
commit;
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('217','38','Robin Hood','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('218','47','Napóleon','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('219','56','Öcskös','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('220','35','Dübörgõ élet','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('221','35','New York kikötõi','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('222','35','Az andalúziai kutya','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('223','2','Szégyen','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('224','11','2001: Ûrodüsszeia','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('225','20','Farkasok órája','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('226','29','Célpontok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('227','38','Célpontok','14');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('228','47','Az élõhalottak éjszakája','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('229','56','Éjszakám Maudnál','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('230','2','A dzsungel könyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('231','11','Tûz van, babám!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('232','20','A föld transzban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('233','29','Szigorúan ellenõrzött vonatok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('234','38','A dzsungel könyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('235','47','Tûz van, babám!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('236','56','Száll a kakukk fészkére','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('237','2','Jeanne Dielman, 1080 Brüsszel, Kereskedõ utca 23.','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('238','2','The Rocky Horror Picture Show','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('239','11','Gyalog galopp','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('240','11','A szabadság ököljoga','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('241','20','Piknik a Függõ Sziklánál','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('242','20','Huszadik század','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('243','29','A Földre pottyant férfi','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('244','29','Csillagok háborúja IV: Új remény','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('245','38','Harmadik típusú találkozások','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('246','38','Utánam a vízözön','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('247','47','Annie Hall','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('248','47','A márványember','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('249','56','Szombat esti láz','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('250','56','Radírfej','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('251','2','Az amerikai barát','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('252','2','A domboknak szeme van','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('303','12','Apokalipszis most','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('254','27','Sóhajok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('255','27','Jimmie Blacksmith dala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('256','27','A facipõ fája','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('257','52','Mennyei napok','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('258','52','Holtak hajnala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('259','52','A Shaolin 36 próbatétele','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('260','2','A nagy szívás','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('261','2','Halloween ? A rémület éjszakája','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('262','2','Maria Braun házassága','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('263','7','Ragyogó karrierem','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('264','7','Sztalker','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('265','7','A nyolcadik utas: a Halál','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('266','12','Az utolsó gyönyörû nyár','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('267','12','Bonnie és Clyde','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('268','12','Mindhalálig zene','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('269','17','Isten hozta, Mr.!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('270','17','Kramer kontra Kramer','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('271','17','Brian élete','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('272','22','Apokalipszis most','14');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('273','22','A pacák','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('274','22','Az amerikai barát','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('275','27','A domboknak szeme van','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('304','6','Harcosok klubja','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('277','27','Sóhajok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('278','32','Jimmie Blacksmith dala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('279','32','A facipõ fája','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('280','32','Mennyei napok','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('281','37','Holtak hajnala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('282','37','Bilincs és mosoly','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('283','37','A játéknak vége','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('284','42','Bonnie és Clyde','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('285','42','Csillagosok, katonák','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('286','42','A dzsungel könyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('287','47','Tûz van, babám!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('288','47','A föld transzban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('289','47','Szigorúan ellenõrzött vonatok','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('290','52','A dzsungel könyve','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('291','52','Tûz van, babám!','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('292','52','Mindhalálig zene','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('293','57','Isten hozta, Mr.!','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('294','57','Kramer kontra Kramer','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('295','57','Brian élete','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('296','62','Apokalipszis most','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('297','62','Holtak hajnala','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('298','62','Szigorúan ellenõrzött vonatok','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('305','12','A sebhelyesarcú','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('306','7','Hátsó ablak','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('307','7','A nagy balhé','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('308','9','Egy csodálatos elme','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('309','6','A herceg menyasszonya','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('310','60','Az elefántember','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('311','18','Szigorúan bizalmas','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('312','9','Az elveszett frigyláda fosztogatói','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('313','58','A félelem bére','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('314','24','Biciklitolvajok','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('315','49','Szerelemre hangolva','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('316','33','Acéllövedék','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('317','51','Szemtõl szemben','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('318','48','Közönséges bûnözõk','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('319','2','Ne bántsátok a feketerigót!','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('320','55','Oldboy','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('321','57','A sebhelyesarcú','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('322','53','Egy makulátlan elme örök ragyogása','5');
commit;
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('323','11','Szédülés','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('324','4','A nap vége','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('325','55','Aranypolgár','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('326','33','Mementó','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('327','35','Idétlen idõkig','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('328','12','Kutyaszorítóban','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('329','45','Három szín: piros','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('330','34','A gyûlölet','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('331','35','Gran Torino','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('332','58','Szigorúan piszkos ügyek','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('333','44','Szemtõl szemben','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('334','50','Apokalipszis most','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('335','30','Nem félünk a farkastól','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('336','9','Aranypolgár','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('337','24','Casino','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('338','15','Hotel Ruanda','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('339','46','A halál jele','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('340','6','Mary és Max','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('341','10','Idétlen idõkig','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('342','13','Modern idõk','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('343','36','Vérzõ olaj','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('344','45','Szentjánosbogarak sírja','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('345','8','Az elefántember','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('346','11','Délidõ','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('347','40','12 majom','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('348','62','Blöff','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('349','32','A király beszéde','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('350','21','Laputa - Az égi palota','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('351','41','8 és 1/2','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('352','38','Szemekbe zárt titkok','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('353','23','Egy csodálatos elme','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('354','55','A herceg menyasszonya','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('355','51','Kánikulai délután','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('356','10','Taxisofõr','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('357','23','Toy Story 3','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('358','60','Van, aki forrón szereti','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('359','24','Idegenek a vonaton','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('360','51','Hatodik érzék','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('361','37','Aranyláz','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('362','2','Idétlen idõkig','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('363','26','8 és 1/2','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('364','16','Három szín: piros','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('365','25','A félelem bére','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('366','45','Nagyvárosi fények','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('367','62','A dolog','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('368','29','Oldboy','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('369','25','A dolog','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('370','34','Száll a kakukk fészkére','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('371','55','Gyilkosság telefonhívásra','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('372','29','Idegenek a vonaton','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('373','16','Az elefántember','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('374','54','A félelem bére','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('375','49','A tégla','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('376','12','Ne bántsátok a feketerigót!','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('377','9','Hatodik érzék','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('378','52','Trainspotting','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('379','17','Apám nevében','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('380','27','Volt egyszer egy Amerika','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('381','49','Ryan közlegény megmentése','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('382','24','Amerikai szépség','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('383','22','Brian élete','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('384','41','A szarvasvadász','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('385','52','Út a vadonba','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('386','58','Gyilkosság telefonhívásra','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('387','10','Donnie Darko','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('388','39','A dolog','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('389','51','A tégla','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('390','8','A herceg menyasszonya','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('391','43','Harcosok klubja','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('392','29','Ponyvaregény','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('393','16','Nincs bocsánat','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('394','35','A félelem bére','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('395','55','Fanny és Alexander','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('396','50','A testõr','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('397','53','Délidõ','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('398','3','Rocky','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('399','21','Volt egyszer egy Amerika','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('400','9','A vándorló palota','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('401','41','Egy makulátlan elme örök ragyogása','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('402','25','Vérzõ olaj','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('403','31','Kánikulai délután','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('404','60','Ponyvaregény','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('405','62','Aranyláz','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('406','46','Viharsziget','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('407','50','Nauszika - A szél harcosai','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('408','38','Aranyláz','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('409','7','Mementó','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('410','33','Eredet','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('411','2','Casino','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('412','38','Laputa - Az égi palota','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('413','26','Amerikai szépség','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('414','31','Keresztapa','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('415','54','A vándorló palota','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('416','36','A diktátor','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('417','55','Egy makulátlan elme örök ragyogása','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('418','39','A vándorló palota','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('419','45','Ryan közlegény megmentése','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('420','3','Viharsziget','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('421','48','Trainspotting','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('422','25','Gandhi','4');
commit;
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('423','20','A tengeralattjáró','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('424','30','A rettenthetetlen','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('425','8','A tengeralattjáró','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('426','8','Hetedik','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('427','58','Dühöngõ bika','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('428','15','A gonosz érintése','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('429','2','Délidõ','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('430','30','Szerelemre hangolva','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('431','7','Gladiátor','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('432','37','Dühöngõ bika','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('433','44','Szemtõl szemben','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('434','54','Modern idõk','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('435','13','Szemtõl szemben','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('436','41','Fanny és Alexander','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('437','22','Az elefántember','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('438','25','Nem félünk a farkastól','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('439','16','Vérzõ olaj','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('440','46','A gyûlölet','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('441','27','Halálsoron','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('442','11','A félelem bére','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('443','11','Casino','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('444','3','Halálsoron','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('445','48','Gandhi','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('446','23','Keresztapa 2','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('447','49','Kínai negyed','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('448','46','Idegenek a vonaton','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('449','48','Gandhi','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('450','23','Acéllövedék','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('451','48','Akira','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('452','46','Szárnyas fejvadász','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('453','4','Rocky','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('454','16','Három szín: piros','3');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('455','34','Fanny és Alexander','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('456','51','Chihiro szellemországban','2');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('457','26','A nap vége','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('458','12','Szerelemre hangolva','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('459','10','Nagymenõk','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('460','14','Nem félünk a farkastól','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('461','13','Szentjánosbogarak sírja','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('462','46','Modern idõk','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('463','40','Délidõ','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('464','53','A faun labirintusa','5');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('465','57','A rettenthetetlen','7');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('466','2','A halál jele','4');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('467','37','A tégla','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('468','53','Hetedik','6');
Insert into KOLCSONZES (SORSZAM,KOLCSONZO,FILM,NAPOK) values ('469','45','A zongorista','2');
commit;
-- Unable to render INDEX DDL for object SYS_C0026319 with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX SYS_C0026319 ON KOLCSONZES (SORSZAM ASC);
