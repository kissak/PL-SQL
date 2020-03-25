-- Hierarchikus lek�rdez�sek, illeszt�s gyakorl�sa

-- Eload�son m�r esett sz� arr�l, hogy hierarchikus szerkezet is �br�zolhat�,
-- t�rolhat� rel�ci�ban. Gyakorlatilag egy 2 oszlopos t�bl�zatr�l van sz�, ahol
-- az egyik oszlop egyedileg tartalmazza a hierarchia minden egyed�t (annak azonos�t�j�t),
-- a m�sik oszlop pedig a k�zvetlen felette �ll� egyednek az azonos�t�j�t.  
-- (Elofordulhatna olyan gr�f is, amiben van loop, azokra is vannak megold�sok, de azokkal
-- a kurzus keret�ben nem foglalkozunk!)

-- Fontos, hogy a k�t oszlopban ugyanolyan adatok szerepelnek, pl dolgoz�k azonos�t�ja:
-- ki kinek a fon�ke, vagy f�ldrajzi helyek, melyik hely melyiknek a r�sze, vagy szervezeti
-- egys�gek, melyik szervezeti egys�g melyiknek a r�sze, vagy term�kkateg�ri�k amelyek 
-- egym�s fokateg�ri�i. A lefelso szinten l�vo egyedeknek nyilv�n nincsen felettese. 
-- Ennek �br�zol�sa k�tf�lek�ppen lehets�ges: vagy null �rt�k szerepel a m�sodik oszlopban,
-- vagy egy�ltal�n nem szerepeltetj�k oket az elso oszlopban. Mi az ut�bbit fogjuk alkalmazni.

-- Az �rai feladatokhoz a MINTA s�ma DOLGOZO �s  FONOK t�bl�it fogjuk haszn�lni (MDOLGOZO,
-- MFONOK szinon�m�k is haszn�lhat�ak). Elobbiben 62 dolgoz� adatait tal�ljuk, ut�bbiban azt,
-- hogy ennek a 62 dolgoz�nak ki a fon�ke. A FONOK t�bla �ltal l�trehozott hierarchia k�pe
-- el�rheto a Moodle-ben. Az a meg�rt�s egy magasabb foka, hogy csak a t�bla ismeret�ben is
-- tudjuk �rtelmezni a feladatokat.
 


/*1. Hozzuk l�tre a MINTA s�ma DOLGOZO �s FONOK t�bl�inak m�solat�t
a saj�t s�m�nkban!*/

CREATE TABLE dolgozo AS SELECT * FROM minta.dolgozo;
CREATE TABLE fonok AS SELECT * FROM minta.fonok;

/*2. M�dos�tsuk a t�bl�kat �gy, hogy a DOLGOZO t�bl�nak legyen
kulcsa, a FONOK t�bla pedig idegen kulcsokkal hivatkozzon a 
DOLGOZO t�bla kulcs�ra!*/

DESC dolgozo
DESC fonok

ALTER TABLE dolgozo MODIFY
(ID PRIMARY KEY);

-- mindk�t oszlopban ugyan�gy a dolgoz�k azonos�t�i szerepelnek
ALTER TABLE fonok MODIFY (
 ID REFERENCES dolgozo
,fonok_id REFERENCES dolgozo
);

/*3. K�rdezz�k le az egyes beosztottak �sszes f�n�k�t
(nem csak a k�zvetleneket)!
�rjuk ki azt is, hogy az adott f�n�k h�ny szinttel van
feljebb �s azt is, hogy kik a k�ztes f�n�k�k!*/

-- Hierarchikus lek�rdez�s l�trehoz�s�hoz a CONNECT BY felt�telt kell megadnunk. 
-- Ennek helye a SELECT utas�t�sban a WHERE r�sz ut�n van. A CONNECT BY ut�n 
-- kell megadnunk, hogy milyen ir�nyban kell bej�rni a t�bl�zatot. A PRIOR sz�val
-- adjuk meg a bej�r�s ir�ny�t. Azaz a fon�k�s p�ld�n�l maradva:
--	CONNECT BY  fonok_id = PRIOR id: veszi az adott rekordot, azt�n folytatja 
--		az(ok)kal a rekord(ok)kal, ahol az adott rekordban id-k�nt szereplo �rt�k 
--		fon�k_id-k�nt szerepel.
--	CONNECT BY  PRIOR fonok_id = id: veszi az adott rekordot, azt�n folytatja 
--		az(ok)kal a rekord(ok)kal, ahol az adott rekordban fonok_id-k�nt szereplo
--		�rt�k id-k�nt szerepel.

-- Az elso lek�rdez�seinket �rdemes kieg�sz�teni k�t plusz oszloppal �s egy 
-- sorbarendez�ssel, h�tha �gy jobban �rthetov� v�lik a lek�rdez�s muk�d�se:
--	LEVEL pszeudo oszlop: megmutatja, hogy az adott rekord egy kiindul�shoz k�pest 
--		h�nyadik szinten jelenik meg.
--	sys_connect_by_path f�ggv�ny: megmutatja az utat az adott kiindul� rekordt�l 
--		kezdve az aktu�lisan ki�rt rekordig


SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,LEVEL,ID,fonok_id
FROM fonok
CONNECT BY ID = PRIOR fonok_id
ORDER BY kapcsolati_ut,LEVEL,ID,fonok_id
;

-- Teh�t az 1-es dolgoz�nak 4 fon�ke van, a k�zvetlen a 24-es, 
-- neki a fon�ke a 40-es �s �gy tov�bb.

/*4. K�rdezz�k le csak az 1-es k�d� dolgoz� f�n�keit!*/

