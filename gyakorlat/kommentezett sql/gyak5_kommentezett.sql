/*1. Fejtsük meg az alábbi utasításokat!*/

/*
- ha a NULL = NULL igaz lenne, akkor például a nem ismert életkorúak szükségszerûen kor szerint megegyeznének,ami nyilván nem lenne helyes
- látható, hogy a tagadás sem lehet helyes, hiszen attól még, hogy valami nem ismert, attól még nem feltétlenül mindenkinek különbözõ az életkora, tehát a NULL <> NULL sem lehet igaz
- ebben az esetben az állapot mindig UNKNOWN, vagy logikailag a harmadik állapot
- a harmadik állapot leellenõrzése az IS és az IS NOT operátorral lehet, amelynek a jobboldai operandusa kizárólag NULL lehet
- 1 IS 2 nem helyes
- Üres karaktersorozat az NULL (kényszerek ellenõrzése miatt)

- Szintaktikai hiba: 1 IS 2, 'valami' IS 'valami'
- UNKNOWN esetek: 1 = NULL, NULL = 1, NULL <> 1, 1 <> NULL, NULL = NULL, NULL <> NULL
- Igaz esetek:	NULL IS NULL
- Hamis esetek: NULL IS NOT NULL

*/

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

/*
- feltételes függvények nagyban segítik az SQL nyelven leírt mondatok hatékonyságát
- Ezekre amúgy nincs szükség, enélkül is meg lehet oldani a feladatokat, pl. UNION alkalmazásával
- feltételes függvények helyettesíthetõek UNION-nal
- az UNION, MINUS és INTERSECT mûveletek csak úniókompatibilis relációk között mûködnek (azonos oszlopszám és sorrendben azonos adattípus)
- Az oszlopneveket az elõször megadott táblból fogja venni
- Mindegyik halmaz szemantikájú (azaz az eredeti relációkban lévõ duplikátumokat is megszüntetik). 
- Egyedül az UNION-nál van lehetõség az ALL szó használatával zsákszemantikát alkalmazni.
- Ténylegesen a feltételes függvények helyett az UNION ALL használható

SELECT NVL(attrib, 'valami') FROM tabla;
--- ekvivalens
SELECT 'valami' FROM tabla WHERE attrib IS NULL
UNION 
SELECT attrib FROM tabla WHERE attrib IS NOT NULL;
*/

/*
- NVL függvény, a null érték helyett megadhatunk más (azonos adattípusú!) helyettesítõt
- tehát ha az elsõ paraméter NULL, akkor a másodikat adja vissza
- Ezt kell tudni fejbõl is
*/
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

-- Elhagyhatnánk-e a 2. megoldásból az ALL-t?
SELECT cegnev
, to_char(nvl(uzletiev_vege, to_date('2017.12.31','YYYY.MM.DD')), 'mm.dd') üzleti_év_vége
FROM minta.cegek
ORDER BY 2;

/*6. fejtsük meg az alábbi lekérdezéseket!*/
/*COALESCE függvény: kiterjesztett NVL: 
az elsõ nem null értéket fogja eredményül adni*/

/*
- A COALESCE egy NVL-klón és kiterjesztés
- Annyival több az NVL függvénynél, hogy tetszõlegesen hosszú listát adhatunk meg neki
- Itt is fontos, hogy az adattípusoknak stimmelni kell
*/

SELECT COALESCE(NULL,NULL, 500) 
AS megmi FROM dual;

SELECT to_char( SYSDATE, 'D' ) AS megmi FROM dual;

/*
- DECODE: a legáltalánosabb és legrégibb feltételes függvény, de elég fapados 
– lényegében egy C/C++/C# világból ismert switch-case eljárás SQL függvényként
- A paraméterei DECODE( attribútum, érték1, válasz1, [érték2, válasz2, ... ], egyébválasz )
- a végén megadott argumentum az egyébb, ha elhagyjuk, akkor az egyéb a NULL érték.*/

SELECT decode(to_char( SYSDATE, 'D' ) ,
	1, 'Hétfõ', 
	2, 'Kedd', 
	3, 'Szerda', 
	4, 'Csütörtök',
	5, 'Péntek',
	6, 'Szombat',
	   'Vasárnap' ) AS megmi FROM dual;

/*
- CASE WHEN: feltételhez kötött elágazás
- DECODE és összehasonlítási üzemmódja is van
*/

