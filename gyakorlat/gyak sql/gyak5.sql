/*1. Fejtsük meg az alábbi utasításokat!*/

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL = NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL <> NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL IS NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE '' = NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL LIKE '%';

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL LIKE NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE '' LIKE '%';

SELECT 'Lefutott' AS megmi FROM dual WHERE '' IS NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL IS '';

/*2. Kérdezzük le a MINTA séma 
orszagadatok táblájából azokat az 
országokat, akiknek az autójelük nincs megadva!*/

SELECT * FROM minta.orszagadatok
WHERE autojel IS NULL;

/*3.	Kérdezzük le a MINTA séma 
orszagadatok táblájából azokat az 
országokat, akiknek az ünnepnapjuk 
nincs megadva, de az autójelük igen!*/

SELECT orszag, autojel, unnepnap 
FROM minta.orszagadatok
WHERE unnepnap IS NULL
AND autojel IS NOT NULL;

/*4. Fejtsük meg a lekérdezéseket!*/

SELECT nvl('2', 'Na, ez mi?') AS megmi FROM dual;

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
  UNION ALL
SELECT cegnev
, '12.31'
FROM minta.cegek
WHERE uzletiev_vege IS NULL
ORDER BY 2;

/*6. fejtsük meg az alábbi lekérdezéseket!*/
/*COALESCE függvény: kiterjesztett NVL: 
az elsõ nem null értéket fogja eredményül adni*/

SELECT COALESCE(NULL,NULL, 500) 
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

--INSERT INTO ugyfel 
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



/*2.	Kérdezzük le a MINTA.IRODALOM táblából 
az írók nevét és eredeti nevét úgy, 
hogy akinek nincs megadva az eredeti neve, 
azoknál az eredeti névhez is az ismert nevüket írjuk ki!*/



/*3.	A minta.orszagadatok táblából  listázzuk ki az országokat
és az ünnepnapokat is! 
Ahol NULL érték van, ott írjuk be a „nem ismert” szöveget! 
Rendezzük az eredményt az ünnepnapok szerinti sorrendbe! */



/*4.	Kérdezzük le a MINTA séma CEGEK táblájából az Rt-ket úgy, 
hogy az Rt után legyen pont, de ha volt pont eleve, 
akkor ne legyen két pont utána!*/



/*5.	Hozzuk létre az alábbi HALLGATO táblát!
HAZ: hallgató azonosítója, 6 karakteres szöveg, elsõdleges kulcs
HVNEV: hallgató vezetékneve, kötelezõ
HKNEV: hallgató keresztneve, kötelezõ
HSZDAT: hallgató születési dátuma
EVF: évfolyam, 1 jegyû egész szám, 1 és 5 között lehet, alapértelmezetten 1*/



/*6.	Vigyünk be sql utasítással két rekordot, 
az egyik hallgatónak ne legyen évfolyama, a 
másiknak engedjük az alapértelmezett évfolyamot beírni!*/



/*7.	A Moodle-ben található Excel táblázatból hozzuk 
létre az adatok beírására alkalmas SQL utasításokat!
(Excelben az egyszeres aposztrófot a cella elején duplán kell beírni)
Másoljuk be õket és futtassuk le! 
Véglegesítsük az adatbevitelt! 
(Csak az elsõ utasítást másoljuk be A Moodle-be)*/



/*8. Töröljük a hallgatókat! Vonjuk vissza! 
Töröljük csak a 6. éves hallgatókat! Véglegesítsük!*/



/*9. Töröljük azokat a hallgatókat, 
akik 2016. szeptember 1-n még nem voltak 18 évesek! Véglegesítsük!*/



/*10. Módosítsuk mindenkinek az évfolyamát eggyel nagyobbra!
Vonjuk vissza!*/



/*11. Egy udasítással módosítsuk a hallgatók évfolyamát az alábbiak szerint: 
a null-ból legyen 1, mindenkinek az évfolyama legyen eggyel nagyobb, az 5-bõl
pedig legyen null!*/