-- A CONNECT BY el� kell be�rni az ind�t� felt�telt. Minden olyan rekordt�l be
-- fogja j�rni a f�t, ami megfelel a felt�telnek. Ha a felt�tel egytlen azonos�t�t
-- hat�roz meg, akkor az adott azonos�t�j� dolgoz�k fon�keit fogjuk megkapni. Ha 
-- csak a fon�k�kre vagyunk kiv�ncsiak, akkor nem sz�ks�ges ki�rni az �tvonalat,
-- szintet sot az egyes l�p�sekben az alkalmazottak id-j�t sem, hiszen azok mindig
-- megjelennek elotte fon�kk�nt is.

SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,LEVEL,ID,fonok_id
FROM fonok
START WITH ID = 1
CONNECT BY ID = PRIOR fonok_id
ORDER BY kapcsolati_ut,LEVEL,ID,fonok_id
;

--egyszer�bben:
SELECT fonok_id
FROM fonok
START WITH ID = 1
CONNECT BY ID = PRIOR fonok_id
ORDER BY LEVEL
;

/*5. �rjuk ki az 1-es k�d� dolgoz� f�n�keinek azonos�t�j�t
�s a nev�t!*/

-- Ahhoz, hogy az azonos�t�khoz egy�b adatokat is tudjunk kapcsolni, term�szetesen
-- a t�bl�k illeszt�s�re van sz�ks�g. Mivel a FONOK t�bla k�t idegen kulccsal is 
-- kapcsol�dik a DOLGOZO t�bl�hoz, mindig figyelj�nk nagyon oda, hogy �pp melyik 
-- kapcsolatot akarjuk megval�s�tani (esetleg mind a kettot)

SELECT fonok_id, vnev||' '||knev bana_�rp�dn�_f�n�kei
FROM fonok JOIN dolgozo
ON (fonok.fonok_id=dolgozo.ID) --!!
START WITH fonok.ID = 1
CONNECT BY fonok.ID = PRIOR fonok_id
ORDER BY LEVEL
;

/*6. K�rdezz�k le az egyes f�n�k�k �sszes beosztottj�t
(nem csak a k�zvetlen beosztottakat)! 
�rjuk ki azt is, hogy h�nyadik szint� a beosztott �s azt
is, hogy kik a k�ztes f�n�k�k!
(Ford�tsuk meg a 3. feladatot!)*/

SELECT sys_connect_by_path(to_char(fonok_id,'00'), '/' ) AS kapcsolati_ut
,LEVEL,fonok_id,ID
FROM fonok
CONNECT BY fonok_id = PRIOR ID
ORDER BY kapcsolati_ut,LEVEL,fonok_id,ID
;

/*7. �rjuk ki csak a 40-es k�d� dolgoz� beosztottjait!*/

SELECT sys_connect_by_path(to_char(fonok_id,'00'), '/' ) AS kapcsolati_ut
,LEVEL,fonok_id,ID
FROM fonok
START WITH fonok_id=40
CONNECT BY fonok_id = PRIOR ID
ORDER BY kapcsolati_ut,LEVEL,fonok_id,ID
;

--egyszer�bben:
SELECT ID
FROM fonok
START WITH fonok_id=40
CONNECT BY fonok_id = PRIOR ID
ORDER BY LEVEL,ID
;

/*8. �rjuk ki azokat a f�n�k�ket, akiknek van 30 �vesn�l fiatalabb n�i
alkalmazottjuk!
�rjuk ki, hogy h�ny ilyen alkalmazottjuk van (csak azokat �rjuk ki,
akiknek egy�ltal�n van.*/

-- Mivel a felt�tel�nk a beosztottakra vonatkozik, ki�rni meg a fon�k�k nev�t akarjuk,
-- ez�rt a DOLGOZO t�bl�ra k�tszer is sz�ks�g�nk lesz, egyszer az id-n kereszt�l, egyszer
-- pedig a fonok_id-n kereszt�l van kapcsolat. El kell nevezni a t�bl�zatot k�tf�lek�ppen,
-- hogy egy�rtelmuen meg tudjuk mondani, hogy melyik t�bl�zat oszlopaira hivatkozunk. Az,
-- hogy 30 �vn�l fiatalabb nok fon�keit keress�k a START WITH felt�telben jelenik meg, azaz
-- azokn�l a rekordokn�l ind�tjuk a bej�r�st, amelyekre ez az �sszetett felt�tel igaz. A 
-- DISTINCT az�rt kell, mert pl. a vez�rigazgat� nyilv�n mindegyik�knek a fon�ke, felesleges
-- minden bej�r�s eredm�nyek�ppen ki�rni. Ugyanez�rt k�nnyu a feladat m�sodik fel�t megoldani.
-- Minden fon�k annyiszor fog szerepelni a ki�r�sban, ah�ny alkalmazott fon�klist�j�ban 
-- megjelenik, teh�t a count f�ggv�ny azt fogja megadni, hogy h�ny alkalmazottjuk van, teh�t
-- pont megkapjuk a v�laszt a k�rd�s�nkre.

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
count(*) alkalmazottak_sz�ma
FROM
dolgozo d1 JOIN fonok ON d1.ID=fonok.ID
JOIN dolgozo d2 ON fonok.fonok_id=d2.ID
START WITH d1.nem=1 AND d1.szuldat>SYSDATE-30*365.25
CONNECT BY fonok.ID = PRIOR fonok.fonok_id
GROUP BY d2.ID, d2.vnev||' '||d2.knev
ORDER BY alkalmazottak_sz�ma DESC;

