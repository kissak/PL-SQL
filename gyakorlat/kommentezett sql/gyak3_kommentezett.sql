/*0.
A SELECT utasítás alap felépítése:
SELECT szelktlista FROM tábla WHERE feltétel ORDER BY oszlop
*/


/*1. Kérdezzük le a MINTA sémában található alkalmazott tábla teljes tartalmát!*/

/*
- minta sémában levõ alkalmazott táblából kérdez le
- ha kitöröljük belõle "minta." részt, akkor a saját sémánkban fogja keresni az alkalmazott táblát
- ha a keresett tábla a saját sémánkban van, akkor nem kötelezõ kiírni, ez az alapértelmezett
*/

SELECT * FROM minta.alkalmazott;


/*2. Kérdezzük le csak a neveket (vetület)!*/

/*
- SELECT a megjelenítendõ oszlopokat(!) határozza meg
- a szelektlista tartalmazhat oszlopokat, az oszlopokkal végzett mûveleteket vagy konstansokat vesszõvel elválasztva (vetítés relációs mûvelet megvalósítása, alapértelmezetten zsák szemantikával)
- függvények módosíthatják a visszaadott oszlopban található értékeket, de minden adott oszlopbeli értékére lefut
*/

SELECT nev FROM minta.alkalmazott;


/*3. Kérdezzük le csak a születési éveket zsák és halmaz szemantikával is!*/

/*
- a reláció halmaz (definíció szerint mentes az ismétlõdésektõl), az SQL-ben az adatok zsákot (bag) alkotnak (egy név többször is szerepelhet)
- SQL azért mégis relációs, mert létezik az a  ROWID, amitõl minden sor egyedi lesz
- ha a SELECT után beírjuk, hogy DISTINCT, akkor lesz belõle halmaz szemantika
*/

-- zsák: adott érték többször is szerepelhet
SELECT szulev FROM minta.alkalmazott;

-- halmaz: minden érték egyszer szerepelhet csak
SELECT DISTINCT szulev FROM minta.alkalmazott;


/*4. Kérdezzük le a születési évet és a nevet, 
a fejléc SZÜLETÉSI ÉV és NÉV legyen! Csak azok szerepeljenek 
a listában, akik 1980 után születtek!*/

/*
- ha nem minden sort(!) akarunk megjeleníteni, akkor ennek helye a WHERE feltételekben van
- a where feltétel után egy logikai kifejezésnek kell állnia
- ha valamelyik sor igazzá teszi(!) a WHERE feltételben megfogalmazott kifejezést, akkor és csak akkor kerülhet az eredményhalmazba
- üres feltételre minden illeszkedik, azaz minden igazzá teszi (tehát, ha nincs where, akkor az összes sort visszadja)
- az oszlopoknak lehet címkét adni: szóközzel, vagy az AS kulcsszóval
- címke egyrészt az eredménytáblázat fejlécében jelenik meg, másrészt a sorba rendezésnél lehet használni (máshol nem!)
- a születési évben lévõ szóköz miatt dupla idézõjelbe kell tennünk a címkét, így viszont már számít a kis és nagybetû
*/

SELECT  szulev "SZÜLETÉSI ÉV", nev név --szulev AS "SZÜLETÉSI ÉV", nev AS név
FROM minta.alkalmazott
WHERE szulev>1980;

/*5. Kérdezzük le ugyanazt, mint az elõbb, az eredményt 
rendezzük év, azon belül név szerinti sorrendbe. 
Próbáljunk ki több variációt, illetve növekvõ és csökkenõ 
rendezést is*/

/*
- order by után megadhatjuk az oszlop nevét, címkéjét vagy sorszámát
- szlev = "SZÜLETÉSI ÉV" = 1, tehát amikor hivatkozunk bármelyiket használhatjuk
- vesszõvel elválasztva többszintû rendezést is megadhatunk (elõször születési év alapján rendezi, aztán ha azok egyeznek, akkor név alapján
- rendezés alapértelemezetten növekvõ sorrendben történik, ennek a kulcsszava az ASC, amit nem kell külön kiírnunk
- DESC kulcsszóval tudunk csökkenõ rendezést produkálni
- az elsõ 4 rendezés ugyanazt a végeredményt adja, csak abban különböznek, hogy miként hivatkozunk a rendezni kívánt oszlopokra
*/

SELECT  szulev "SZÜLETÉSI ÉV", nev név
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY szulev, nev;

SELECT  szulev "SZÜLETÉSI ÉV", nev név
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY "SZÜLETÉSI ÉV", név;

SELECT  szulev "SZÜLETÉSI ÉV", nev név
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY szulev, név;

SELECT  szulev "SZÜLETÉSI ÉV", nev név
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY 1, név;

