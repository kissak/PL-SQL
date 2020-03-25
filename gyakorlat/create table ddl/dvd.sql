--------------------------------------------------------
--  File created - p�ntek-m�jus-12-2017   
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
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('14','A j�t�knak v�ge','John Boorman','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('16','Bonnie �s Clyde','Arthur Penn','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('17','Csillagosok, katon�k','Jancs� Mikl�s','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('18','A dzsungel k�nyve','Wolfgang Reitherman','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('19','T�z van, bab�m!','Milos Forman','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('20','A f�ld transzban','Glauber Rocha','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('21','Szigor�an ellen�rz�tt vonatok','Jiri Menzel','1967',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('22','Volt egyszer egy Vadnyugat','Sergio Leone','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('23','A majmok bolyg�ja','Franklin J. Schaffner','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('24','Arcok','John Cassavetes','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('25','Rosemary gyermeke','Roman Polanski','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('26','Ha?','Lindsay Anderson',null,null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('27','Producerek','Mel Brooks','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('28','Sz�gyen','Ingmar Bergman','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('29','2001: �rod�sszeia','Stanley Kubrick','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('30','Farkasok �r�ja','Ingmar Bergman','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('31','C�lpontok','Peter Bogdanovich',null,null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('32','Az �l�halottak �jszak�ja','George A. Romero','1968',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('33','�jszak�m Maudn�l','Eric Rohmer','1969',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('84','Pillang�','Franklin J. Schaffner','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('85','A s�rk�ny k�zbel�p','Robert Clouse','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('86','Aljas utc�k','Martin Scorsese','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('87','A hossz� b�cs�','Kira Muratova','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('88','A vessz�b�l font ember','Robin Hardy','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('89','Amerikai �jszaka','Fran�ois Truffaut','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('90','Ne n�zz vissza!','Nicolas Roeg','1973',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('150','Szans� tiszttart�','Kendzsi Mizogucsi','1954',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('300','Isten hozta!','Buster Keaton','1923',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('316','Nap�leon','Abel Gance','1927',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('317','�csk�s','Ted Wilde','1927',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('318','D�b�rg� �let','King Vidor','1928',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('319','New York kik�t�i','Josef von Sternberg','1928',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('320','Az andal�ziai kutya','Luis Bu?uel','1928',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('349','Rivaldaf�ny par�d�','Lloyd Bacon','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('350','Arany�s�k 1933-ban','Mervyn LeRoy','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('351','Kacsaleves','Leo McCarey','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('352','Krisztina kir�lyn�','Rouben Mamoulian','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('353','King Kong','Merian C. Cooper, Ernest B. Schoedsack','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('354','A sivatag fiai','William A. Seiter','1933',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('355','Az akarat diadala','Leni Riefenstahl','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('356','Atalante','Jean Vigo','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('357','A fekete macska','Edgar G. Ulmer','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('358','Ez t�rt�nt egy �jszaka','Frank Capra','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('359','A sov�ny ember','W. S. Van Dyke','1934',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('360','Blood kapit�ny','Kert�sz Mih�ly','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('361','L�zad�s a Bountyn','Frank Lloyd','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('362','Botr�ny az oper�ban','Sam Wood','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('363','39 l�pcs�fok','Alfred Hitchcock','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('364','Frankenstein menyasszonya','James Whale','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('365','Frakkban �s klakkban','Mark Sandrich','1935',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('376','A nagy �br�nd','Jean Renoir','1937',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('377','Asszonyok a lejt�n','King Vidor',null,null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('378','Zola','William Dieterle','1937',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('379','H�feh�rke �s a h�t t�rpe','Walt Disney Ltd.','1937',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('380','Az alvil�g kir�lya','Julien Duvivier','1937',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('381','Jezabel','William Wyler','1938',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('382','Robin Hood','Kert�sz Mih�ly','1938',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('450','Sz�p rem�nyek','David Lean','1946',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('469','Iszonyat','Roman Polanski','1965',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('470','J�lia �s a szellemek','Federico Fellini','1965',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('471','Bolond Pierrot','Jean-Luc Godard','1965',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('500','Jeanne Dielman, 1080 Br�sszel, Keresked� utca 23.','Chantal Akerman','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('501','The Rocky Horror Picture Show','Jam Sharman','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('502','Gyalog galopp','Terry Gillian, Terry Jones','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('503','A szabads�g �k�ljoga','Rainer Werner Fassbinder','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('504','Piknik a F�gg� Szikl�n�l','Peter Weir','1975',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('516','Huszadik sz�zad','Bernardo Bertolucci','1976',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('517','A F�ldre pottyant f�rfi','Nicolas Roeg','1976',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('518','Csillagok h�bor�ja IV: �j rem�ny','George Lucas','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('519','Harmadik t�pus� tal�lkoz�sok','Stewen Spielberg','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('520','Ut�nam a v�z�z�n','Peter Weir','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('521','Annie Hall','Woody Allen','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('522','A m�rv�nyember','Andrzej Wajda','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('523','Szombat esti l�z','John Badham','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('524','Rad�rfej','David Lynch','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('525','Az amerikai bar�t','Wim Wenders','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('526','A domboknak szeme van','Wes Craven','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('527','S�hajok','Dario Argento','1977',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('528','Jimmie Blacksmith dala','Fred Schepisi','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('529','A facip� f�ja','Emanno Olmi','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('532','Mennyei napok','Terrence Malick','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('533','Holtak hajnala','George A. Romero','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('534','A Shaolin 36 pr�bat�tele','Liu Csia Liang','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('535','A nagy sz�v�s','Cheech Marin','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('536','Halloween ? A r�m�let �jszak�ja','John Carpenter','1978',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('537','Maria Braun h�zass�ga','Rainer Werner Fassbinder','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('538','Ragyog� karrierem','Gillian Armstrong','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('540','A nyolcadik utas: a Hal�l','Ridley Scott','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('541','Az utols� gy�ny�r� ny�r','Peter Yates','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('543','Mindhal�lig zene','Bob Fosse','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('544','Isten hozta, Mr.!','Hal Ashby','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('545','Kramer kontra Kramer','Robert Benton','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('548','A pac�k','Carl Reiner','1979',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('600','Amadeus','Milos Forman','1984',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('750','Az Oroszl�nkir�ly','Walt Disney Ltd.','1994',null,null,null,null,null,null);
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('815','8 �s 1/2','Federico Fellini','1963','138','filmdr�ma',null,'csak 6 �ven fel�lieknek','8','Olaszorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('863','Apokalipszis most','Francis Ford Coppola','1979','202','filmdr�ma',null,'Csak 16 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('759','Keresztapa','Francis Ford Coppola','1972','174','t�rsadalmi dr�ma',null,'Csak 16 �ven fel�lieknek','9,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('760','Keresztapa 2','Francis Ford Coppola','1974','203','t�rsadalmi dr�ma',null,'Csak 16 �ven fel�lieknek','9','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('843','A rem�ny rabjai','Frank Darabont','1994','137','filmdr�ma',null,'csak 14 �ven fel�lieknek','9,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('897','Hal�lsoron','Frank Darabont','1999','188','filmdr�ma',null,'Csak 18 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('880','D�lid�','Fred Zinnemann','1952','109','western',null,'csak 6 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('767','M - Egy v�ros keresi a gyilkost','Fritz Lang','1931',null,'b�n�gyi',null,'csak 6 �ven fel�lieknek','8,3','N�metorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('879','Csillagok h�bor�ja','George Lucas','1977','121','sci_fi',null,'Korhat�r n�lk�l','8,6','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('837','A nagy balh�','George Roy Hill','1973',null,'filmdr�ma',null,'csak 6 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('876','Butch Cassidy �s a Sundance k�ly�k','George Roy Hill','1969','106','kaland',null,'csak 6 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('823','A faun labirintusa','Guillermo del Toro','2006','120','fantasy',null,'csak 12 �ven fel�lieknek','8,2','Spanyolorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('874','Bl�ff','Guy Ritchie','2000','99','b�n�gyi',' v�gj�t�k','Csak 16 �ven fel�lieknek','8,3','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('751','Id�tlen id�kig','Harold Ramis','1993','101','v�gj�t�k',null,'Korhat�r n�lk�l','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('854','A v�ndorl� palota','Hayao Miyazaki','2004','119','anim�ci�',null,'csak 6 �ven fel�lieknek','8,2','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('878','Chihiro szellemorsz�gban','Hayao Miyazaki','2001','125','anim�ci�',null,'Korhat�r n�lk�l','8,5','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('766','Laputa - Az �gi palota','Hayao Miyazaki','1986','124','anim�ci�',null,'csak 6 �ven fel�lieknek','8','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('776','Nauszika - A sz�l harcosai','Hayao Miyazaki','1984','91','anim�ci�',null,'csak 6 �ven fel�lieknek','8,1','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('803','Totoro - A var�zserd� titka','Hayao Miyazaki','1988','83','anim�ci�',null,'csak 6 �ven fel�lieknek','8,2','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('824','A f�lelem b�re','Henri-Georges Clouzot','1953',null,'thriller',null,'csak 6 �ven fel�lieknek','8,1','Franciaorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('840','A nap v�ge','Ingmar Bergman','1957',null,'filmdr�ma',null,'csak 6 �ven fel�lieknek','8,2','Sv�dorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('888','Fanny �s Alexander','Ingmar Bergman','1982','189','fantasy',null,'csak 12 �ven fel�lieknek','8','Franciaorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('785','Persona','Ingmar Bergman','1966',null,'filmdr�ma',null,'csak 12 �ven fel�lieknek','8,1','Sv�dorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('797','Szentj�nosbogarak s�rja','Isao Takahata','1988','90','anim�ci�',null,'csak 6 �ven fel�lieknek','8,4','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('858','Am�lie csod�latos �lete','Jean-Pierre Jeunet','2001','122','romantikus',' v�gj�t�k','csak 14 �ven fel�lieknek','8,3','Franciaorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('859','Amerikai hist�ria X','Tony Kaye','1998','117','filmdr�ma',null,'Csak 16 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('872','Biciklitolvajok','Vittorio De Sica','1948','99','filmdr�ma',null,'csak 14 �ven fel�lieknek','8,3','Olaszorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('800','Szigor�an piszkos �gyek','Wai-keung Lau','2002','101','thriller',null,'Csak 16 �ven fel�lieknek','8','Hong Kong');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('851','A tengeralattj�r�','Wolfgang Petersen','1981','200','h�bor�s',null,'csak 12 �ven fel�lieknek','8,4','NSZK');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('798','Szerelemre hangolva','Wong Kar-Wai','2000','98','romantikus',' dr�ma','csak 14 �ven fel�lieknek','8','Hong Kong');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('862','Ap�m nev�ben','Jim Sheridan','1993','133','filmdr�ma',null,'csak 14 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('838','A nagy Lebowski','Joel Coen','1998','113','v�gj�t�k',null,'csak 14 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('822','A dolog','John Carpenter','1982','103','horror',null,'Csak 16 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('789','Rocky','John G. Avildsen','1976',null,'filmdr�ma',null,'csak 6 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('839','A nagy sz�k�s','John Sturges','1963','173','kaland',null,'csak 6 �ven fel�lieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('816','A b�r�nyok hallgatnak','Jonathan Demme','1991','118','thriller',null,'Csak 18 �ven fel�lieknek','8,6','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('831','A hal�l jele','Joon-ho Bong','2003','131','b�n�gyi',null,'csak 12 �ven fel�lieknek','8','D�l-Korea');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('795','Szemekbe z�rt titkok','Juan Jos� Campanella','2009','124','romantikus',' dr�ma','csak 12 �ven fel�lieknek','8,2','Argent�na');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('857','Akira','Katsuhiro �tomo','1988','124','anim�ci�',null,'csak 12 �ven fel�lieknek','8','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('900','H�rom sz�n: piros','Krzysztof Kieslowski','1994','93','filmdr�ma',null,'csak 14 �ven fel�lieknek','8','Lengyelorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('804','Toy Story 3','Lee Unkrich','2010','108','anim�ci�',null,'csak 6 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('901','Hatodik �rz�k','M. Night Shyamalan','1999','107','filmdr�ma',null,'Csak 18 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('850','A t�gla','Martin Scorsese','2006','152','b�n�gyi',null,'csak 12 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('877','Casino','Martin Scorsese','1995','178','b�n�gyi',null,'Csak 16 �ven fel�lieknek','8,2','Franciaorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('882','D�h�ng� bika','Martin Scorsese','1980','130','�letrajzi',null,'csak 14 �ven fel�lieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('774','Nagymen�k','Martin Scorsese','1990','145','b�n�gyi',null,'csak 12 �ven fel�lieknek','8,7','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('802','Taxisof�r','Martin Scorsese','1976','109','t�rsadalmi dr�ma',null,'Csak 18 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('810','Viharsziget','Martin Scorsese','2010','132','thriller',null,'csak 12 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('827','A gy�l�let','Mathieu Kassovitz','1995','95','filmdr�ma',null,'csak 14 �ven fel�lieknek','8','Franciaorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('844','A rettenthetetlen','Mel Gibson','1995','178','t�rt�nelmi',' dr�ma','csak 14 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('848','A szarvasvad�sz','Michael Cimino','1978','183','h�bor�s',null,'Csak 16 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('796','Szemt�l szemben','Michael Mann','1995','173','b�n�gyi',null,'Csak 16 �ven fel�lieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('884','Egy makul�tlan elme �r�k ragyog�sa','Michel Gondry','2004',null,'v�gj�t�k',null,'csak 6 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('778','Nem f�l�nk a farkast�l','Mike Nichols','1966',null,'filmdr�ma',null,'csak 12 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('792','Sz�ll a kakukk f�szk�re','Milos Forman','1975','128','filmdr�ma',null,'csak 12 �ven fel�lieknek','8,7','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('819','A buk�s - Hitler utols� napjai','Oliver Hirschbiegel','2004','156','h�bor�s',null,'csak 6 �ven fel�lieknek','8,2','N�metorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('847','A szakasz','Oliver Stone','1986','122','h�bor�s',null,'Csak 16 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('826','A gonosz �rint�se','Orson Welles','1958',null,'b�n�gyi',null,'csak 6 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('866','Aranypolg�r','Orson Welles','1941','119','filmdr�ma',null,'Korhat�r n�lk�l','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('809','V�rz� olaj','Paul Thomas Anderson','2007','158','filmdr�ma',null,'csak 12 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('765','Kutyaszor�t�ban','Quentin Tarantino','1992','99','thriller',null,'Csak 16 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('786','Ponyvareg�ny','Quentin Tarantino','1994','148','b�n�gyi',null,'Csak 18 �ven fel�lieknek','8,9','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('892','Gandhi','Richard Attenborough','1982','190','t�rt�nelmi',' dr�ma','csak 14 �ven fel�lieknek','8','India');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('881','Donnie Darko','Richard Kelly','2001','113','thriller',null,'csak 14 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('893','Gladi�tor','Ridley Scott','2000','149','t�rt�nelmi',' kaland','Csak 16 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('793','Sz�rnyas fejvad�sz','Ridley Scott','1982','117','sci_fi',null,'Csak 16 �ven fel�lieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('832','A herceg menyasszonya','Rob Reiner','1987','98','mese',null,'Korhat�r n�lk�l','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('777','Ne b�nts�tok a feketerig�t!','Robert Mulligan','1962','124','b�n�gyi',null,'csak 6 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('811','Vissza a j�v�be','Robert Zemeckis','1985','118','sci_fi',null,'Korhat�r n�lk�l','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('868','Az �let sz�p','Roberto Benigni','1997','199','filmdr�ma',null,'csak 14 �ven fel�lieknek','8,6','Olaszorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('855','A zongorista','Roman Polanski','2002','149','h�bor�s',null,'csak 14 �ven fel�lieknek','8,5','Lengyelorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('762','K�nai negyed','Roman Polanski','1974',null,'dr�ma','thriller','csak 12 �ven fel�lieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('883','Egy csod�latos elme','Ron Howard','2001','134','filmdr�ma',null,'csak 14 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('860','Amerikai sz�ps�g','Sam Mendes','1999','122','filmdr�ma',null,'Csak 16 �ven fel�lieknek','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('807','�t a vadonba','Sean Penn','2007','142','kaland',null,'csak 6 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('784','P�r doll�rral t�bb�rt','Sergio Leone','1965',null,'western',null,'csak 12 �ven fel�lieknek','8,3','N�metorsz�g');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('812','Volt egyszer egy Amerika','Sergio Leone','1984','230','t�rsadalmi dr�ma',null,'csak 14 �ven fel�lieknek','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('898','H�l�zat','Sidney Lumet','1976','133','filmdr�ma',null,'Csak 16 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('756','K�nikulai d�lut�n','Sidney Lumet','1975',null,'b�n�gyi',null,'csak 12 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('856','Ac�ll�ved�k','Stanley Kubrick','1987','116','akci�',null,'Csak 16 �ven fel�lieknek','8,3','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('820','A c�pa','Steven Spielberg','1975',null,'horror',null,'csak 12 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('869','Az elveszett frigyl�da fosztogat�i','Steven Spielberg','1981','117','kaland',null,'csak 14 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('758','Kapj el, ha tudsz','Steven Spielberg','2002','141','b�n�gyi',null,'csak 14 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('790','Ryan k�zleg�ny megment�se','Steven Spielberg','1998','162','h�bor�s',null,'Csak 16 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('791','Schindler list�ja','Steven Spielberg','1993','187','filmdr�ma',null,'csak 14 �ven fel�lieknek','8,9','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('873','Bilincs �s mosoly','Stuart Rosenberg','1967',null,'filmdr�ma',null,'csak 12 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('904','Hotel Ruanda','Terry George','2004','121','filmdr�ma',null,'csak 6 �ven fel�lieknek','8,1','D�l-Afrika');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('814','12 majom','Terry Gilliam','1995','124','akci�',null,'csak 14 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('875','Brian �lete','Terry Jones','1979','90','v�gj�t�k',null,'csak 12 �ven fel�lieknek','8,1','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('835','A kir�ly besz�de','Tom Hooper','2010',null,'t�rt�nelmi','dr�ma','csak 6 �ven fel�lieknek','8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('768','Mary �s Max','Adam Elliot','2009','95','anim�ci�',null,'csak 6 �ven fel�lieknek','8,1','Ausztr�lia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('852','A test�r','Akira Kurosawa','1961','111','filmdr�ma',null,'Csak 16 �ven fel�lieknek','8,2','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('757','K�osz','Akira Kurosawa','1985','160','filmdr�ma',null,'csak 14 �ven fel�lieknek','8,2','Jap�n');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('896','Gyilkoss�g telefonh�v�sra','Alfred Hitchcock','1954',null,'thriller',null,'csak 6 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('902','H�ts� ablak','Alfred Hitchcock','1954','114','thriller',null,'csak 14 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('905','Idegenek a vonaton','Alfred Hitchcock','1951',null,'thriller',null,'csak 6 �ven fel�lieknek','8','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('787','Psycho','Alfred Hitchcock','1960','108','thriller',null,'Csak 18 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('794','Sz�d�l�s','Alfred Hitchcock','1958','130','b�n�gyi',null,'csak 14 �ven fel�lieknek','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('801','Sztalker','Andrej Tarkovszkij','1979','165','sci_fi',null,'Csak 16 �ven fel�lieknek','8,1','Szovjetuni�');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('808','Van, aki forr�n szereti','Billy Wilder','1959','116','v�gj�t�k',null,'csak 6 �ven fel�lieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('845','A sebhelyesarc�','Brian De Palma','1983','163','akci�',' thriller','Csak 16 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('764','K�z�ns�ges b�n�z�k','Bryan Singer','1995','106','b�n�gyi',null,'Csak 16 �ven fel�lieknek','8,6','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('782','Oldboy','Chan-Wook Park','2003','120','thriller',null,'Csak 16 �ven fel�lieknek','8,4','D�l-Korea');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('865','Aranyl�z','Charles Chaplin','1925',null,'v�gj�t�k',null,'Korhat�r n�lk�l','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('773','Modern id�k','Charles Chaplin','1936','86','v�gj�t�k',null,'Korhat�r n�lk�l','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('775','Nagyv�rosi f�nyek','Charles Chaplin','1931',null,'v�gj�t�k',null,'Korhat�r n�lk�l','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('821','A dikt�tor','Charlie Chaplin','1940','128','v�gj�t�k',null,'Korhat�r n�lk�l','8,4','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('846','A s�t�t lovag','Christopher Nolan','2008','152','akci�',null,'csak 12 �ven fel�lieknek','8,9','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('853','A t�k�letes tr�kk','Christopher Nolan','2006','130','thriller',null,'csak 6 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('887','Eredet','Christopher Nolan','2010','148','sci_fi',null,'csak 12 �ven fel�lieknek','8,7','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('770','Mement�','Christopher Nolan','2000','113','filmdr�ma',null,'Csak 16 �ven fel�lieknek','8,5','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('895','Gran Torino','Clint Eastwood','2008','116','filmdr�ma',null,'csak 12 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('772','Milli� doll�ros b�bi','Clint Eastwood','2004','132','filmdr�ma',null,'csak 12 �ven fel�lieknek','8,1','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('781','Nincs bocs�nat','Clint Eastwood','1992','125','western',null,'csak 14 �ven fel�lieknek','8,2','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('799','Szigor�an bizalmas','Curtis Hanson','1997','136','b�n�gyi',null,'csak 14 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('805','Trainspotting','Danny Boyle','1996','90','filmdr�ma',null,'csak 12 �ven fel�lieknek','8,1','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('788','Rekviem egy �lom�rt','Darren Aronofsky','2000','97','filmdr�ma',null,'Csak 16 �ven fel�lieknek','8,3','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('899','Harcosok klubja','David Fincher','1999','133','akci�',null,'Csak 18 �ven fel�lieknek','8,8','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('903','Hetedik','David Fincher','1995','127','thriller',null,'Csak 18 �ven fel�lieknek','8,6','USA');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('864','Ar�biai Lawrence','David Lean','1962','222','kaland',null,'csak 6 �ven fel�lieknek','8,3','Nagy-Britannia');
Insert into DVD (SORSZAM,FILM,RENDEZO,EV,HOSSZ,MUFAJ1,MUFAJ2,BESOROLAS,IMDB_PONTSZAM,GYARTO_ORSZAG) values ('867','Az elef�ntember','David Lynch','1980','125','filmdr�ma',null,'csak 14 �ven fel�lieknek','8,2','Nagy-Britannia');
COMMIT;