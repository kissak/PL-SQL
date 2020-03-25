/*1. Fejtsük meg az alábbi utasításokat!*/

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL = NULL; --üres

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL <> NULL; --üres

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL IS NULL; --Lefutott

SELECT 'Lefutott' AS megmi FROM dual WHERE '' = NULL; --üres

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL LIKE '%'; --üres

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL LIKE NULL; --üres

SELECT 'Lefutott' AS megmi FROM dual WHERE '' LIKE '%'; --üres

SELECT 'Lefutott' AS megmi FROM dual WHERE '' IS NULL; --Lefutott

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL IS ''; --üres

/*2. Kérdezzük le a MINTA séma 
orszagadatok táblájából azokat az 
országokat, akiknek az autójelük nincs megadva!*/

SELECT * FROM minta.orszagadatok
WHERE autojel IS NULL; --8 rekord az eredménye

/*3.	Kérdezzük le a MINTA séma 
orszagadatok táblájából azokat az 
országokat, akiknek az ünnepnapjuk 
nincs megadva, de az autójelük igen!*/

SELECT orszag, autojel, unnepnap 
FROM minta.orszagadatok
WHERE unnepnap IS NULL
AND autojel IS NOT NULL; --6 rekord

/*4. Fejtsük meg a lekérdezéseket!*/

SELECT nvl('2', 'Na, ez mi?') AS megmi FROM dual; --próbáljuk ki aposztróf nélkül és to_char függvénnyel is

SELECT nvl(NULL, 'Na, ez mi?') AS megmi FROM dual;

SELECT nvl('', 'Na, ez mi?') AS megmi FROM dual;

/*5.	Kérdezzük le a MINTA séma CÉGEK táblájából 
a cégek üzleti évének végét évszám nélkül! 
Akiknél nincs megadva, ott december 31-et írjunk ki!
Elhagyhatnánk-e a 2. megoldásból az ALL-t?*/

DESC minta.cégek

SELECT * FROM all_tables
WHERE owner='MINTA';

DESC minta.cegek

SELECT cegnev 
--, uzletiev_vege
, nvl(to_char(uzletiev_vege, 'mm.dd'),'12.31') üzleti_év_vége
FROM minta.cegek
ORDER BY 2;

SELECT cegnev
, to_char(uzletiev_vege, 'mm.dd') üzleti_év_vége
FROM minta.cegek
WHERE uzletiev_vege IS NOT NULL
  UNION --ALL --azért hagyható el az ALL, mert egyrészt a cegnev egyedi, másrészt a két lekérdezés feltétele disjunkt, tehát biztosan nins ismétlõdés
SELECT cegnev
, '12.31'
FROM minta.cegek
WHERE uzletiev_vege IS NULL
ORDER BY 2;

/*6. fejtsük meg az alábbi lekérdezéseket!*/
/*COALESCE függvény: kiterjesztett NVL: 
az elsõ nem null értéket fogja eredményül adni*/

SELECT COALESCE(NULL,NULL, 500) --írkáljuk át néhányféle képpen
AS megmi FROM dual;

SELECT to_char( SYSDATE, 'D' ) AS megmi FROM dual;

/*DECODE függvény: a végén megadott argumentum az egyébb,
ha elhagyjuk, akkor az egyéb a NULL érték.*/

SELECT decode(to_char( SYSDATE, 'D' ) ,
	1, 'Hétfõ', 
	2, 'Kedd', 
	3, 'Szerda', 
	4, 'Csütörtök',
	5, 'Péntek',
	6, 'Szombat',
	   'Vasárnap' ) AS megmi FROM dual;

--CASE WHEN: feltételhez kötött elágazás
     
SELECT CASE WHEN to_char( SYSDATE, 'D' ) < 6 
	THEN 'Hétköznap'
	ELSE 'Hétvége' END AS megmi FROM dual;
  
--ugyanez decode-dal

