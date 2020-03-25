-- Hierarchikus lekérdezések, illesztés gyakorlása

-- Eloadáson már esett szó arról, hogy hierarchikus szerkezet is ábrázolható,
-- tárolható relációban. Gyakorlatilag egy 2 oszlopos táblázatról van szó, ahol
-- az egyik oszlop egyedileg tartalmazza a hierarchia minden egyedét (annak azonosítóját),
-- a másik oszlop pedig a közvetlen felette álló egyednek az azonosítóját.  
-- (Elofordulhatna olyan gráf is, amiben van loop, azokra is vannak megoldások, de azokkal
-- a kurzus keretében nem foglalkozunk!)

-- Fontos, hogy a két oszlopban ugyanolyan adatok szerepelnek, pl dolgozók azonosítója:
-- ki kinek a fonöke, vagy földrajzi helyek, melyik hely melyiknek a része, vagy szervezeti
-- egységek, melyik szervezeti egység melyiknek a része, vagy termékkategóriák amelyek 
-- egymás fokategóriái. A lefelso szinten lévo egyedeknek nyilván nincsen felettese. 
-- Ennek ábrázolása kétféleképpen lehetséges: vagy null érték szerepel a második oszlopban,
-- vagy egyáltalán nem szerepeltetjük oket az elso oszlopban. Mi az utóbbit fogjuk alkalmazni.

-- Az órai feladatokhoz a MINTA séma DOLGOZO és  FONOK tábláit fogjuk használni (MDOLGOZO,
-- MFONOK szinonímák is használhatóak). Elobbiben 62 dolgozó adatait találjuk, utóbbiban azt,
-- hogy ennek a 62 dolgozónak ki a fonöke. A FONOK tábla által létrehozott hierarchia képe
-- elérheto a Moodle-ben. Az a megértés egy magasabb foka, hogy csak a tábla ismeretében is
-- tudjuk értelmezni a feladatokat.
 


/*1. Hozzuk létre a MINTA séma DOLGOZO és FONOK tábláinak másolatát
a saját sémánkban!*/

CREATE TABLE dolgozo AS SELECT * FROM minta.dolgozo;
CREATE TABLE fonok AS SELECT * FROM minta.fonok;

/*2. Módosítsuk a táblákat úgy, hogy a DOLGOZO táblának legyen
kulcsa, a FONOK tábla pedig idegen kulcsokkal hivatkozzon a 
DOLGOZO tábla kulcsára!*/

DESC dolgozo
DESC fonok

ALTER TABLE dolgozo MODIFY
(ID PRIMARY KEY);

-- mindkét oszlopban ugyanúgy a dolgozók azonosítói szerepelnek
ALTER TABLE fonok MODIFY (
 ID REFERENCES dolgozo
,fonok_id REFERENCES dolgozo
);

/*3. Kérdezzük le az egyes beosztottak összes fõnökét
(nem csak a közvetleneket)!
Írjuk ki azt is, hogy az adott fõnök hány szinttel van
feljebb és azt is, hogy kik a köztes fõnökök!*/

-- Hierarchikus lekérdezés létrehozásához a CONNECT BY feltételt kell megadnunk. 
-- Ennek helye a SELECT utasításban a WHERE rész után van. A CONNECT BY után 
-- kell megadnunk, hogy milyen irányban kell bejárni a táblázatot. A PRIOR szóval
-- adjuk meg a bejárás irányát. Azaz a fonökös példánál maradva:
--	CONNECT BY  fonok_id = PRIOR id: veszi az adott rekordot, aztán folytatja 
--		az(ok)kal a rekord(ok)kal, ahol az adott rekordban id-ként szereplo érték 
--		fonök_id-ként szerepel.
--	CONNECT BY  PRIOR fonok_id = id: veszi az adott rekordot, aztán folytatja 
--		az(ok)kal a rekord(ok)kal, ahol az adott rekordban fonok_id-ként szereplo
--		érték id-ként szerepel.

-- Az elso lekérdezéseinket érdemes kiegészíteni két plusz oszloppal és egy 
-- sorbarendezéssel, hátha így jobban érthetové válik a lekérdezés muködése:
--	LEVEL pszeudo oszlop: megmutatja, hogy az adott rekord egy kiinduláshoz képest 
--		hányadik szinten jelenik meg.
--	sys_connect_by_path függvény: megmutatja az utat az adott kiinduló rekordtól 
--		kezdve az aktuálisan kiírt rekordig


SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,LEVEL,ID,fonok_id
FROM fonok
CONNECT BY ID = PRIOR fonok_id
ORDER BY kapcsolati_ut,LEVEL,ID,fonok_id
;

-- Tehát az 1-es dolgozónak 4 fonöke van, a közvetlen a 24-es, 
-- neki a fonöke a 40-es és így tovább.

/*4. Kérdezzük le csak az 1-es kódú dolgozó fõnökeit!*/

-- A CONNECT BY elé kell beírni az indító feltételt. Minden olyan rekordtól be
-- fogja járni a fát, ami megfelel a feltételnek. Ha a feltétel egytlen azonosítót
-- határoz meg, akkor az adott azonosítójú dolgozók fonökeit fogjuk megkapni. Ha 
-- csak a fonökökre vagyunk kiváncsiak, akkor nem szükséges kiírni az útvonalat,
-- szintet sot az egyes lépésekben az alkalmazottak id-jét sem, hiszen azok mindig
-- megjelennek elotte fonökként is.

SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,LEVEL,ID,fonok_id
FROM fonok
START WITH ID = 1
CONNECT BY ID = PRIOR fonok_id
ORDER BY kapcsolati_ut,LEVEL,ID,fonok_id
;

--egyszerûbben:
SELECT fonok_id
FROM fonok
START WITH ID = 1
CONNECT BY ID = PRIOR fonok_id
ORDER BY LEVEL
;

/*5. Írjuk ki az 1-es kódú dolgozó fõnökeinek azonosítóját
és a nevét!*/

-- Ahhoz, hogy az azonosítókhoz egyéb adatokat is tudjunk kapcsolni, természetesen
-- a táblák illesztésére van szükség. Mivel a FONOK tábla két idegen kulccsal is 
-- kapcsolódik a DOLGOZO táblához, mindig figyeljünk nagyon oda, hogy épp melyik 
-- kapcsolatot akarjuk megvalósítani (esetleg mind a kettot)

SELECT fonok_id, vnev||' '||knev bana_árpádné_fõnökei
FROM fonok JOIN dolgozo
ON (fonok.fonok_id=dolgozo.ID) --!!
START WITH fonok.ID = 1
CONNECT BY fonok.ID = PRIOR fonok_id
ORDER BY LEVEL
;

/*6. Kérdezzük le az egyes fõnökök összes beosztottját
(nem csak a közvetlen beosztottakat)! 
Írjuk ki azt is, hogy hányadik szintû a beosztott és azt
is, hogy kik a köztes fõnökök!
(Fordítsuk meg a 3. feladatot!)*/

SELECT sys_connect_by_path(to_char(fonok_id,'00'), '/' ) AS kapcsolati_ut
,LEVEL,fonok_id,ID
FROM fonok
CONNECT BY fonok_id = PRIOR ID
ORDER BY kapcsolati_ut,LEVEL,fonok_id,ID
;

/*7. írjuk ki csak a 40-es kódú dolgozó beosztottjait!*/

SELECT sys_connect_by_path(to_char(fonok_id,'00'), '/' ) AS kapcsolati_ut
,LEVEL,fonok_id,ID
FROM fonok
START WITH fonok_id=40
CONNECT BY fonok_id = PRIOR ID
ORDER BY kapcsolati_ut,LEVEL,fonok_id,ID
;

--egyszerûbben:
SELECT ID
FROM fonok
START WITH fonok_id=40
CONNECT BY fonok_id = PRIOR ID
ORDER BY LEVEL,ID
;

/*8. Írjuk ki azokat a fõnököket, akiknek van 30 évesnél fiatalabb nõi
alkalmazottjuk!
Írjuk ki, hogy hány ilyen alkalmazottjuk van (csak azokat írjuk ki,
akiknek egyáltalán van.*/

-- Mivel a feltételünk a beosztottakra vonatkozik, kiírni meg a fonökök nevét akarjuk,
-- ezért a DOLGOZO táblára kétszer is szükségünk lesz, egyszer az id-n keresztül, egyszer
-- pedig a fonok_id-n keresztül van kapcsolat. El kell nevezni a táblázatot kétféleképpen,
-- hogy egyértelmuen meg tudjuk mondani, hogy melyik táblázat oszlopaira hivatkozunk. Az,
-- hogy 30 évnél fiatalabb nok fonökeit keressük a START WITH feltételben jelenik meg, azaz
-- azoknál a rekordoknál indítjuk a bejárást, amelyekre ez az összetett feltétel igaz. A 
-- DISTINCT azért kell, mert pl. a vezérigazgató nyilván mindegyiküknek a fonöke, felesleges
-- minden bejárás eredményeképpen kiírni. Ugyanezért könnyu a feladat második felét megoldani.
-- Minden fonök annyiszor fog szerepelni a kiírásban, ahány alkalmazott fonöklistájában 
-- megjelenik, tehát a count függvény azt fogja megadni, hogy hány alkalmazottjuk van, tehát
-- pont megkapjuk a választ a kérdésünkre.

SELECT * FROM dolgozo
WHERE nem=1
AND szuldat>SYSDATE-30*365.25;

SELECT DISTINCT d2.ID fonok_id, d2.vnev||' '||d2.knev fonok_nev
FROM
dolgozo d1 JOIN fonok ON d1.ID=fonok.ID
JOIN dolgozo d2 ON fonok.fonok_id=d2.ID
START WITH d1.nem=1 AND d1.szuldat>SYSDATE-30*365.25
CONNECT BY fonok.ID = PRIOR fonok.fonok_id
;

SELECT  d2.ID fonok_id, d2.vnev||' '||d2.knev fonok_nev,
count(*) alkalmazottak_száma
FROM
dolgozo d1 JOIN fonok ON d1.ID=fonok.ID
JOIN dolgozo d2 ON fonok.fonok_id=d2.ID
START WITH d1.nem=1 AND d1.szuldat>SYSDATE-30*365.25
CONNECT BY fonok.ID = PRIOR fonok.fonok_id
GROUP BY d2.ID, d2.vnev||' '||d2.knev
ORDER BY alkalmazottak_száma DESC;

