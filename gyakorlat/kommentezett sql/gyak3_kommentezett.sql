/*0.
A SELECT utas�t�s alap fel�p�t�se:
SELECT szelktlista FROM t�bla WHERE felt�tel ORDER BY oszlop
*/


/*1. K�rdezz�k le a MINTA s�m�ban tal�lhat� alkalmazott t�bla teljes tartalm�t!*/

/*
- minta s�m�ban lev� alkalmazott t�bl�b�l k�rdez le
- ha kit�r�lj�k bel�le "minta." r�szt, akkor a saj�t s�m�nkban fogja keresni az alkalmazott t�bl�t
- ha a keresett t�bla a saj�t s�m�nkban van, akkor nem k�telez� ki�rni, ez az alap�rtelmezett
*/

SELECT * FROM minta.alkalmazott;


/*2. K�rdezz�k le csak a neveket (vet�let)!*/

/*
- SELECT a megjelen�tend� oszlopokat(!) hat�rozza meg
- a szelektlista tartalmazhat oszlopokat, az oszlopokkal v�gzett m�veleteket vagy konstansokat vessz�vel elv�lasztva (vet�t�s rel�ci�s m�velet megval�s�t�sa, alap�rtelmezetten zs�k szemantik�val)
- f�ggv�nyek m�dos�thatj�k a visszaadott oszlopban tal�lhat� �rt�keket, de minden adott oszlopbeli �rt�k�re lefut
*/

SELECT nev FROM minta.alkalmazott;


/*3. K�rdezz�k le csak a sz�let�si �veket zs�k �s halmaz szemantik�val is!*/

/*
- a rel�ci� halmaz (defin�ci� szerint mentes az ism�tl�d�sekt�l), az SQL-ben az adatok zs�kot (bag) alkotnak (egy n�v t�bbsz�r is szerepelhet)
- SQL az�rt m�gis rel�ci�s, mert l�tezik az a  ROWID, amit�l minden sor egyedi lesz
- ha a SELECT ut�n be�rjuk, hogy DISTINCT, akkor lesz bel�le halmaz szemantika
*/

-- zs�k: adott �rt�k t�bbsz�r is szerepelhet
SELECT szulev FROM minta.alkalmazott;

-- halmaz: minden �rt�k egyszer szerepelhet csak
SELECT DISTINCT szulev FROM minta.alkalmazott;


/*4. K�rdezz�k le a sz�let�si �vet �s a nevet, 
a fejl�c SZ�LET�SI �V �s N�V legyen! Csak azok szerepeljenek 
a list�ban, akik 1980 ut�n sz�lettek!*/

/*
- ha nem minden sort(!) akarunk megjelen�teni, akkor ennek helye a WHERE felt�telekben van
- a where felt�tel ut�n egy logikai kifejez�snek kell �llnia
- ha valamelyik sor igazz� teszi(!) a WHERE felt�telben megfogalmazott kifejez�st, akkor �s csak akkor ker�lhet az eredm�nyhalmazba
- �res felt�telre minden illeszkedik, azaz minden igazz� teszi (teh�t, ha nincs where, akkor az �sszes sort visszadja)
- az oszlopoknak lehet c�mk�t adni: sz�k�zzel, vagy az AS kulcssz�val
- c�mke egyr�szt az eredm�nyt�bl�zat fejl�c�ben jelenik meg, m�sr�szt a sorba rendez�sn�l lehet haszn�lni (m�shol nem!)
- a sz�let�si �vben l�v� sz�k�z miatt dupla id�z�jelbe kell tenn�nk a c�mk�t, �gy viszont m�r sz�m�t a kis �s nagybet�
*/

SELECT  szulev "SZ�LET�SI �V", nev n�v --szulev AS "SZ�LET�SI �V", nev AS n�v
FROM minta.alkalmazott
WHERE szulev>1980;

/*5. K�rdezz�k le ugyanazt, mint az el�bb, az eredm�nyt 
rendezz�k �v, azon bel�l n�v szerinti sorrendbe. 
Pr�b�ljunk ki t�bb vari�ci�t, illetve n�vekv� �s cs�kken� 
rendez�st is*/