SELECT decode (to_char( SYSDATE, 'D' ),  
	6, 'Hétvége',
  7, 'Hétvége',
  'Hétköznap') AS megmi FROM dual;
  
/*„NULLIF( a, b )“ megegyezik pontosan 
a „CASE WHEN a = b THEN NULL ELSE a“ kifejezéssel.*/

SELECT nullif( 'valami', 'valami' ) AS megmi FROM dual;
SELECT nullif( 'valami', 'más' ) AS megmi FROM dual;

/*7.	Hozzuk létre az UGYFEL táblát az alábbiak szerint!
- UGYFELID: 3 jegyû azonosító szám, a tábla elsõdleges kulcsa
- NEV: az ügyfél teljes neve, kötelezõ megadni
- NEM: egy karakteres szöveg, F vagy N
- MIKORTOL: az elsõ szerzõdéskötés dátuma, alapértelmezetten az aktuális dátum idõ nélkül
- VIP: egy számjegy, csak 1 és 0 lehet, alapértelmezetten 0.*/

CREATE TABLE ugyfel(
 ugyfelid NUMBER(3) PRIMARY KEY
,nev VARCHAR2(50) NOT NULL
,nem VARCHAR2(1) CHECK (nem='F' OR nem='N')
,mikortol DATE DEFAULT trunc(SYSDATE)
,vip NUMBER(1) DEFAULT 0 CHECK (vip BETWEEN 0 AND 1) 
);

DESC ugyfel

/*8.	Vigyünk be a táblába egy személyt, 0-s kóddal úgy, hogy minden adatot megadunk!
Figyeljünk az adattípusokra!*/

INSERT INTO ugyfel
VALUES (
  0 --szám, aposztrófok nélkül!
, 'Bõrönd Ödön' --szöveg, aposztrófok között
, 'F' --szöveg
, to_date('10.05.01','YY.MM.DD') --dátum
, 1 --szám
);

SELECT * FROM ugyfel;

/*9.	Nézzünk meg a további adatbeviteleket!*/

INSERT INTO ugyfel
VALUES (
  100
, 'Kiss Piroska'
, NULL
, NULL
, NULL
);

SELECT * FROM ugyfel;

INSERT INTO ugyfel (ugyfelid, nev)
VALUES (
  200
, 'Fekete Péter'
);

SELECT * FROM ugyfel;

/*10.	Véglegesítsük az adatbevitelt a COMMIT utasítással!*/
COMMIT;

/*11.	Írjuk be az ugyfel táblába a minta.alkalmazott 
tábla adatai közül az azonosítót és a nevet! 
A hiányzó értékeknél hagyjuk az alapértelmezettet! Véglegesítsük a bevitelt!*/

DESC minta.alkalmazott

INSERT INTO ugyfel(ugyfelid,nev)
SELECT aid, nev FROM minta.alkalmazott;

SELECT * FROM ugyfel;

COMMIT;

/*12.	Írjuk be az ugyfel táblába a minta.dolgozo tábla adatait az alábbiak szerint: 
- az azonosítókat toljuk el 100-zal
- a neveket fûzzük össze
- a nemeket kódoljuk át
- a mikortól egyezzen meg a felv_nap értékével
- a VIP maradjon üresen (ne írja be az alapértelmezést!)
Véglegesítsük az adatbevitelt!
*/

DESC minta.dolgozo

INSERT INTO ugyfel 
SELECT
 ID+100
,vnev||' '||knev
,decode(nem,0,'F',1,'N')
,felv_nap
,NULL
FROM minta.dolgozo
;

SELECT * FROM ugyfel
ORDER BY 1 DESC;

COMMIT;

/*13.	Kérdezzük le az ügyfél tábla adatait, töröljünk minden adatot, 
kérdezzük le újra, majd vonjuk vissza a törlést és kérdezzük le újra!*/

SELECT * FROM ugyfel;

DELETE FROM ugyfel;

SELECT * FROM ugyfel;

ROLLBACK;

