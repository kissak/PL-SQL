/*1. Kérdezzük le a MINTA sémában található alkalmazott tábla teljes tartalmát!*/

SELECT * FROM minta.alkalmazott;

/*2. Kérdezzük le csak a neveket (vetület)!*/

SELECT nev FROM minta.alkalmazott;

/*3. Kérdezzük le csak a születési éveket zsák és halmaz szemantikával is!*/

SELECT szulev FROM minta.alkalmazott;

SELECT DISTINCT szulev FROM minta.alkalmazott;

/*4. Kérdezzük le a születési évet és a nevet, 
a fejléc SZÜLETÉSI ÉV és NÉV legyen! Csak azok szerepeljenek 
a listában, akik 1980 után születtek!*/

SELECT  szulev "SZÜLETÉSI ÉV", nev név
FROM minta.alkalmazott
WHERE szulev>1980;

/*5. Kérdezzük le ugyanazt, mint az elõbb, az eredményt 
rendezzük év, azon belül név szerinti sorrendbe. 
Próbáljunk ki több variációt, illetve növekvõ és csökkenõ 
rendezést is*/

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

SELECT  szulev "SZÜLETÉSI ÉV", nev név
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY 1 DESC, 2; --születési év szerint csökkenõ sorrend, azon belül abc sorrend

/*6. Kérdezzük le az alkalmazottak adatait és azt, hogy kb. hány évesek 
(csak a születési évet vonjuk ki 2017-bõl)! */

SELECT aid, szulev, nev, 2017-szulev kor
FROM minta.alkalmazott;

/*7. Kérdezzük le az alkalmazottak nevét és mindegyik mellé írjuk ki, 
hogy Alkalmazott! A plusz oszlop címkéje legyen Beosztás!*/

SELECT nev, 'Alkalmazott' beosztás
FROM minta.alkalmazott;

/*8. Nézzük meg a DUAL tábla szerkezetét!*/

DESC dual

/*9. Kérdezzük le a DUAL tábla tartalmát! Mire jó ez?*/

SELECT * FROM dual;

/*10. Kérdezzünk le szám és szöveg konstansokat!*/

SELECT 12 
FROM dual;

SELECT 12 szám 
FROM dual;

SELECT 3,5 szám 
FROM dual; --a vesszõ nem tizedesvesszõ, hanem a szelektlista elemeinek elválasztó karaktere

SELECT 3.5 szám --sql-ben tizedes pont van
FROM dual;

SELECT 'valami' 
FROM dual;

SELECT 'Kóbor Királyfi' név 
FROM dual;

/*11. Használjuk az Oracle-t számológépnek, 
kérdezzük le különbözõ számítások eredményét! 
(A példa lekérdezést írjuk át!)*/

SELECT 30/4
FROM dual;

/*12. Futtassuk le az alábbi utasításokat a dátumok különbözõ megjelenítésére:*/

SELECT SYSDATE FROM dual;

SELECT to_char(SYSDATE, 'HH24:MI:SS.') FROM dual; 

SELECT to_char(SYSDATE, 'YYYY.MM.DD.') FROM dual; 

SELECT to_char(SYSDATE, 'DDD' ) AS evnapja FROM dual; 

SELECT to_char(SYSDATE, 'IW' ) AS evhete FROM dual; 

SELECT to_char(SYSDATE, 'Q' ) AS negyedev FROM dual; 

/*13. Hozzuk létre a DOLGOZO táblát az azonos nevû tábla másolásával 
a MINTA sémából! Nézzük meg a szerkezetét és a benne lévõ adatokat!*/

CREATE TABLE dolgozo AS SELECT * FROM minta.dolgozo;

DESC dolgozo

SELECT * FROM dolgozo;


/*14. Kérdezzük le márciusban született dolgozók adatait!*/

SELECT * FROM dolgozo
WHERE to_char(szuldat,'MM')='03'
;

/*15. Írassuk ki azokat a dolgozókat, 
akik 2010 július elseje elõtt kerültek a céghez! 
Rendezzük felvétel napja szerinti csökkenõ sorrendbe!*/

SELECT * FROM dolgozo
WHERE felv_nap<to_date('10-07','RR-MM')
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