-- összehasonlítási üzemmód
SELECT CASE WHEN to_char( SYSDATE, 'D' ) < 6 
	THEN 'Hétköznap'
	ELSE 'Hétvége' END AS megmi FROM dual;
  
--ugyanez decode üzemmóddal
SELECT decode (to_char( SYSDATE, 'D' ),  
	6, 'Hétvége',
  7, 'Hétvége',
  'Hétköznap') AS megmi FROM dual;
  

-- „NULLIF( a, b )“ megegyezik pontosan a „CASE WHEN a = b THEN NULL ELSE a“ kifejezéssel.*/
SELECT nullif( 'valami', 'valami' ) AS megmi FROM dual;
SELECT nullif( 'valami', 'más' ) AS megmi FROM dual;

/*7.	Hozzuk létre az UGYFEL táblát az alábbiak szerint!
- UGYFELID: 3 jegyû azonosító szám, a tábla elsõdleges kulcsa
- NEV: az ügyfél teljes neve, kötelezõ megadni
- NEM: egy karakteres szöveg, F vagy N
- MIKORTOL: az elsõ szerzõdéskötés dátuma, alapértelmezetten az aktuális dátum idõ nélkül
- VIP: egy számjegy, csak 1 és 0 lehet, alapértelmezetten 0.*/

-- ha default is van meg constraint is, akkor a default van elõbb
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

-- beszúrása táblába
-- ha az összes oszlopba beszúrunk értéket, akkor nem kell a tábla neve után felsorolni az oszlopokat
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

--dátum NULL lesz, nem érévényesül a default
INSERT INTO ugyfel
VALUES (
  100
, 'Kiss Piroska'
, NULL
, NULL
, NULL
);

SELECT * FROM ugyfel;

--érvényesül a default, többi helyre NULL-t tesz be
INSERT INTO ugyfel (ugyfelid, nev)
VALUES (
  200
, 'Fekete Péter'
);

SELECT * FROM ugyfel;

/*10.	Véglegesítsük az adatbevitelt a COMMIT utasítással!*/

--innentõl nem csak a saját sessionben látszódik a módosítás
COMMIT;

/*11.	Írjuk be az ugyfel táblába a minta.alkalmazott 
tábla adatai közül az azonosítót és a nevet! 
A hiányzó értékeknél hagyjuk az alapértelmezettet! Véglegesítsük a bevitelt!*/

DESC minta.alkalmazott

-- minden sorának az id-ját és a nevét az alkalmazott táblának átmásolja az ügyfél táblába
-- a többit pedig feltölti az alapértelmezett értékekkel, ha nincs akkor NULL-t ad meg
-- ha explicit bevisszük a NULL-t akkor NULL lesz, ha viszont kihagyjuk az adott oszlopokat, akkor alapértelmezett lesz
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

--where feltétellel a from rész után szûkíthetõ, hogy kit szeretnénk átmásolni
-- Ilyen feladatoknál mindig érdemes elõbb csak a select-et megírni, lefuttatni, hogy lássuk, hogy tényleg azt kaptuk, amit elképzeltünk, majd ha már jónak ítéljük, akkor írjuk elé az elejét
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

--where feltétellel a from rész után szûkíthetõ, hogy kit szeretnénk törölni
DELETE FROM ugyfel;

SELECT * FROM ugyfel;

-- egyelõre csak a mi sessiönünkben látszódik a törlés, többiek számára a mi téblánk nem üres
-- amíg nem commitálunk addig visszavonható az utasítás
ROLLBACK;

SELECT * FROM ugyfel;

/*14.	Töröljük az ugyfel táblából a 100-zal osztható 
azonosítójú ügyfeleket! Véglegesítsük!*/

--mod_maradákos osztás
DELETE FROM ugyfel
WHERE mod(ugyfelid,100)=1;

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

--where feltétellel a from rész után szûkíthetõ, hogy kit szeretnénk módosítani
UPDATE ugyfel
SET vip=0;

SELECT * FROM ugyfel;
COMMIT;

/*17.	Módosítsuk az adatokat: 
mindenkinek az azonosítójából vonjunk ki 100-at! 
Véglegesítsük!*/

-- kétszer kerültek másolásra az emberek, de az elsõ másolás eredményét töröltük, amikor a feltétel az volt, hogy a nem ne legyen null
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

--A TRUNCATE TABLE utasítással a tábla tartalma úgy törlõdik, hogy azt nem tudjuk visszavonni, mivel a TRUNCATE TABLE nem DML hanem DDL parancs
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