SELECT * FROM ugyfel;

/*14.	Töröljük az ugyfel táblából a 100-zal osztható 
azonosítójú ügyfeleket! Véglegesítsük!*/

DELETE FROM ugyfel
WHERE mod(ugyfelid,100)=0;

SELECT * FROM ugyfel
ORDER BY 1 DESC;

COMMIT;

/*15.	Töröljük az ugyfel táblából azokat, 
akiknek nem tudjuk a nemét! Véglegesítsük!*/

DELETE FROM ugyfel
WHERE nem IS NULL;

SELECT * FROM ugyfel;

COMMIT;


/*16.	Módosítsuk az adatokat: 
mindenkinél írjuk be a VIP oszlopba a 0 értéket! 
Véglegesítsük!*/

UPDATE ugyfel
SET vip=0;

SELECT * FROM ugyfel;
COMMIT;

/*17.	Módosítsuk az adatokat: 
mindenkinek az azonosítójából vonjunk ki 100-at! 
Véglegesítsük!*/

UPDATE ugyfel
SET ugyfelid=ugyfelid-100;

SELECT * FROM ugyfel;
COMMIT;

/*18.	Módosítsuk az adatokat: 
mindenki, aki 2010 elõtt kötött szerzõdést, 
legyen VIP ügyfél! Véglegesítsük!*/

UPDATE ugyfel
SET vip=1
WHERE mikortol<to_date('100101','YYMMDD');

SELECT * FROM ugyfel;

COMMIT;

/*19. Másoljuk le az ugyfel táblánakt ugyfel2 néven! Töröljük a tartalmát visszavonhatatlanul!*/

CREATE TABLE ugyfel2
AS SELECT * FROM ugyfel;

SELECT * FROM ugyfel2;

TRUNCATE TABLE ugyfel2;

SELECT * FROM ugyfel2;

ROLLBACK;

SELECT * FROM ugyfel2;

/******************/
/*ÖNÁLLÓ FELADATOK*/
/******************/
/*1.	Kérdezzük le a MINTA.IRODALOM táblából azokat az írókat, 
akiknek nincs megadva eredeti nevük!*/

DESC minta.irodalom
SELECT * FROM minta.irodalom
WHERE eredeti_név IS NULL;

/*2.	Kérdezzük le a MINTA.IRODALOM táblából 
az írók nevét és eredeti nevét úgy, 
hogy akinek nincs megadva az eredeti neve, 
azoknál az eredeti névhez is az ismert nevüket írjuk ki!*/

SELECT név, nvl(eredeti_név,név) eredeti_név
FROM minta.irodalom;

/*3.	A minta.orszagadatok táblából  listázzuk ki az országokat
és az ünnepnapokat is! 
Ahol NULL érték van, ott írjuk be a „nem ismert” szöveget! 
Rendezzük az eredményt az ünnepnapok szerinti sorrendbe! */

DESC minta.orszagadatok
SELECT orszag
, nvl(to_char(unnepnap, 'month dd.'),'nem ismert') unnepnap
FROM minta.orszagadatok;

/*4.	Kérdezzük le a MINTA séma CEGEK táblájából az Rt-ket úgy, 
hogy az Rt után legyen pont, de ha volt pont eleve, 
akkor ne legyen két pont utána!*/

DESC minta.cegek

SELECT cegnev
FROM minta.cegek
WHERE lower(cegnev) LIKE '% rt%';

SELECT REPLACE(cegnev,' Rt',' Rt.') cégnév
FROM minta.cegek
WHERE lower(cegnev) LIKE '% rt%'
AND lower(cegnev) NOT LIKE '% rt.%'
UNION
SELECT cegnev
FROM minta.cegek
WHERE lower(cegnev) LIKE '% rt.%';

