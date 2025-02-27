/*1. Hozzunk l�tre egy sorsz�mgener�tort (Sequence) 
�s k�rdezz�k le a k�vetkez� �rt�k�t, aktu�lis �rt�k�t!*/

-- Sorsz�mgener�tor objektum
-- Seg�ts�g�vel biztos�that�, hogy mindig k�l�nb�zo �rt�ket tudjunk kiolvasni
-- A sorsz�mgener�tornak k�telezoen csak nevet kell adnunk, de opcion�lisan megadhatunk rengeteg m�st is (dokument�ci�ban lehet bogar�szni)
-- A leg�bb dolognak egy�rtelmu a megnevez�se, mondjuk a START WITH (kezdo�rt�k), INCREMENT BY (l�p�sk�z)

CREATE SEQUENCE sorsz�mpr�ba START WITH 1000 INCREMENT BY 10;

-- A sorsz�mgener�tor k�vetkezo �rt�k�t �gy lehet lek�rdezni:
SELECT sorsz�mpr�ba.nextval FROM dual;

-- Az aktu�lis �rt�ket is le lehet k�rdezni, a nextval helyett currval-lal
-- ez minden sessionben csak azut�n muk�dik, hogy m�r volt lek�rdezve nextval az adott sessionben
SELECT sorsz�mpr�ba.currval FROM dual;

/*2. T�r�lj�k ki az �sszes t�bl�nakat �s sorozatunkat!*/

-- a ALL_TABLES �s p�rja a USER_TABLES mellett nagyon hasznos ismerni az ALL_OBJECTS �s USER_OBJECTS katal�gust�bl�kat is
-- Itt nem csak a t�bl�inkat l�tjuk, hanem minden objektumot
-- A m�sodik select val�j�ban egyetlen elemet tartalmaz: sz�veg�sszefuz�ssel egy drop utas�t�st 
-- A drop utas�t�s v�ltoz� elemeit a USER_OBJECTS t�bl�b�l k�rdezz�k le, azaz az objektum t�pus�t, nev�t, illetve ha a t�pus t�bla, akkor a PURGE kulcssz�t is oda�rjuk a v�g�re 
-- A where-ben megadjuk, hogy csak t�bla vagy sequence t�pus �s csak a nem gener�ltak. 
-- a rendez�s azt mondja, hogy ford�tott sorrendben dobjuk el az objektumokat, mint ahogy l�trehoztuk oket. 
-- Ez az�rt j�, mert akkor nagy val�sz�nus�ggel az egym�sra hivatkoz� t�bl�kat is j� sorrenben siker�l majd eldobnunk.
-- Lefuttat�s ut�n az eredm�ny�l kapott utas�t�sokat ctr+c ctr+v seg�ts�g�vel visszam�solhatjuk a worksheetre �s kijel�l�s ut�n egyben le tudjuk oket futtatni. 
-- Csak a t�bl�inkat �s a sorsz�mainkat dobjuk el (abb�l is csak azokat, amiket mi gener�ltunk � egyelore m�g csak ilyen�nk lesz)
-- m�gis ha �jra lek�rdezz�k a USER_OBJECTS-et, akkor azt l�tjuk, hogy az indexek is eltuntek.

SELECT * FROM user_objects
ORDER BY object_type;

SELECT 
'drop '|| object_type ||' '
||object_name
||case when lower(object_type)='table' then ' purge;' else ';' end Lefuttatni
FROM user_objects
where lower(object_type) in ('table','sequence') and lower(generated)='n'
ORDER BY created DESC;

select * from user_objects;

/*3. Hozzunk l�tre egy KOLCSONZO t�bl�t, azonos�t� �s n�v legyen benne. 
Az azonos�t� automatikusan gener�l�djon!*/


-- Always vagy elhagy�s eset�n nem is enged semmit be�rni az oszlopba, by default eset�n csak �resen hagy�skor �rja fel�l, ON NULL eset�n �rt�kk�nt megadott NULL-t is fel�l�rja
-- Ak�r �gy, ak�r �gy, automatikusan not null lesz
-- A h�tt�rben egy sequence j�n l�tre, ha t�rl�nk, �jra besz�runk, akkor a sz�ml�l� automatikusan tov�bb megy
-- L�thatjuk a dokument�ci�ban identity_options-k�nt kb. ugyanazokat a tulajdons�gokat lehet megadni, amit a sequence-n�l
-- Ezek a h�tt�rben automatikusan l�trej�vo sequence tulajdons�gai lesznek


CREATE TABLE kolcsonzo
(kid NUMBER(4) GENERATED AS IDENTITY PRIMARY KEY
,nev VARCHAR2(40));

INSERT INTO kolcsonzo
VALUES(
10
,'M�zga G�za'
);

INSERT INTO kolcsonzo(nev)
VALUES('M�zga G�za');
INSERT INTO kolcsonzo(nev)
VALUES('M�zga Alad�r');
INSERT INTO kolcsonzo(nev)
VALUES('Hufn�gel Pisti');

SELECT * FROM kolcsonzo;
ROLLBACK;

COMMIT;


DROP TABLE kolcsonzo PURGE;

CREATE TABLE kolcsonzo
(kid NUMBER(4) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,nev VARCHAR2(40));

INSERT INTO kolcsonzo
VALUES(
10
,'M�zga G�za'
);


INSERT INTO kolcsonzo(nev)
VALUES('M�zga G�za');
INSERT INTO kolcsonzo(nev)
VALUES('M�zga Alad�r');
INSERT INTO kolcsonzo(nev)
VALUES('Hufn�gel Pisti');