/*
- order by ut�n megadhatjuk az oszlop nev�t, c�mk�j�t vagy sorsz�m�t
- szlev = "SZ�LET�SI �V" = 1, teh�t amikor hivatkozunk b�rmelyiket haszn�lhatjuk
- vessz�vel elv�lasztva t�bbszint� rendez�st is megadhatunk (el�sz�r sz�let�si �v alapj�n rendezi, azt�n ha azok egyeznek, akkor n�v alapj�n
- rendez�s alap�rtelemezetten n�vekv� sorrendben t�rt�nik, ennek a kulcsszava az ASC, amit nem kell k�l�n ki�rnunk
- DESC kulcssz�val tudunk cs�kken� rendez�st produk�lni
- az els� 4 rendez�s ugyanazt a v�geredm�nyt adja, csak abban k�l�nb�znek, hogy mik�nt hivatkozunk a rendezni k�v�nt oszlopokra
*/

SELECT  szulev "SZ�LET�SI �V", nev n�v
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY szulev, nev;

SELECT  szulev "SZ�LET�SI �V", nev n�v
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY "SZ�LET�SI �V", n�v;

SELECT  szulev "SZ�LET�SI �V", nev n�v
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY szulev, n�v;

SELECT  szulev "SZ�LET�SI �V", nev n�v
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY 1, n�v;

-- sz�let�si �v alapj�n cs�kken� sorrendbe rendezz�k, majd n�v alapj�n ABC sorrendbe
-- ha ORDER BY 1 DESC, 2 DESC az utols� sor: akkor mindkett� alapj�n cs�kken� sorrendbe rendez�nk
SELECT  szulev "SZ�LET�SI �V", nev n�v
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY 1 DESC, 2; --sz�let�si �v szerint cs�kken� sorrend, azon bel�l abc sorrend


/*6. K�rdezz�k le az alkalmazottak adatait �s azt, hogy kb. h�ny �vesek 
(csak a sz�let�si �vet vonjuk ki 2017-b�l)! */

/*
- szelektlista tartalmazhat oszlopokkal v�gzett m�veleteket (is)
- �rdemes c�mk�t adni az oszlopnak, k�l�nben a k�plet lesz a fejl�c
- m�k�dik m�s m�veletekre is (*,-,+)
*/

SELECT aid, szulev, nev, 2017-szulev kor
FROM minta.alkalmazott;

/*7. K�rdezz�k le az alkalmazottak nev�t �s mindegyik mell� �rjuk ki, 
hogy Alkalmazott! A plusz oszlop c�mk�je legyen Beoszt�s!*/

/*
- szelektlista tartalmazhat konstansokat (is)
- l�trehoz egy beoszt�s nev� oszlopot, melynek az eredm�nyhalmaz minden egyes sor�ban Alkalmazott lesz �rt�ke
- teh�t annyiszor fog ki�r�dni, hogy alkalmazott, ah�ny sort visszad a select utas�t�sunk
*/

SELECT nev, 'Alkalmazott' beoszt�s
FROM minta.alkalmazott;

/*8. N�zz�k meg a DUAL t�bla szerkezet�t!*/

/*
- DUAL t�bla a SYS s�m�ban l�v� rendszert�bla, ami l�trej�tt az adatb�zis l�trehoz�sakor
- Mivel automatikusan l�trehozt�k az azonos nev� publikus szinonim�t, ez�rt nem kell megadni a s�manevet a lek�rdez�skor
- SQLDeveloperben sql utas�t�sok mellett SQL*Plus utas�t�sokat is tudunk futtatni
- ezeknek a v�g�re nem kell pontosvessz�, �s mindig egy sorosak (ez�rt nem kell a pontosvessz�)
- a DESCRIBE utas�t�s megjelen�ti a script output-on a k�rt t�bla szerkezet�t
- r�vid�tve is haszn�lhat�: DESC t�blan�v
*/

DESC dual

/*9. K�rdezz�k le a DUAL t�bla tartalm�t! Mire j� ez?*/