/*5.	Hozzuk létre az alábbi HALLGATO táblát!
HAZ: hallgató azonosítója, 6 karakteres szöveg, elsõdleges kulcs
HVNEV: hallgató vezetékneve, kötelezõ
HKNEV: hallgató keresztneve, kötelezõ
HSZDAT: hallgató születési dátuma
EVF: évfolyam, 1 jegyû egész szám, 1 és 5 között lehet, alapértelmezetten 1*/

CREATE TABLE hallgato(
haz VARCHAR2(6)
,hvnev VARCHAR2(20) NOT NULL
,hknev VARCHAR2(20) NOT NULL
,hszdat DATE
,evf NUMBER(1) DEFAULT 1 CHECK (evf BETWEEN 1 AND 6)
);

DESC hallgato

/*6.	Vigyünk be sql utasítással két rekordot, 
az egyik hallgatónak ne legyen évfolyama, a 
másiknak engedjük az alapértelmezett évfolyamot beírni!*/

INSERT INTO hallgato
VALUES (
 'ABCDEF'
 ,'Alma'
 ,'Aladár'
 ,to_date('951001','RRMMDD')
 ,NULL
 );

INSERT INTO hallgato(haz,hvnev,hknev,hszdat)
VALUES (
 'BBCDEF'
 ,'Banán'
 ,'Beáta'
 ,to_date('951002','RRMMDD')
 );

SELECT * FROM hallgato;
COMMIT;

/*7.	A Moodle-ben található Excel táblázatból hozzuk 
létre az adatok beírására alkalmas SQL utasításokat! 
(Excelben az egyszeres aposztrófot a cella elején duplán kell beírni)
Másoljuk be õket és futtassuk le! 
Véglegesítsük az adatbevitelt! 
(Csak az elsõ utasítást másoljuk be A Moodle-be)*/

INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RMP5C5','Ács','Boldizsár',to_date('1999.11.15','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P00K2I','Takács','Iván',to_date('1995.09.02','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YHB7VS','Horváth','Zsolt',to_date('1997.03.15','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IFQAZD','Csûrös','Salamon',to_date('1999.06.27','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LA5I05','Kovács','Lóránt',to_date('1995.07.27','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LVXW3C','Bús','Bendegúz',to_date('1998.06.30','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IQ525X','Kiss','Elek',to_date('1999.06.28','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('F0WRLG','Tóth','Abigél',to_date('1994.09.19','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('AADDQT','Fûtõ','Gábor',to_date('1995.09.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YWM7IR','Papp','Bernadett',to_date('1997.07.12','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GV1BO4','Hamar','Imre',to_date('1996.10.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PLNRLJ','Kis','Kornélia',to_date('1995.03.12','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('N5E0NN','Nagy','Tihamér',to_date('1998.12.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IXXM6E','Kádár','Anett',to_date('1996.02.14','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('X2Y3OY','Szõr','Ágnes',to_date('1996.01.14','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NVNZYL','Ollós','Nikolett',to_date('1997.02.17','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('HPYDT8','Csikós','Béla',to_date('1995.05.02','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('DD3TYH','Szabó','Norbert',to_date('1994.12.23','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('V6WVGT','Szûcs','Anita',to_date('1995.03.12','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JUYXIC','Buda','Botond',to_date('1997.12.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VB8CVI','Brenner','Krisztina',to_date('1999.05.07','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WXM33G','Fodor','Zita',to_date('1995.10.20','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KGAWZO','Németh','Iván',to_date('1997.12.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BW80OJ','Kárász','Zsolt',to_date('1995.03.03','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P6BT3Q','Bíró','Péter',to_date('1998.02.04','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EVXND3','Gombos','Tibor',to_date('1996.07.30','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JM5PG4','Lengyel','Ágnes',to_date('1999.09.17','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SZNVSC','Kövér','Nikoletta',to_date('1999.06.28','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y1J7YC','Bozsik','Balázs',to_date('1996.04.15','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EO82AB','Gergely','József',to_date('1995.05.25','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TAF71A','Mogyródi','Krisztián',to_date('1998.03.05','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('ENQGVO','Sarodi','Dóra',to_date('1998.06.18','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FW6XCY','Tóth','Anikó',to_date('1996.10.13','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KTYV3F','Vajda','Zsuzsa',to_date('1996.02.15','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CE6U6N','Ferencz','Roland',to_date('1994.10.31','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IZU671','Molnár','Bálint',to_date('1996.07.28','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FD7BFB','Kelemen','Áron',to_date('1998.04.16','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P5MCFK','Kuruc','Emese',to_date('1999.08.09','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PG8N5D','Orosz','Ferenc',to_date('1997.12.19','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GHOUFH','Szalai','Szilárd',to_date('1995.08.01','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FQDJLT','Tari','Szilvia',to_date('1996.10.07','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GVYK0R','Fõ','Nándor',to_date('1996.06.21','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KRHQ8B','Tóth','Zoltán',to_date('1995.01.17','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P8SBLU','Fülöp','Eszter',to_date('1995.10.15','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XEV4AM','Hartyánszky','Ágnes',to_date('1995.09.06','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BIRFKW','Antal','Tamás',to_date('1995.10.05','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LPABAP','Csiger','Bertalan',to_date('1999.11.05','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UX75TE','Komjáti','András',to_date('1998.09.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JLKHC1','Kerényi','Beatrix',to_date('1995.09.20','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('D8F0QX','Barabás','Pál',to_date('1994.10.23','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YWIOOH','Szomor','Andrea',to_date('1999.10.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XEOW3V','Nagy','László',to_date('1995.07.04','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('AOYQ1O','Botka','Mátyás',to_date('1995.01.07','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FZF7ZW','Hídasi','Judit',to_date('1996.10.14','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('HS2YOB','Simon','Anikó',to_date('1998.11.24','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OIX2FM','Kardos','Renáta',to_date('1995.01.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('N1P4CB','Ambrus','Dávid',to_date('1995.07.08','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XJGRG6','Baróti','Attila',to_date('1998.01.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IBGDKL','Szedlár','Krisztina',to_date('1999.04.30','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VCHGW5','Dunai','Aladár',to_date('1999.04.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SRP5RO','Szekendi','Beatrix',to_date('1996.10.10','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XUKHMS','Fényes','Tamás',to_date('1996.12.29','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XAGJCI','Bodor','Szabolcs',to_date('1996.01.27','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WCQB55','Kiss','Ádám',to_date('1997.04.09','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TDJW8X','Erdei','András',to_date('1997.09.19','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('S6RBDJ','Tóth','Júlia',to_date('1995.03.25','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VGXH5S','Kozma','Péter',to_date('1995.11.11','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YTZ5I7','Horváth','Márk',to_date('1997.10.25','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('HAHD0B','Pataki','Brigitta',to_date('1995.12.19','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WKHPEN','Andor','Ibolya',to_date('1997.07.08','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RY7SPX','Endresz','Bálint',to_date('1999.04.04','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UGJW6T','Perlinger','Éva',to_date('1996.10.05','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EHJK02','Farkas','László',to_date('1995.01.15','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RDFO45','Mohos','Mónika',to_date('1995.07.02','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SXXLNB','Bíró','Ákos',to_date('1996.05.25','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KGK0D4','Jakab','Áron',to_date('1997.11.17','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RWA2J0','Barna','Zoltán',to_date('1995.07.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('QXCCEV','Antal','László',to_date('1997.04.23','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('QKEGUQ','Balogh','Eszter',to_date('1999.06.24','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WH86F6','Tóth','Roland',to_date('1999.05.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BBCZZS','Székely','Brigitta',to_date('1998.10.27','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TOWYV0','Enyedi','Éva',to_date('1995.07.08','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('F3I336','Molnár','András',to_date('1996.01.28','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BGFQAN','Miklós','Szabolcs',to_date('1999.07.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UWOIHJ','Keszler','Dániel',to_date('1996.07.17','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XSQB6F','Rab','Sebestyén',to_date('1995.12.08','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YK065N','Bucskó','Róza',to_date('1995.11.28','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FXOYVK','Baráth','Mária',to_date('1999.07.23','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RAGA1R','Gyárfás','Krisztina',to_date('1996.12.06','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GGYMQZ','Regõs','Annamária',to_date('1996.10.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KVN0EF','Józsa','Zsolt',to_date('1997.08.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('R8QYPL','Pintér','Zoltán',to_date('1998.02.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UPSQHX','Tornyos','Andrea',to_date('1999.02.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RSYHSU','Köves','Gábor',to_date('1998.10.15','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('G0G7XK','Harangozó','János',to_date('1998.05.22','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MT64JV','Érsek','Eszter',to_date('1998.01.07','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MOTXD6','Pásztor','Róbert',to_date('1999.11.12','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('X5AA7E','Varsányi','Zsuzsa',to_date('1997.03.29','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PTQN20','Béres','Norbert',to_date('1998.10.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('A7MLIN','Bosnyák','Ilona',to_date('1995.04.27','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('O4QE3H','Pusztai','Zsuzsanna',to_date('1999.01.28','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('C2V28U','Kalacsi','Márton',to_date('1997.11.26','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('AHB5UJ','Szûcs','Annamária',to_date('1998.11.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('ICCORG','Horváth','Krisztina',to_date('1999.01.07','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('J14UW7','Szirmai','Renáta',to_date('1996.06.28','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('G8YG1A','Nagy','Júlia',to_date('1998.09.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('DY2X2O','Berendi','Péter',to_date('1999.04.09','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('I0X3L7','Kovács','Bernadett',to_date('1995.06.21','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MTKY7W','Balla','Miklós',to_date('1998.03.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('N5IAW7','Vígh','András',to_date('1999.09.20','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('K22KBQ','Nyíri','Georgij',to_date('1995.01.03','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y3PDQ8','Barta','Zsuzsanna',to_date('1994.10.06','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OAVG08','Giliga','János',to_date('1995.10.15','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KPO3KI','Vajda','József',to_date('1999.03.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SF1DAE','Lukács','Kornél',to_date('1999.09.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IM074V','Gyõrffy','Bence',to_date('1996.11.24','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FSOWTU','Bakódy','Balázs',to_date('1998.01.21','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('N4G3WQ','Horváth','Ágnes',to_date('1996.05.29','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('M2GLRE','Móricz','Árpád',to_date('1997.02.24','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('W7HWEK','Rácz','Rajmond',to_date('1996.08.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('I4YSE0','Hegedûs','Norbert',to_date('1996.11.28','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EIMKZM','Szöllõsi','Gábor',to_date('1994.09.17','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VVWHWK','Gondos','Katalin',to_date('1999.03.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('L8LF0Z','Nagy','Sándor',to_date('1998.05.30','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FBXMJL','Mile','Norbert',to_date('1997.08.04','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GXL665','Horváth','Bálint',to_date('1998.06.06','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UIO6B0','Pálinkás','János',to_date('1999.04.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VIGYKB','Gondos','Miklós',to_date('1997.10.12','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('A8S44K','Soós','István',to_date('1999.05.12','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('T4SGBF','Horváth','Árpád',to_date('1995.05.22','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WMM02P','Bakó','Klaudia',to_date('1997.11.18','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y4YHW6','Tankó','Veronika',to_date('1997.07.02','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LAQHVY','Urbán','Viktoria',to_date('1996.08.29','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('O3E71C','Tömböly','Dénes',to_date('1997.09.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UGUJAT','Bittmann','Edit',to_date('1995.05.19','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('B347PK','Pulai','Zsolt',to_date('1995.04.17','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WQ73SB','Back','András',to_date('1994.11.17','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CB86RB','Orbán','Bernadett',to_date('1996.11.04','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CXXHK3','Farkas','Sándor',to_date('1999.02.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('L1UTC7','Czérna','Krisztián',to_date('1999.10.14','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WZEVCB','Kovács','Ágnes',to_date('1995.07.28','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TTPE53','Opra','Attila',to_date('1997.04.14','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('A80FZ6','Viktor','Éva',to_date('1996.06.21','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GLK7YY','Vida','Gabriella',to_date('1997.09.25','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('H81VPY','Maródi','Andrea',to_date('1997.12.18','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NFORHD','Szalai','Péter',to_date('1996.06.10','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WD7C5H','Kornseé','Gyöngyi',to_date('1999.04.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('H1M60E','Kovács','Katalin',to_date('1999.07.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('G8X7ES','Farkas','Béla',to_date('1999.01.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PLJ5EU','Nagy','András',to_date('1997.05.26','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BFSKWQ','Dániel','Tibor',to_date('1999.03.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MN5LQP','Bárci','Gusztáv',to_date('1997.01.27','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VREZAV','Simon','Bernadett',to_date('1995.02.20','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('U2R8KQ','Szabó','Julianna',to_date('1999.04.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LZRA0M','Iván','Róbert',to_date('1997.04.22','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P02KSM','Szûcs','Balázs',to_date('1996.04.04','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SOG1NS','Bozsó','Péter',to_date('1996.03.29','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OO2RHY','Oroszi','György',to_date('1997.11.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LBYXXR','Fodor','Zoltán',to_date('1996.02.23','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YKY0P3','Kiss','Andrea',to_date('1999.04.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GEQE0G','Bagóczki','Alexandra',to_date('1999.06.02','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IOIY18','Nagymihály','Lajos',to_date('1995.10.18','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Q5TL6B','Vörös','Dániel',to_date('1994.07.20','YYYY.MM.DD'),6);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GZLN5S','Papp','Imre',to_date('1995.10.18','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LVWTPK','Böröcz','Anikó',to_date('1994.09.20','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FZ72I4','Búza','Imre',to_date('1996.06.15','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('REZPUK','Sobják','Dávid',to_date('1999.07.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YQAVHR','Bieniek','Ádám',to_date('1994.07.20','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PA53FQ','Kispál','Márk',to_date('1997.04.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('J84M0I','Ötvös','Árpád',to_date('1998.08.04','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LAX38Q','Rácz','Dániel',to_date('1995.10.19','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('C71GDN','Keresztúri','Viktor',to_date('1996.05.25','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NAHIGM','Horváth','Nikolett',to_date('1995.03.05','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y3B0HE','Feró','Valentin',to_date('1997.04.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('K3AFMD','Szikszai','Réka',to_date('1999.02.25','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BEGMBS','Palágyi','Polla',to_date('1995.03.29','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EYTBUB','Koza','Máté',to_date('1998.06.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('HXX4R3','Nagymihály','Csongor',to_date('1994.07.08','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('D46QFE','Zatykó','Katalin',to_date('1998.11.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('H7YVXG','Móra','László',to_date('1999.08.17','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OCYDKS','Szûcs','Norbert',to_date('1994.08.07','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WWTBT4','Szilágyi','Mátyás',to_date('1995.08.08','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PAP46I','Boros','Vivien',to_date('1996.01.13','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SBZO8D','Nádudvari','Henrik',to_date('1995.06.11','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LS66NF','Barkóci','Ádám',to_date('1996.03.12','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('J15VYF','Barna','Debóra',to_date('1995.05.26','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('D150EZ','Bajusz','Bence',to_date('1997.12.15','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BBUD6K','Dusha','Tímea',to_date('1995.12.14','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('A7PN20','Telek','Gábor',to_date('1996.12.18','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('V1BQQ3','Turcsik','Tünde',to_date('1995.09.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('F3IWFU','Varga','István',to_date('1999.11.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MIONDZ','Poprádi','Kristóf',to_date('1997.05.22','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JBUZ4G','Tatár','Nikoletta',to_date('1995.04.24','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YGDA05','Karasz','Sándor',to_date('1999.01.22','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XTRK78','Berta','Dávid',to_date('1994.07.10','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JPSC1N','Gyuris','József',to_date('1998.08.24','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NDIQG3','Miklós','Tamara',to_date('1997.12.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YBD1TD','Farkas','Sára',to_date('1999.03.28','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P8QCF4','Gulyás','Attila',to_date('1998.02.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('C7MAW3','Foltényi','Sebastián',to_date('1995.04.09','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CD2YOT','Pivarcsi','Anett',to_date('1995.08.03','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GNKOUG','Molnár','Zsófi',to_date('1998.10.27','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OKR4M4','Juhász','Mihály',to_date('1997.09.06','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TBQEW3','Frank','Fruzsina',to_date('1996.11.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('QJQXQE','Vágfalviné','Kazy',to_date('1996.05.22','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KKLTTI','Kertész','Katalin',to_date('1997.12.02','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BGXO8V','Tóth','András',to_date('1995.06.15','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('S63LYN','Vizi','István',to_date('1998.01.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MFUK7Y','Hamvay-Kovács','Anita',to_date('1998.07.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LDUW1E','Patay','Róbert',to_date('1996.02.23','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CYOH4M','Papós','Tímea',to_date('1997.03.24','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RZS13T','Bagi','Beáta',to_date('1996.09.06','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VK85WO','Molnár','Eszter',to_date('1999.03.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XYQPBG','Csóti','Attila',to_date('1996.09.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NY6W8Z','Vukasinovity','Bálint',to_date('1995.10.04','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('R3B3OQ','Bori','Krisztina',to_date('1996.10.21','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KRR2WW','Horváth','Katalin',to_date('1996.04.24','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('ON8J62','Neizer','Andrea',to_date('1996.05.28','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RT4YHY','Kois','Norbert',to_date('1998.11.20','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VMGZFV','Pigniczki','Martin',to_date('1998.02.02','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y1PV7X','Kovács','Katalin',to_date('1997.10.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('F0ER0S','Simon','Zsuzsanna',to_date('1996.09.18','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BRKP88','Sajtó','Nándor',to_date('1999.04.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KV8MSG','Fekete','Istvánné',to_date('1996.11.12','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TR3EWO','Szendrõdi','Simon',to_date('1999.04.05','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('DLKL40','Alap','Péter',to_date('1995.06.12','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UR462R','Csécsi','Kristóf',to_date('1997.05.08','YYYY.MM.DD'),2);

SELECT * FROM hallgato;
COMMIT;

/*8. Töröljük a hallgatókat! Vonjuk vissza! 
Töröljük csak a 6. éves hallgatókat! Véglegesítsük!*/

DELETE FROM hallgato;

ROLLBACK;

SELECT * FROM hallgato
WHERE evf=6;

DELETE FROM hallgato
WHERE evf=6;

COMMIT;

/*9. Töröljük azokat a hallgatókat, 
akik 2016. szeptember 1-n még nem voltak 18 évesek! Véglegesítsük!*/

SELECT * FROM hallgato
WHERE
hszdat>to_date('1998.09.01.','YYYY.MM.DD.');

DELETE FROM hallgato
WHERE
hszdat>to_date('1998.09.01.','YYYY.MM.DD.');

COMMIT;

/*10. Módosítsuk mindenkinek az évfolyamát eggyel nagyobbra!
Vonjuk vissza!*/

UPDATE hallgato
SET evf=evf+1;

SELECT * FROM hallgato;
ROLLBACK;

/*11. Egy udasítással módosítsuk a hallgatók évfolyamát az alábbiak szerint: 
a null-ból legyen 1, mindenkinek az évfolyama legyen eggyel nagyobb, az 5-bõl
pedig legyen null!*/

UPDATE hallgato
SET evf=decode(evf
,NULL,1
,1,2
,2,3
,3,4
,4,5);

SELECT * FROM hallgato;
COMMIT;