/*1. K�rdezz�k le a MINTA s�m�ban tal�lhat� alkalmazott t�bla teljes tartalm�t!*/

SELECT * FROM minta.alkalmazott;

/*2. K�rdezz�k le csak a neveket (vet�let)!*/

SELECT nev FROM minta.alkalmazott;

/*3. K�rdezz�k le csak a sz�let�si �veket zs�k �s halmaz szemantik�val is!*/

SELECT szulev FROM minta.alkalmazott;

SELECT DISTINCT szulev FROM minta.alkalmazott;

/*4. K�rdezz�k le a sz�let�si �vet �s a nevet, 
a fejl�c SZ�LET�SI �V �s N�V legyen! Csak azok szerepeljenek 
a list�ban, akik 1980 ut�n sz�lettek!*/

SELECT  szulev "SZ�LET�SI �V", nev n�v
FROM minta.alkalmazott
WHERE szulev>1980;

/*5. K�rdezz�k le ugyanazt, mint az el�bb, az eredm�nyt 
rendezz�k �v, azon bel�l n�v szerinti sorrendbe. 
Pr�b�ljunk ki t�bb vari�ci�t, illetve n�vekv� �s cs�kken� 
rendez�st is*/

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

SELECT  szulev "SZ�LET�SI �V", nev n�v
FROM minta.alkalmazott
WHERE szulev>1980
ORDER BY 1 DESC, 2; --sz�let�si �v szerint cs�kken� sorrend, azon bel�l abc sorrend

/*6. K�rdezz�k le az alkalmazottak adatait �s azt, hogy kb. h�ny �vesek 
(csak a sz�let�si �vet vonjuk ki 2017-b�l)! */

SELECT aid, szulev, nev, 2017-szulev kor
FROM minta.alkalmazott;

/*7. K�rdezz�k le az alkalmazottak nev�t �s mindegyik mell� �rjuk ki, 
hogy Alkalmazott! A plusz oszlop c�mk�je legyen Beoszt�s!*/

SELECT nev, 'Alkalmazott' beoszt�s
FROM minta.alkalmazott;

/*8. N�zz�k meg a DUAL t�bla szerkezet�t!*/

DESC dual

/*9. K�rdezz�k le a DUAL t�bla tartalm�t! Mire j� ez?*/

SELECT * FROM dual;

/*10. K�rdezz�nk le sz�m �s sz�veg konstansokat!*/

SELECT 12 
FROM dual;

SELECT 12 sz�m 
FROM dual;

SELECT 3,5 sz�m 
FROM dual; --a vessz� nem tizedesvessz�, hanem a szelektlista elemeinek elv�laszt� karaktere

SELECT 3.5 sz�m --sql-ben tizedes pont van
FROM dual;

SELECT 'valami' 
FROM dual;

SELECT 'K�bor Kir�lyfi' n�v 
FROM dual;

/*11. Haszn�ljuk az Oracle-t sz�mol�g�pnek, 
k�rdezz�k le k�l�nb�z� sz�m�t�sok eredm�ny�t! 
(A p�lda lek�rdez�st �rjuk �t!)*/

SELECT 30/4
FROM dual;

/*12. Futtassuk le az al�bbi utas�t�sokat a d�tumok k�l�nb�z� megjelen�t�s�re:*/

SELECT SYSDATE FROM dual;

SELECT to_char(SYSDATE, 'HH24:MI:SS.') FROM dual; 

SELECT to_char(SYSDATE, 'YYYY.MM.DD.') FROM dual; 

SELECT to_char(SYSDATE, 'DDD' ) AS evnapja FROM dual; 

SELECT to_char(SYSDATE, 'IW' ) AS evhete FROM dual; 

SELECT to_char(SYSDATE, 'Q' ) AS negyedev FROM dual; 

/*13. Hozzuk l�tre a DOLGOZO t�bl�t az azonos nev� t�bla m�sol�s�val 
a MINTA s�m�b�l! N�zz�k meg a szerkezet�t �s a benne l�v� adatokat!*/

CREATE TABLE dolgozo AS SELECT * FROM minta.dolgozo;

DESC dolgozo

SELECT * FROM dolgozo;


/*14. K�rdezz�k le m�rciusban sz�letett dolgoz�k adatait!*/

SELECT * FROM dolgozo
WHERE to_char(szuldat,'MM')='03'
;

/*15. �rassuk ki azokat a dolgoz�kat, 
akik 2010 j�lius elseje el�tt ker�ltek a c�ghez! 
Rendezz�k felv�tel napja szerinti cs�kken� sorrendbe!*/

SELECT * FROM dolgozo
WHERE felv_nap<to_date('10-07','RR-MM')
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