--konstansok lek�rdez�s�re alkalmas, nem fog t�bbsz�r megjelenni, mert csak egy sor van a t�bl�ban
SELECT * FROM dual;

/*10. K�rdezz�nk le sz�m �s sz�veg konstansokat!*/

SELECT 12 
FROM dual;

SELECT 12 sz�m 
FROM dual;

--mind a k�t oszlopnak is adhat� c�mke: SELECT 3 sz�m1, 5 sz�m
--a vessz� nem tizedesvessz�, hanem a szelektlista elemeinek elv�laszt� karaktere
SELECT 3,5 sz�m 2
FROM dual;

--sql-ben tizedes pont van
SELECT 3.5 sz�m 
FROM dual;

-- sz�veges konstans is ki�rathat�
SELECT 'valami' 
FROM dual;

SELECT 'K�bor Kir�lyfi' n�v 
FROM dual;

/*11. Haszn�ljuk az Oracle-t sz�mol�g�pnek, 
k�rdezz�k le k�l�nb�z� sz�m�t�sok eredm�ny�t! 
(A p�lda lek�rdez�st �rjuk �t!)*/

SELECT 30/4 -- SELECT (30*5)-3
FROM dual;

/*12. Futtassuk le az al�bbi utas�t�sokat a d�tumok k�l�nb�z� megjelen�t�s�re:*/

/*
- d�tum t�rol�sa egy saj�tos adatszerkezetben val�sul meg, egy programoz�sb�l tal�n ismer�s strukt�ra, a rekord (struct) form�j�ban
- hi�ba adunk meg csak bizonyos param�tereket � pl. percet, �r�t � att�l m�g a DATE �s TIMESTAMP a t�bbi elemet kit�lti, �s fizikailag is t�rol�dik a h�tt�rt�ron
- nem hagyhatjuk figyelmen k�v�l a form�tumot
- be�rni nem tudunk d�tum �rt�ket, csak sz�veget, ami automatikus t�puskonverzi� �ldozata lesz
- az, hogy a sz�veg melyik r�sze mik�nt konvert�l�dik, az az adott session nyelvi be�ll�t�sait�l f�gg
- ha ki�ratunk egy d�tum�rt�ket, akkor a d�tumb�l kell sz�vegg� konvert�lni: TO_CHAR
- d�tum form�tum k�dokat n�zz�k meg a dokument�ci�b�l
- beviteln�l biztons�gosabb a sz�mok haszn�lata h�napokn�l, mert a megnevez�sekn�l a nyelvi be�ll�t�sok megint okozhatnak fennakad�st (milyen nyelven �rjuk ki a h�napot pl., h�ny karakteresre van kieg�sz�tve sz�k�z�kkel)
*/

SELECT SYSDATE FROM dual;
SELECT to_char(SYSDATE, 'HH24:MI:SS.') FROM dual; 
SELECT to_char(SYSDATE, 'YYYY.MM.DD.') FROM dual; 
SELECT to_char(SYSDATE, 'DDD' ) AS evnapja FROM dual; 
SELECT to_char(SYSDATE, 'IW' ) AS evhete FROM dual; 
SELECT to_char(SYSDATE, 'Q' ) AS negyedev FROM dual; 

/*13. Hozzuk l�tre a DOLGOZO t�bl�t az azonos nev� t�bla m�sol�s�val 
a MINTA s�m�b�l! N�zz�k meg a szerkezet�t �s a benne l�v� adatokat!*/

-- lem�solja a saj�t s�m�nkba a minta s�ma dolgozo nev� t�bl�j�t annak tartalm�val egy�tt
CREATE TABLE dolgozo AS SELECT * FROM minta.dolgozo;

DESC dolgozo

SELECT * FROM dolgozo;


/*14. K�rdezz�k le m�rciusban sz�letett dolgoz�k adatait!*/

SELECT * FROM dolgozo
WHERE to_char(szuldat,'MM')='03' --sz�let�si d�tumb�l csak a h�napot veszi ki sz�mmal ki�rva
;