SELECT * FROM kolcsonzo;

/*Hozzunk l�tre egy k�lcs�nz�s t�bl�t! Sorsz�mmal, hivatkoz�ssal a kolcsonzo
t�bl�ra �s k�nyvc�mmel!*/

-- Inline sim�n REFERENCES �s megadni az objektumot �s annak oszlop�t, amire hivatkozunk (ha az oszlopot elhagyjuk, akkor az azonos nevu oszlopra hivatkozik)
-- Fontos, hogy a hivatkoz� mezo �s a hivatkozott mezo adatt�pusa azonos legyen (mezom�ret mindegy)
-- alap�rtelmezetten hivatkozott �rt�ket nem lehet kit�r�lni a hivatkozott t�bl�b�l
-- ha viszont az idegenkulcsot ON DELETE klauzul�val hozzuk l�tre, akkor m�gis van lehetos�g t�rl�sre. 
-- A CASCADE tovagyuruz�st jelent, azaz a hivatkoz� rekordok is automatikusan t�rlodnek.
-- Vigy�zat! Nem a t�rl�skor tudom eld�nteni, hogy akarok-e tovagyuruz�st, hanem az idegen kulcs defini�l�sakor! 
-- A SET NULL azt jelenti, hogy a hivatkozott adat t�rl�sekor a hivatkoz� t�bl�ban NULL �rt�k lesz, csak akkor van �rtelme be�ll�tani, ha egy�bk�nt az adott mezore nincs NOT NULL felt�tel
-- Idegen kulcs csak m�sik t�bla UNIQUE tulajdons�g� mezoj�re hivatkozhat (nem felt�tlen�l kell a hivatkozott mezonek kulcsnak lenni), azaz a null �rt�k megengedett. 
-- az adatt�pusnak meg kell egyezni
-- l�tezik t�bb oszlopos idegen kulcs is
-- a hivatkoz� �s hivatkozott oszlopok darabsz�m�nak meg kell egyezni �s ebben az esetben az oszlopok kombin�ci�j�nak kell UNIQUE-nak lenni a hivatkozott t�bl�ban (ezt csak out-of-line lehet megadni)
-- Out-of-line megad�sn�l sz�ks�ges a FOREIGN KEY (mezolista) megad�sa is, hogy meg tudjuk jel�lni, hogy melyik oszlop (esetleg oszlopkombin�ci�) lesz az idegen kulcs
-- A mintap�ld�ban van inline �s out-of-line is, a v�geredm�ny ugyanaz lesz


--inline
CREATE TABLE kolcsonzes(
sorszam NUMBER(5) GENERATED AS IDENTITY PRIMARY KEY
,kolcsonzo NUMBER(3) REFERENCES kolcsonzo (kid)
,konyv VARCHAR2(40)
);

INSERT INTO kolcsonzes(kolcsonzo, konyv)
VALUES(
'10'
,'�rutaz�s'
);

INSERT INTO kolcsonzes(kolcsonzo, konyv)
VALUES(
'10'
,'�rutaz�s2'
);

select * from kolcsonzes;

drop table kolcsonzo purge;

drop table kolcsonzes purge;

--out-of-line
CREATE TABLE kolcsonzes(
sorszam NUMBER(5) GENERATED AS IDENTITY PRIMARY KEY
,kolcsonzo NUMBER(3) 
,konyv VARCHAR2(40)
,foreign key (kolcsonzo)REFERENCES kolcsonzo (kid)
);

select * from user_objects;
select * from user_constraints;

/******************/
/*Csoport feladat:*/
/******************/

/*1. A 3 le�r�s k�z�l a felesleges kett�t t�r�lj�k ki, a harmadikat pedig tervezz�k
meg az oktat�val k�z�sen!*/

/*Az Egyetem s�ma instrukci�i:

Egy egyetem egyszer�s�tett adatb�zis�t kell megtervezn�nk, 
amelyben t�roljuk a hallgat�k adatait, valamint a t�rgyakat 
�s az abb�l el�rt eredm�nyeket. Az eredm�nyek f�l�vekre oszlanak. 

A hallgat�kr�l t�roljuk az egyedi azonos�t�jukat, nev�ket, 
sz�let�s�ket. Ezen k�v�l a tanulm�nyaik kezd�s�nek d�tum�t 
(ami valamelyik �v szeptember 1. vagy febru�r 1. lehet), illetve a szakj�t.

A tant�rgyaknak van egyedi k�dja, nem felt�tlen�l egyedi neve, 
kredit�rt�ke �s besorol�sa (k�telez�, k�telez�en v�laszthat�, v�laszthat�), 
tant�rgyfelel�se �s egy szervezeti egys�g, amihez tartozik. 
Ezen k�v�l van egy le�r�s mez� is a tant�rgyle�r�s sz�m�ra.

A hallgat�k a t�rgyakat k�l�nb�z� f�l�vekben vehetik fel �s ott 
k�l�nb�z� eredm�nyeik lehetnek. Egy t�rgyat t�bbsz�r is fel lehet 
venni �s egy felv�tel alkalm�val is t�bb eredm�ny sz�lethet. 
Az eredm�ny lehet egy oszt�lyzat, vagy egy�b (nem vizsg�zott, 
nem jelent meg, igazoltan nem jelent meg). 

Az eredm�nyeket munkat�rsaink r�gz�tik az adatb�zisban, �gy 
legyen egy mez�, ami a felviv� azonos�t�j�t t�rolja �s a 
felvitel d�tum�t (mindkett�t default).
*/


/*2. Hozz�k l�tre a k�z�sen megtervezett adatb�zist!*/