-- születési év alapján csökkenõ sorrendbe rendezzük, majd név alapján ABC sorrendbe
-- ha ORDER BY 1 DESC, 2 DESC az utolsó sor: akkor mindkettõ alapján csökkenõ sorrendbe rendezünk
SELECT  szulev "SZÜLETÉSI ÉV", nev név
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY 1 DESC, 2; --születési év szerint csökkenõ sorrend, azon belül abc sorrend


/*6. Kérdezzük le az alkalmazottak adatait és azt, hogy kb. hány évesek 
(csak a születési évet vonjuk ki 2017-bõl)! */

/*
- szelektlista tartalmazhat oszlopokkal végzett mûveleteket (is)
- érdemes címkét adni az oszlopnak, különben a képlet lesz a fejléc
- mûködik más mûveletekre is (*,-,+)
*/

SELECT aid, szulev, nev, 2017-szulev kor
FROM minta.alkalmazott;

/*7. Kérdezzük le az alkalmazottak nevét és mindegyik mellé írjuk ki, 
hogy Alkalmazott! A plusz oszlop címkéje legyen Beosztás!*/

/*
- szelektlista tartalmazhat konstansokat (is)
- létrehoz egy beosztás nevû oszlopot, melynek az eredményhalmaz minden egyes sorában Alkalmazott lesz értéke
- tehát annyiszor fog kiíródni, hogy alkalmazott, ahány sort visszad a select utasításunk
*/

SELECT nev, 'Alkalmazott' beosztás
FROM minta.alkalmazott;

/*8. Nézzük meg a DUAL tábla szerkezetét!*/

/*
- DUAL tábla a SYS sémában lévõ rendszertábla, ami létrejött az adatbázis létrehozásakor
- Mivel automatikusan létrehozták az azonos nevû publikus szinonimát, ezért nem kell megadni a sémanevet a lekérdezéskor
- SQLDeveloperben sql utasítások mellett SQL*Plus utasításokat is tudunk futtatni
- ezeknek a végére nem kell pontosvesszõ, és mindig egy sorosak (ezért nem kell a pontosvesszõ)
- a DESCRIBE utasítás megjeleníti a script output-on a kért tábla szerkezetét
- rövidítve is használható: DESC táblanév
*/

DESC dual

/*9. Kérdezzük le a DUAL tábla tartalmát! Mire jó ez?*/

--konstansok lekérdezésére alkalmas, nem fog többször megjelenni, mert csak egy sor van a táblában
SELECT * FROM dual;

/*10. Kérdezzünk le szám és szöveg konstansokat!*/

SELECT 12 
FROM dual;

SELECT 12 szám 
FROM dual;

--mind a két oszlopnak is adható címke: SELECT 3 szám1, 5 szám
--a vesszõ nem tizedesvesszõ, hanem a szelektlista elemeinek elválasztó karaktere
SELECT 3,5 szám 2
FROM dual;

--sql-ben tizedes pont van
SELECT 3.5 szám 
FROM dual;

-- szöveges konstans is kiíratható
SELECT 'valami' 
FROM dual;

SELECT 'Kóbor Királyfi' név 
FROM dual;

/*11. Használjuk az Oracle-t számológépnek, 
kérdezzük le különbözõ számítások eredményét! 
(A példa lekérdezést írjuk át!)*/

SELECT 30/4 -- SELECT (30*5)-3
FROM dual;

/*12. Futtassuk le az alábbi utasításokat a dátumok különbözõ megjelenítésére:*/

/*
- dátum tárolása egy sajátos adatszerkezetben valósul meg, egy programozásból talán ismerõs struktúra, a rekord (struct) formájában
- hiába adunk meg csak bizonyos paramétereket – pl. percet, órát – attól még a DATE és TIMESTAMP a többi elemet kitölti, és fizikailag is tárolódik a háttértáron
- nem hagyhatjuk figyelmen kívül a formátumot
- beírni nem tudunk dátum értéket, csak szöveget, ami automatikus típuskonverzió áldozata lesz
- az, hogy a szöveg melyik része miként konvertálódik, az az adott session nyelvi beállításaitól függ
- ha kiíratunk egy dátumértéket, akkor a dátumból kell szöveggé konvertálni: TO_CHAR
- dátum formátum kódokat nézzük meg a dokumentációból
- bevitelnél biztonságosabb a számok használata hónapoknál, mert a megnevezéseknél a nyelvi beállítások megint okozhatnak fennakadást (milyen nyelven írjuk ki a hónapot pl., hány karakteresre van kiegészítve szóközökkel)
*/