/*15. �rassuk ki azokat a dolgoz�kat, 
akik 2010 j�lius elseje el�tt ker�ltek a c�ghez! 
Rendezz�k felv�tel napja szerinti cs�kken� sorrendbe!*/

/*
- ha be�runk valamit, akkor sz�vegb�l kell d�tumm� konvert�lni: TO_DATE f�ggv�ny
- d�tum form�tum k�dokat n�zz�k meg a dokument�ci�b�l
- �sszehasonl�t�s�n�l mindenk�ppen azonos adatt�pus szerepeljen mindk�t oldalon
- ha d�tumok sorrendje a k�rd�s, akkor mindenk�ppen d�tum szerepeljen mindk�t oldalon (ne sz�vegeket rendezz�nk abc sorrendbe)
*/

SELECT * FROM dolgozo
WHERE felv_nap<to_date('10-07','RR-MM') -- a '10-07' sz�veget konvert�lja 'RR-MM' form�tum� d�tumm�
ORDER BY felv_nap DESC; --2010 febru�r, m�rcius �s m�jusi adatok is beker�ltek

/*Egy H I B � S megold�s: (mit okozhat, ha d�tumsorrend helyett abc sorrendet
vizsg�lunk)*/
SELECT * FROM dolgozo
WHERE to_char(felv_nap,'RR.MONTH.DD')<'10.J�LIUS    .01'
ORDER BY felv_nap DESC; --2010-b�l csak febru�r maradt benne, mert F el�bb van, mint J. Az M viszont h�tr�bb...

/*Nem csak sz�veges �s sz�m �t�r�s miatt:*/
SELECT * FROM dolgozo
WHERE felv_nap<to_date('10.J�LIUS    .01','RR.MONTH.DD')
ORDER BY felv_nap DESC; --�gy is j�!

/*�N�LL� FELADATOK*/
/******************/

/*1. K�rdezz�k le a f�rfi dolgoz�kat a 
felv�tel�k napja szerint cs�kken� sorrendben.*/

/*2. K�rdezz�k le a n�i dolgoz�k keresztneveit 
abc szerint n�vekv� sorrendben!*/

/*3. K�rdezz�k le ism�t a n�i dolgoz�k keresztneveit, 
de most ism�tl�d�s n�lk�l!*/

/*4.  K�rdezz�k le azokat a dolgoz�kat, 
akiknek a keresztneve Krisztina, vagy a vezet�kneve Kiss!*/

/*5. K�rdezz�k le a janu�ri sz�let�s� f�rfi dolgoz�k 
vezet�knev�t �s keresztnev�t!*/

/*6. �rassuk ki a 2010 �s 11 k�z�tt hozz�nk ker�lt dolgoz�kat!*/

/*7. �rassuk ki azokat a dolgoz�kat, akik elsej�n ker�ltek a c�ghez, 
jelen�ts�k meg a felv�tel napj�t is!*/

/*8. �rassuk ki a dolgoz�k azonos�t�j�t, nev�t �s a sz�let�snapjukat ki�rt h�napn�vvel!*/

/*9. �rassuk ki az el�z� list�t sz�let�snap szerinti sorrendben!
(Vigy�zat! Janu�rral kezd�dj�n, ne �prilissal!)*/

/*10. �rassuk ki a dolgoz�kr�l, hogy milyen napon sz�lettek (h�tf�, kedd stb.)*/

/*11. �rass�k ki, hogy a saj�t sz�let�snapjuk milyen napra esett!*/

/*12. �rassuk ki, hogy az egyes dolgoz�k h�ny napja dolgoznak a c�gn�l!
A d�tumot id� n�lk�l a TRUNC f�ggv�nnyel kapjuk meg.*/

/*13. K�rdezz�k le azokat a dolgoz�kat, akik 1980 el�tt sz�lettek, 
de 2010 ut�n ker�ltek a c�ghez.*/

/*14. K�rdezz�k le azokat a dolgoz�kat, 
akik 20 �ves koruk el�tt ker�ltek a c�ghez!*/

/*15. K�rdezz�k le azokat a f�rfi dolgoz�kat, 
akik a sz�let�snapjuk h�napj�ban ker�ltek a c�ghez!*/
