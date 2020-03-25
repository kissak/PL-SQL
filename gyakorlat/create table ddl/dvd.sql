--------------------------------------------------------
--  File created - péntek-május-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object DVD with DBMS_METADATA attempting internal generator.


CREATE TABLE DVD 
(
  SORSZAM NUMBER(4, 0) NOT NULL 
, FILM VARCHAR2(128 BYTE) 
, RENDEZO VARCHAR2(64 BYTE) 
, EV NUMBER(4, 0) 
, HOSSZ NUMBER(3, 0) 
, MUFAJ1 VARCHAR2(32 BYTE) 
, MUFAJ2 VARCHAR2(32 BYTE) 
, BESOROLAS VARCHAR2(32 BYTE) 
, IMDB_PONTSZAM NUMBER(3, 2) 
, GYARTO_ORSZAG VARCHAR2(32 BYTE) 
);

CREATE UNIQUE INDEX SYS_C0031837 ON DVD (FILM ASC);
ALTER TABLE DVD
ADD CONSTRAINT SYS_C0031837 UNIQUE 
(
  FILM 
);

ALTER TABLE DVD
ADD CONSTRAINT SYS_C0031836 PRIMARY KEY 
(
  SORSZAM 
);

REM INSERTING into DVD
SET DEFINE OFF;
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('14','A játéknak vége','John Boorman','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('16','Bonnie és Clyde','Arthur Penn','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('17','Csillagosok, katonák','Jancsó Miklós','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('18','A dzsungel könyve','Wolfgang Reitherman','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('19','Tûz van, babám!','Milos Forman','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('20','A föld transzban','Glauber Rocha','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('21','Szigorúan ellenõrzött vonatok','Jiri Menzel','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('22','Volt egyszer egy Vadnyugat','Sergio Leone','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('23','A majmok bolygója','Franklin J. Schaffner','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('24','Arcok','John Cassavetes','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('25','Rosemary gyermeke','Roman Polanski','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('26','Ha?','Lindsay Anderson',null,null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('27','Producerek','Mel Brooks','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('28','Szégyen','Ingmar Bergman','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('29','2001: Ûrodüsszeia','Stanley Kubrick','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('30','Farkasok órája','Ingmar Bergman','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('31','Célpontok','Peter Bogdanovich',null,null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('32','Az élõhalottak éjszakája','George A. Romero','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('33','Éjszakám Maudnál','Eric Rohmer','1969',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('84','Pillangó','Franklin J. Schaffner','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('85','A sárkány közbelép','Robert Clouse','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('86','Aljas utcák','Martin Scorsese','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('87','A hosszú búcsú','Kira Muratova','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('88','A vesszõbõl font ember','Robin Hardy','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('89','Amerikai éjszaka','François Truffaut','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('90','Ne nézz vissza!','Nicolas Roeg','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('150','Szansó tiszttartó','Kendzsi Mizogucsi','1954',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('300','Isten hozta!','Buster Keaton','1923',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('316','Napóleon','Abel Gance','1927',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('317','Öcskös','Ted Wilde','1927',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('318','Dübörgõ élet','King Vidor','1928',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('319','New York kikötõi','Josef von Sternberg','1928',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('320','Az andalúziai kutya','Luis Bu?uel','1928',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('349','Rivaldafény parádé','Lloyd Bacon','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('350','Aranyásók 1933-ban','Mervyn LeRoy','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('351','Kacsaleves','Leo McCarey','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('352','Krisztina királynõ','Rouben Mamoulian','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('353','King Kong','Merian C. Cooper, Ernest B. Schoedsack','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('354','A sivatag fiai','William A. Seiter','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('355','Az akarat diadala','Leni Riefenstahl','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('356','Atalante','Jean Vigo','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('357','A fekete macska','Edgar G. Ulmer','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('358','Ez történt egy éjszaka','Frank Capra','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('359','A sovány ember','W. S. Van Dyke','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('360','Blood kapitány','Kertész Mihály','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('361','Lázadás a Bountyn','Frank Lloyd','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('362','Botrány az operában','Sam Wood','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('363','39 lépcsõfok','Alfred Hitchcock','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('364','Frankenstein menyasszonya','James Whale','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('365','Frakkban és klakkban','Mark Sandrich','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('376','A nagy ábránd','Jean Renoir','1937',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('377','Asszonyok a lejtõn','King Vidor',null,null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('378','Zola','William Dieterle','1937',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('379','Hófehérke és a hét törpe','Walt Disney Ltd.','1937',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('380','Az alvilág királya','Julien Duvivier','1937',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('381','Jezabel','William Wyler','1938',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('382','Robin Hood','Kertész Mihály','1938',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('450','Szép remények','David Lean','1946',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('469','Iszonyat','Roman Polanski','1965',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('470','Júlia és a szellemek','Federico Fellini','1965',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('471','Bolond Pierrot','Jean-Luc Godard','1965',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('500','Jeanne Dielman, 1080 Brüsszel, Kereskedõ utca 23.','Chantal Akerman','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('501','The Rocky Horror Picture Show','Jam Sharman','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('502','Gyalog galopp','Terry Gillian, Terry Jones','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('503','A szabadság ököljoga','Rainer Werner Fassbinder','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('504','Piknik a Függõ Sziklánál','Peter Weir','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('516','Huszadik század','Bernardo Bertolucci','1976',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('517','A Földre pottyant férfi','Nicolas Roeg','1976',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('518','Csillagok háborúja IV: Új remény','George Lucas','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('519','Harmadik típusú találkozások','Stewen Spielberg','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('520','Utánam a vízözön','Peter Weir','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('521','Annie Hall','Woody Allen','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('522','A márványember','Andrzej Wajda','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('523','Szombat esti láz','John Badham','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('524','Radírfej','David Lynch','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('525','Az amerikai barát','Wim Wenders','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('526','A domboknak szeme van','Wes Craven','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('527','Sóhajok','Dario Argento','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('528','Jimmie Blacksmith dala','Fred Schepisi','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('529','A facipõ fája','Emanno Olmi','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('532','Mennyei napok','Terrence Malick','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('533','Holtak hajnala','George A. Romero','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('534','A Shaolin 36 próbatétele','Liu Csia Liang','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('535','A nagy szívás','Cheech Marin','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('536','Halloween ? A rémület éjszakája','John Carpenter','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('537','Maria Braun házassága','Rainer Werner Fassbinder','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('538','Ragyogó karrierem','Gillian Armstrong','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('540','A nyolcadik utas: a Halál','Ridley Scott','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('541','Az utolsó gyönyörû nyár','Peter Yates','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('543','Mindhalálig zene','Bob Fosse','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('544','Isten hozta, Mr.!','Hal Ashby','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('545','Kramer kontra Kramer','Robert Benton','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('548','A pacák','Carl Reiner','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('600','Amadeus','Milos Forman','1984',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('750','Az Oroszlánkirály','Walt Disney Ltd.','1994',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('815','8 és 1/2','Federico Fellini','1963','138','filmdráma',null,'csak 6 éven felülieknek','8','Olaszország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('863','Apokalipszis most','Francis Ford Coppola','1979','202','filmdráma',null,'Csak 16 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('759','Keresztapa','Francis Ford Coppola','1972','174','társadalmi dráma',null,'Csak 16 éven felülieknek','9,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('760','Keresztapa 2','Francis Ford Coppola','1974','203','társadalmi dráma',null,'Csak 16 éven felülieknek','9','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('843','A remény rabjai','Frank Darabont','1994','137','filmdráma',null,'csak 14 éven felülieknek','9,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('897','Halálsoron','Frank Darabont','1999','188','filmdráma',null,'Csak 18 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('880','Délidõ','Fred Zinnemann','1952','109','western',null,'csak 6 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('767','M - Egy város keresi a gyilkost','Fritz Lang','1931',null,'bûnügyi',null,'csak 6 éven felülieknek','8,3','Németország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('879','Csillagok háborúja','George Lucas','1977','121','sci_fi',null,'Korhatár nélkül','8,6','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('837','A nagy balhé','George Roy Hill','1973',null,'filmdráma',null,'csak 6 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('876','Butch Cassidy és a Sundance kölyök','George Roy Hill','1969','106','kaland',null,'csak 6 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('823','A faun labirintusa','Guillermo del Toro','2006','120','fantasy',null,'csak 12 éven felülieknek','8,2','Spanyolország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('874','Blöff','Guy Ritchie','2000','99','bûnügyi',' vígjáték','Csak 16 éven felülieknek','8,3','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('751','Idétlen idõkig','Harold Ramis','1993','101','vígjáték',null,'Korhatár nélkül','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('854','A vándorló palota','Hayao Miyazaki','2004','119','animáció',null,'csak 6 éven felülieknek','8,2','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('878','Chihiro szellemországban','Hayao Miyazaki','2001','125','animáció',null,'Korhatár nélkül','8,5','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('766','Laputa - Az égi palota','Hayao Miyazaki','1986','124','animáció',null,'csak 6 éven felülieknek','8','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('776','Nauszika - A szél harcosai','Hayao Miyazaki','1984','91','animáció',null,'csak 6 éven felülieknek','8,1','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('803','Totoro - A varázserdõ titka','Hayao Miyazaki','1988','83','animáció',null,'csak 6 éven felülieknek','8,2','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('824','A félelem bére','Henri-Georges Clouzot','1953',null,'thriller',null,'csak 6 éven felülieknek','8,1','Franciaország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('840','A nap vége','Ingmar Bergman','1957',null,'filmdráma',null,'csak 6 éven felülieknek','8,2','Svédország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('888','Fanny és Alexander','Ingmar Bergman','1982','189','fantasy',null,'csak 12 éven felülieknek','8','Franciaország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('785','Persona','Ingmar Bergman','1966',null,'filmdráma',null,'csak 12 éven felülieknek','8,1','Svédország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('797','Szentjánosbogarak sírja','Isao Takahata','1988','90','animáció',null,'csak 6 éven felülieknek','8,4','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('858','Amélie csodálatos élete','Jean-Pierre Jeunet','2001','122','romantikus',' vígjáték','csak 14 éven felülieknek','8,3','Franciaország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('859','Amerikai história X','Tony Kaye','1998','117','filmdráma',null,'Csak 16 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('872','Biciklitolvajok','Vittorio De Sica','1948','99','filmdráma',null,'csak 14 éven felülieknek','8,3','Olaszország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('800','Szigorúan piszkos ügyek','Wai-keung Lau','2002','101','thriller',null,'Csak 16 éven felülieknek','8','Hong Kong');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('851','A tengeralattjáró','Wolfgang Petersen','1981','200','háborús',null,'csak 12 éven felülieknek','8,4','NSZK');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('798','Szerelemre hangolva','Wong Kar-Wai','2000','98','romantikus',' dráma','csak 14 éven felülieknek','8','Hong Kong');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('862','Apám nevében','Jim Sheridan','1993','133','filmdráma',null,'csak 14 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('838','A nagy Lebowski','Joel Coen','1998','113','vígjáték',null,'csak 14 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('822','A dolog','John Carpenter','1982','103','horror',null,'Csak 16 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('789','Rocky','John G. Avildsen','1976',null,'filmdráma',null,'csak 6 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('839','A nagy szökés','John Sturges','1963','173','kaland',null,'csak 6 éven felülieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('816','A bárányok hallgatnak','Jonathan Demme','1991','118','thriller',null,'Csak 18 éven felülieknek','8,6','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('831','A halál jele','Joon-ho Bong','2003','131','bûnügyi',null,'csak 12 éven felülieknek','8','Dél-Korea');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('795','Szemekbe zárt titkok','Juan José Campanella','2009','124','romantikus',' dráma','csak 12 éven felülieknek','8,2','Argentína');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('857','Akira','Katsuhiro Ôtomo','1988','124','animáció',null,'csak 12 éven felülieknek','8','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('900','Három szín: piros','Krzysztof Kieslowski','1994','93','filmdráma',null,'csak 14 éven felülieknek','8','Lengyelország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('804','Toy Story 3','Lee Unkrich','2010','108','animáció',null,'csak 6 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('901','Hatodik érzék','M. Night Shyamalan','1999','107','filmdráma',null,'Csak 18 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('850','A tégla','Martin Scorsese','2006','152','bûnügyi',null,'csak 12 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('877','Casino','Martin Scorsese','1995','178','bûnügyi',null,'Csak 16 éven felülieknek','8,2','Franciaország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('882','Dühöngõ bika','Martin Scorsese','1980','130','életrajzi',null,'csak 14 éven felülieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('774','Nagymenõk','Martin Scorsese','1990','145','bûnügyi',null,'csak 12 éven felülieknek','8,7','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('802','Taxisofõr','Martin Scorsese','1976','109','társadalmi dráma',null,'Csak 18 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('810','Viharsziget','Martin Scorsese','2010','132','thriller',null,'csak 12 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('827','A gyûlölet','Mathieu Kassovitz','1995','95','filmdráma',null,'csak 14 éven felülieknek','8','Franciaország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('844','A rettenthetetlen','Mel Gibson','1995','178','történelmi',' dráma','csak 14 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('848','A szarvasvadász','Michael Cimino','1978','183','háborús',null,'Csak 16 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('796','Szemtõl szemben','Michael Mann','1995','173','bûnügyi',null,'Csak 16 éven felülieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('884','Egy makulátlan elme örök ragyogása','Michel Gondry','2004',null,'vígjáték',null,'csak 6 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('778','Nem félünk a farkastól','Mike Nichols','1966',null,'filmdráma',null,'csak 12 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('792','Száll a kakukk fészkére','Milos Forman','1975','128','filmdráma',null,'csak 12 éven felülieknek','8,7','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('819','A bukás - Hitler utolsó napjai','Oliver Hirschbiegel','2004','156','háborús',null,'csak 6 éven felülieknek','8,2','Németország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('847','A szakasz','Oliver Stone','1986','122','háborús',null,'Csak 16 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('826','A gonosz érintése','Orson Welles','1958',null,'bûnügyi',null,'csak 6 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('866','Aranypolgár','Orson Welles','1941','119','filmdráma',null,'Korhatár nélkül','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('809','Vérzõ olaj','Paul Thomas Anderson','2007','158','filmdráma',null,'csak 12 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('765','Kutyaszorítóban','Quentin Tarantino','1992','99','thriller',null,'Csak 16 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('786','Ponyvaregény','Quentin Tarantino','1994','148','bûnügyi',null,'Csak 18 éven felülieknek','8,9','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('892','Gandhi','Richard Attenborough','1982','190','történelmi',' dráma','csak 14 éven felülieknek','8','India');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('881','Donnie Darko','Richard Kelly','2001','113','thriller',null,'csak 14 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('893','Gladiátor','Ridley Scott','2000','149','történelmi',' kaland','Csak 16 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('793','Szárnyas fejvadász','Ridley Scott','1982','117','sci_fi',null,'Csak 16 éven felülieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('832','A herceg menyasszonya','Rob Reiner','1987','98','mese',null,'Korhatár nélkül','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('777','Ne bántsátok a feketerigót!','Robert Mulligan','1962','124','bûnügyi',null,'csak 6 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('811','Vissza a jövõbe','Robert Zemeckis','1985','118','sci_fi',null,'Korhatár nélkül','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('868','Az élet szép','Roberto Benigni','1997','199','filmdráma',null,'csak 14 éven felülieknek','8,6','Olaszország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('855','A zongorista','Roman Polanski','2002','149','háborús',null,'csak 14 éven felülieknek','8,5','Lengyelország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('762','Kínai negyed','Roman Polanski','1974',null,'dráma','thriller','csak 12 éven felülieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('883','Egy csodálatos elme','Ron Howard','2001','134','filmdráma',null,'csak 14 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('860','Amerikai szépség','Sam Mendes','1999','122','filmdráma',null,'Csak 16 éven felülieknek','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('807','Út a vadonba','Sean Penn','2007','142','kaland',null,'csak 6 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('784','Pár dollárral többért','Sergio Leone','1965',null,'western',null,'csak 12 éven felülieknek','8,3','Németország');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('812','Volt egyszer egy Amerika','Sergio Leone','1984','230','társadalmi dráma',null,'csak 14 éven felülieknek','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('898','Hálózat','Sidney Lumet','1976','133','filmdráma',null,'Csak 16 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('756','Kánikulai délután','Sidney Lumet','1975',null,'bûnügyi',null,'csak 12 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('856','Acéllövedék','Stanley Kubrick','1987','116','akció',null,'Csak 16 éven felülieknek','8,3','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('820','A cápa','Steven Spielberg','1975',null,'horror',null,'csak 12 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('869','Az elveszett frigyláda fosztogatói','Steven Spielberg','1981','117','kaland',null,'csak 14 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('758','Kapj el, ha tudsz','Steven Spielberg','2002','141','bûnügyi',null,'csak 14 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('790','Ryan közlegény megmentése','Steven Spielberg','1998','162','háborús',null,'Csak 16 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('791','Schindler listája','Steven Spielberg','1993','187','filmdráma',null,'csak 14 éven felülieknek','8,9','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('873','Bilincs és mosoly','Stuart Rosenberg','1967',null,'filmdráma',null,'csak 12 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('904','Hotel Ruanda','Terry George','2004','121','filmdráma',null,'csak 6 éven felülieknek','8,1','Dél-Afrika');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('814','12 majom','Terry Gilliam','1995','124','akció',null,'csak 14 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('875','Brian élete','Terry Jones','1979','90','vígjáték',null,'csak 12 éven felülieknek','8,1','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('835','A király beszéde','Tom Hooper','2010',null,'történelmi','dráma','csak 6 éven felülieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('768','Mary és Max','Adam Elliot','2009','95','animáció',null,'csak 6 éven felülieknek','8,1','Ausztrália');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('852','A testõr','Akira Kurosawa','1961','111','filmdráma',null,'Csak 16 éven felülieknek','8,2','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('757','Káosz','Akira Kurosawa','1985','160','filmdráma',null,'csak 14 éven felülieknek','8,2','Japán');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('896','Gyilkosság telefonhívásra','Alfred Hitchcock','1954',null,'thriller',null,'csak 6 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('902','Hátsó ablak','Alfred Hitchcock','1954','114','thriller',null,'csak 14 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('905','Idegenek a vonaton','Alfred Hitchcock','1951',null,'thriller',null,'csak 6 éven felülieknek','8','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('787','Psycho','Alfred Hitchcock','1960','108','thriller',null,'Csak 18 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('794','Szédülés','Alfred Hitchcock','1958','130','bûnügyi',null,'csak 14 éven felülieknek','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('801','Sztalker','Andrej Tarkovszkij','1979','165','sci_fi',null,'Csak 16 éven felülieknek','8,1','Szovjetunió');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('808','Van, aki forrón szereti','Billy Wilder','1959','116','vígjáték',null,'csak 6 éven felülieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('845','A sebhelyesarcú','Brian De Palma','1983','163','akció',' thriller','Csak 16 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('764','Közönséges bûnözõk','Bryan Singer','1995','106','bûnügyi',null,'Csak 16 éven felülieknek','8,6','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('782','Oldboy','Chan-Wook Park','2003','120','thriller',null,'Csak 16 éven felülieknek','8,4','Dél-Korea');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('865','Aranyláz','Charles Chaplin','1925',null,'vígjáték',null,'Korhatár nélkül','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('773','Modern idõk','Charles Chaplin','1936','86','vígjáték',null,'Korhatár nélkül','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('775','Nagyvárosi fények','Charles Chaplin','1931',null,'vígjáték',null,'Korhatár nélkül','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('821','A diktátor','Charlie Chaplin','1940','128','vígjáték',null,'Korhatár nélkül','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('846','A sötét lovag','Christopher Nolan','2008','152','akció',null,'csak 12 éven felülieknek','8,9','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('853','A tökéletes trükk','Christopher Nolan','2006','130','thriller',null,'csak 6 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('887','Eredet','Christopher Nolan','2010','148','sci_fi',null,'csak 12 éven felülieknek','8,7','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('770','Mementó','Christopher Nolan','2000','113','filmdráma',null,'Csak 16 éven felülieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('895','Gran Torino','Clint Eastwood','2008','116','filmdráma',null,'csak 12 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('772','Millió dolláros bébi','Clint Eastwood','2004','132','filmdráma',null,'csak 12 éven felülieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('781','Nincs bocsánat','Clint Eastwood','1992','125','western',null,'csak 14 éven felülieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('799','Szigorúan bizalmas','Curtis Hanson','1997','136','bûnügyi',null,'csak 14 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('805','Trainspotting','Danny Boyle','1996','90','filmdráma',null,'csak 12 éven felülieknek','8,1','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('788','Rekviem egy álomért','Darren Aronofsky','2000','97','filmdráma',null,'Csak 16 éven felülieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('899','Harcosok klubja','David Fincher','1999','133','akció',null,'Csak 18 éven felülieknek','8,8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('903','Hetedik','David Fincher','1995','127','thriller',null,'Csak 18 éven felülieknek','8,6','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('864','Arábiai Lawrence','David Lean','1962','222','kaland',null,'csak 6 éven felülieknek','8,3','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('867','Az elefántember','David Lynch','1980','125','filmdráma',null,'csak 14 éven felülieknek','8,2','Nagy-Britannia');
COMMIT;