SELECT SYSDATE FROM dual;
SELECT to_char(SYSDATE, 'HH24:MI:SS.') FROM dual; 
SELECT to_char(SYSDATE, 'YYYY.MM.DD.') FROM dual; 
SELECT to_char(SYSDATE, 'DDD' ) AS evnapja FROM dual; 
SELECT to_char(SYSDATE, 'IW' ) AS evhete FROM dual; 
SELECT to_char(SYSDATE, 'Q' ) AS negyedev FROM dual; 

/*13. Hozzuk létre a DOLGOZO táblát az azonos nevû tábla másolásával 
a MINTA sémából! Nézzük meg a szerkezetét és a benne lévõ adatokat!*/

-- lemásolja a saját sémánkba a minta séma dolgozo nevû tábláját annak tartalmával együtt
CREATE TABLE dolgozo AS SELECT * FROM minta.dolgozo;

DESC dolgozo

SELECT * FROM dolgozo;


/*14. Kérdezzük le márciusban született dolgozók adatait!*/

SELECT * FROM dolgozo
WHERE to_char(szuldat,'MM')='03' --születési dátumból csak a hónapot veszi ki számmal kiírva
;

/*15. Írassuk ki azokat a dolgozókat, 
akik 2010 július elseje elõtt kerültek a céghez! 
Rendezzük felvétel napja szerinti csökkenõ sorrendbe!*/

/*
- ha beírunk valamit, akkor szövegbõl kell dátummá konvertálni: TO_DATE függvény
- dátum formátum kódokat nézzük meg a dokumentációból
- összehasonlításánál mindenképpen azonos adattípus szerepeljen mindkét oldalon
- ha dátumok sorrendje a kérdés, akkor mindenképpen dátum szerepeljen mindkét oldalon (ne szövegeket rendezzünk abc sorrendbe)
*/

SELECT * FROM dolgozo
WHERE felv_nap<to_date('10-07','RR-MM') -- a '10-07' szöveget konvertálja 'RR-MM' formátumú dátummá
ORDER BY felv_nap DESC; --2010 február, március és májusi adatok is bekerültek

/*Egy H I B Á S megoldás: (mit okozhat, ha dátumsorrend helyett abc sorrendet
vizsgálunk)*/
SELECT * FROM dolgozo
WHERE to_char(felv_nap,'RR.MONTH.DD')<'10.JÚLIUS    .01'
ORDER BY felv_nap DESC; --2010-bõl csak február maradt benne, mert F elõbb van, mint J. Az M viszont hátrébb...

/*Nem csak szöveges és szám átírás miatt:*/
SELECT * FROM dolgozo
WHERE felv_nap<to_date('10.JÚLIUS    .01','RR.MONTH.DD')
ORDER BY felv_nap DESC; --Így is jó!

/*ÖNÁLLÓ FELADATOK*/
/******************/

/*1. Kérdezzük le a férfi dolgozókat a 
felvételük napja szerint csökkenõ sorrendben.*/

/*2. Kérdezzük le a nõi dolgozók keresztneveit 
abc szerint növekvõ sorrendben!*/

/*3. Kérdezzük le ismét a nõi dolgozók keresztneveit, 
de most ismétlõdés nélkül!*/

/*4.  Kérdezzük le azokat a dolgozókat, 
akiknek a keresztneve Krisztina, vagy a vezetékneve Kiss!*/

/*5. Kérdezzük le a januári születésû férfi dolgozók 
vezetéknevét és keresztnevét!*/

/*6. Írassuk ki a 2010 és 11 között hozzánk került dolgozókat!*/

/*7. Írassuk ki azokat a dolgozókat, akik elsején kerültek a céghez, 
jelenítsük meg a felvétel napját is!*/

/*8. Írassuk ki a dolgozók azonosítóját, nevét és a születésnapjukat kiírt hónapnévvel!*/

/*9. Írassuk ki az elõzõ listát születésnap szerinti sorrendben!
(Vigyázat! Januárral kezdõdjön, ne áprilissal!)*/

/*10. Írassuk ki a dolgozókról, hogy milyen napon születtek (hétfõ, kedd stb.)*/

/*11. Írassák ki, hogy a saját születésnapjuk milyen napra esett!*/

/*12. Írassuk ki, hogy az egyes dolgozók hány napja dolgoznak a cégnél!
A dátumot idõ nélkül a TRUNC függvénnyel kapjuk meg.*/

/*13. Kérdezzük le azokat a dolgozókat, akik 1980 elõtt születtek, 
de 2010 után kerültek a céghez.*/

/*14. Kérdezzük le azokat a dolgozókat, 
akik 20 éves koruk elõtt kerültek a céghez!*/

/*15. Kérdezzük le azokat a férfi dolgozókat, 
akik a születésnapjuk hónapjában kerültek a céghez!*/
