create view akarmi as select * from mszemely;

/*0. T�r�lj�k a saj�t s�m�nk tartalm�t.
A MINTA s�ma t�bl�inak m�sol�s�val hozzuk l�tre
a nem, szemely, kolcsonzes �s film t�bl�kat!*/
SELECT 
'drop '|| object_type ||' '
||object_name
||case when lower(object_type)='table' then ' purge;' else ';' end Lefuttatni
FROM user_objects
WHERE /*lower(object_type) IN ('table','sequence') AND*/ lower(GENERATED)='n'
ORDER BY created DESC;

CREATE TABLE szemely
AS SELECT * FROM mszemely;
CREATE TABLE dvd
AS SELECT * FROM mdvd;
CREATE TABLE kolcsonzes
AS SELECT * FROM mkolcsonzes;


-- A n�zeteknek k�t nagy felhaszn�l�si k�re van: egyr�szt egyszerus�thetik a 
-- lek�rdez�seket: a be�gyazott lek�rdez�st megcsin�ljuk k�l�n �s n�vvel l�tjuk
-- el, majd felhaszn�ljuk abb�l val� lek�rdez�sre.
-- M�sr�szt jogosults�gkezel�sre is lehet alkalmas. A mai �r�n csak a lek�rdez�sek
-- �r�s�nak megk�nny�t�s�re fogjuk haszn�lni. A lek�rdez�s eredm�nyek�nt l�trej�tt
-- rel�ci�t pontosan ugyan�gy haszn�lhatjuk lek�rdez�sekben, mint a t�bl�kat.

-- L�trehoz�s
-- CREATE VIEW n�zetn�v [(oszlopnevek)] AS SELECT �;
-- Ha nem adunk meg oszlopneveket, akkor a select-ben szereplo oszlopnevekkel j�n
-- l�tre a n�zet, de ebben az esetben k�telezo a kifejez�seknek aliast adni a select list�ban. 
-- Ha a n�zetet defini�l� select-et szeretn�nk m�dos�tani, akkor:
-- CREATE OR REPLACE VIEW n�zetn�v AS SELECT �
-- �ltal�ban minden n�zetet ezzel az utas�t�ssal szoktunk l�trehozni.
-- Van m�dos�t� utas�t�s is, de az a n�zet jellemzoit, illetve a n�zetre l�trehozott
-- k�nyszereket m�dos�tja. Nem fogunk vele dolgozni, de a dokument�ci�ban megn�zheto: 
-- ALTERT VIEW
-- T�rl�s: DROP VIEW n�zetn�v.

-- Az jogosults�gi k�rd�s, hogy hozhatunk-e l�tre n�zetet m�s s�m�j�ban l�vo t�bl�k lek�rdez�s�vel.
-- Jelenleg ez nem enged�lyezett. Ez�rt ma l�trehozunk t�bl�kat a saj�t s�m�j�ban mindenkinek,
-- hogy azt�n lehessen a n�zetesdit kipr�b�lni.

-- Teh�t a 0. feladat, hogy dobjunk el mindent �s m�sol�ssal hozzuk magunkn�l l�tre a
-- 3 k�lcs�nzos t�bl�t (a nem t�bla nem fontos). Mivel ma csak lek�rdez�nk, nincs jelentos�ge annak,
-- hogy a k�nyszereket a m�sol�s nem hozza �t.


/*1. K�sz�ts�nk a szemely-b�l k�t n�zetet, 
az egyik tartalmazza a f�rfiakat, a m�sik a n�ket.*/

-- Ezt a lek�rdez�st sim�n meg tudn�nk �rni kap�sb�l a szemely t�bl�ra is,
-- de t�telezz�k fel, hogy mi olyan felhaszn�l�k vagyunk, akik a szemely t�bla
-- l�tez�s�rol nem is tudunk, sz�munkra csak a ferfiak �s a nok t�bl�k l�teznek.
-- A lek�rdez�seket �r� felhaszn�l�k gyakran nem is tudj�k, hogy az �ltaluk haszn�lt
-- t�bl�k val�j�ban t�bl�k-e vagy n�zetek. Az o szemsz�g�kbol nincs is ennek jelentos�ge.

DESC szemely

CREATE OR REPLACE VIEW ferfiak AS 
SELECT * FROM szemely
WHERE nem='F';

select * from ferfiak;

CREATE OR REPLACE VIEW nok AS
SELECT * FROM szemely
WHERE nem='N';

/*2. K�rdezz�k le az 50 �vesn�l id�sebb n�ket!*/
SELECT * FROM nok
where szuldat<sysdate-50*365.25;

/*3. K�rdezz�k le az azonos �vben sz�letett n�ket �s f�rfiakat!*/
SELECT 
to_char(f.szuldat,'yyyy') szulev,f.kid,f.nev,n.kid,n.nev
FROM ferfiak f JOIN nok n
ON to_char(f.szuldat,'yyyy')=to_char(n.szuldat,'yyyy')
order by szulev;

/*Be�gyazott lek�rdez�s: a n�zet helyett 
ki�rhattuk volna a teljes lek�rdez�st is.*/

-- A lek�rdez�sek eredm�nye mindig rel�ci�. Ez az eredm�nyrel�ci� lehet
-- t�bb soros, t�bb oszlopos, de nem ritk�n egyetlen oszlop (gyakorlatilag egy lista),
-- vagy ak�r egyetlen �rt�k a lek�rdez�s eredm�nye. A lek�rdez�sek eredm�ny�t fel lehet
-- haszn�lni egy �jabb lek�rdez�sen bel�l.
-- A be�gyazott lek�rdez�sek n�ha a t�bl�k �sszefuz�s�nek alternat�v�i.

--a) a FROM ut�n, ak�r JOIN r�szek�nt: t�bb soros, t�bb oszlopos
--b) WHERE ill. HAVING felt�telben: lista, vagy �rt�k lek�rdez�s. Lista jellemzoen az 
--   IN oper�torral. Elofordulhat az is felt�telben, hogy t�bb �rt�kbol �ll� felt�tel�nk 
--   van, akkor az IN ut�n is t�bboszlopos SELECT szerepelhet
--c) extr�m esetben ak�r a select list�ban: �rt�klek�rdez�st, az �j lek�rdez�s minden sor�ban
--   ugyanaz az �rt�k fog megjelenni


/*4. Ism�telj�k meg a 2. feladatot n�zet haszn�lata n�lk�l, be�gyazott
lek�rdez�ssel!*/

-- Annyi t�rt�nik, hogy lem�soltuk a 2. feladat megold�s�t. Kikommentezt�k
-- belole a n�zet nev�t �s helyette z�r�jelben be�rtuk azt a lek�rdez�st, 
-- amivel a n�zet l�trej�tt. A be�gyazott lek�rdez�st mindig �gy kell elk�pzelni.
-- Gyakran az�rt van sz�ks�g a be�gyazott lek�rdez�sre, mert nincs is jogosults�gunk
-- a sz�ks�ges n�zetet l�trehozni.

SELECT * FROM 
/*nok*/
(SELECT * FROM szemely
WHERE nem='N') n
WHERE szuldat<SYSDATE-50*365.25;

/*5. K�rdezz�k le, hogy az egyes szem�lyek 
h�nyszor k�lcs�n�ztek ki korhat�r n�lk�li filmeket!
Azokat is l�ssuk, akik egyszer sem!*/

-- A csoportf�ggv�nyt a be�gyazott lek�rdez�sben kell haszn�lni �s azt k�lso joinnal
-- a szemely t�bl�hoz kapcsolni, k�l�nben a where felt�tel elrontan� a k�lso joint. 
-- A be�gyazott lek�rdez�s helyett haszn�lhatunk n�zetet is.

SELECT s.kid,s.nev, count(d.film)
FROM szemely s JOIN kolcsonzes k ON s.kid=k.kolcsonzo
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhat�r n�lk�l'
GROUP BY s.kid,s.nev; --�gy nincsenek benne a 0-k

SELECT s.kid,s.nev, count(d.film)
FROM szemely s LEFT JOIN 
(kolcsonzes k 
JOIN dvd d ON k.film=d.film)
ON s.kid=k.kolcsonzo
WHERE d.besorolas='Korhat�r n�lk�l' 
GROUP BY s.kid,s.nev; --�gy sem j�, mert a besorol�sra vonatkoz� where miatt 
--megint csak l�tez� k�lcs�nz�sek lesznek.

CREATE OR REPLACE VIEW kn_kolcsonzesek AS
SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhat�r n�lk�l' 
GROUP BY k.kolcsonzo;

SELECT  s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN kn_kolcsonzesek n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

--be�gyaz�ssal:
SELECT s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN 
--kn_kolcsonzesek
(SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhat�r n�lk�l' 
GROUP BY k.kolcsonzo)
n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

/*6. Mi van ha m�s besorol�sal kapcsolatban vagyunk kiv�ncsiak ugyanerre?*/

-- Ha be�gyazott lek�rdez�s�nk van, akkor egyszeruen �t tudjuk �rni a WHERE
-- felt�telt. Ha n�zetet haszn�ltunk, akkor viszont a n�zetet kell m�dos�tanunk.
-- Ez�rt j� pl. az OR REPLACE l�trehoz�si m�d, mert akkor csak a n�zet defin�ci�j�ban
-- �rjuk �t a felt�telt �s �jrafuttatjuk. Azt�n futtathatjuk �jra az ebbol k�sz�lt lek�rdez�st.

select distinct besorolas from dvd;

SELECT s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN 
--kn_kolcsonzesek
(SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='csak 6 �ven fel�lieknek' 
GROUP BY k.kolcsonzo)
n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;


CREATE or replace VIEW kn_kolcsonzesek AS
SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='csak 6 �ven fel�lieknek' 
GROUP BY k.kolcsonzo;

SELECT  s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN kn_kolcsonzesek n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

/*7. List�zzuk ki az �tlagn�l nagyobb orsz�gokat!*/

-- A megold�shoz a m�lt �r�n is haszn�lt ORSZ szinon�m�t haszn�ljuk.
-- Ha felt�telben van a be�gyaz�s, ott nem is k�nyelmesebb helyette a
-- n�zet haszn�lata. Gyakoribb, hogy t�nyleg meg�rjuk a select-et.

select * from orsz
where terulet>
(select avg(terulet) from orsz);

/*8. Melyik kontinensen a legkisebb az orsz�gok �tlag ter�lete?*/
/*m�lt heti 13.	Mekkora a legkisebb �tlagorsz�gm�ret kontinensenk�nt?*/



select foldresz, round(avg(terulet),2) �tlagter�let
from orsz
group by foldresz
order by �tlagter�let desc;

select min(round(avg(terulet),2)) legkisebb_�tlagter�let
from orsz
group by foldresz;

--�sszekombin�lva a fenti k�t lek�rdez�st:
-- HAVING felt�telben van a be�gyaz�s.
select foldresz, round(avg(terulet),2) �tlagter�let
from orsz
group by foldresz
having round(avg(terulet),2)=
(select min(round(avg(terulet),2)) legkisebb_�tlagter�let
from orsz
group by foldresz);

/*9. Ism�telj�k meg a 7. feladatot, de �rjuk ki az 
�tlag�r�t�ket is minden rekordban, illetve, hogy mekkora
az elt�r�s.*/

-- Enn�l a feladatn�l a selectlist�ba ker�l egy �rt�ket eredm�ny�l ad�
-- allek�rdez�s. A kisz�molt �rt�kkel tov�bbi sz�m�t�sokat is v�gezhet�nk,
-- pl. k�l�nbs�g, vagy ar�ny, kerek�t�s. L�tszik pl. hogy Oroszorsz�g m�rete
-- majdnem 25-sz�r�se az �tlagm�retnek.
-- A be�gyazott lek�rdez�sek haszn�lhat�k a JOIN helyett is. Ezeket a 
-- lek�rdez�seket semi-join-nak is szokt�k nevezni.


select orszag, terulet
, (select round(avg(terulet),0) from orsz) atalg
, terulet-(select round(avg(terulet),0) from orsz) kulonbseg  
, round(terulet/(select avg(terulet) from orsz),2) ar�ny  
from orsz
where terulet>
(select avg(terulet) from orsz)
order by terulet;

/*10. K�rdezz�k le azokat a szem�lyeket, akik m�g soha nem k�lcs�n�ztek! 
Ez�ttal ne haszn�ljunk k�ls� joint!*/

-- A megold�s elott megn�zz�k a 8. heti, k�lso joinos megold�sunkat erre a feladatra.
-- Ehelyett lek�dezhetj�k csak a SZEMELYEK t�bl�t �gy, hogy a felt�telben egy 
-- allek�rdez�st haszn�lunk a m�sik t�bl�b�l. Az allek�rdez�s egy list�t ad eredm�ny�l,
-- amit a felt�telben �gy haszn�lunk fel, hogy azokra van sz�ks�g�nk, akik nem szerepelnek
-- a list�ban, teh�t az oper�tor: NOT IN.

--8. heti megold�s:
select s.*
from mszemely s left join mkolcsonzes k
ON (s.kid=k.kolcsonzo)
WHERE k.sorszam IS NULL;

--semi join megold�s:
SELECT * FROM mszemely
WHERE kid NOT IN 
(SELECT DISTINCT kolcsonzo FROM mkolcsonzes);

/*11. K�rdezz�k le azokat a filmeket minden adatukkal, amelyeket legal�bb 5-sz�r
kik�lcs�n�ztek m�r. Ezuttal ne haszn�ljunk joint!*/


SELECT * FROM mdvd d
WHERE film IN 
(SELECT film FROM mkolcsonzes k
GROUP BY film
HAVING count(*)>=5);

/*12. K�rdezz�k le azokat a filmeket,
amelyek imdb pontsz�ma magasabb, mint az adott
rendez� filmjeinek pont�tlaga.*/

-- Korrel�lt subselect
-- Eload�son a DML-n�l volt r�la sz�, de sima select-ben �s DML utas�t�sban egyar�n elofordulhat,
-- hogy be�gyazott lek�rdez�st haszn�lunk �s n�ha sz�ks�ges, hogy a be�gyazott lek�rdez�s a k�lso
-- utas�t�s �ltal �rintett minden rekordra k�l�n-k�l�n lefusson. Azaz a be�gyazott lek�rdez�sben 
-- olyan felt�tel van, ami a k�lso utas�t�s adott rekordj�nak az egyik mezoj�tol f�gg. �ppen ez�rt
-- n�z�nk p�ld�t select-ben l�vo correl�lt subselectre is, illetve DML utas�t�sban levore is. 
-- Korrel�lt subselect �nmag�ban nem futtathat� le, mert hivatkozik a k�lso utas�t�s t�bl�j�nak egy
-- mezoj�re.

SELECT film,rendezo,imdb_pontszam FROM mdvd d1
WHERE imdb_pontszam>
(SELECT avg(imdb_pontszam)
FROM mdvd d2
WHERE d2.rendezo=d1.rendezo
)
ORDER BY rendezo
;

/*13. Legyenek VIP �gyfelek, akik legal�bb egyszer kik�lcs�n�zt�k 
valamelyik Keresztapa filmet!*/

UPDATE szemely s
SET vip=1
WHERE kid IN 
(SELECT kolcsonzo
FROM kolcsonzes
WHERE lower(film) LIKE 'keresztapa%');
COMMIT;

/*14. Legyenek vip �gyfelek, akik a sz�let�si
�v�kn�l r�gebbi filmet is k�lcs�n�ztek m�r ki!*/

UPDATE szemely s
SET vip=1
WHERE kid=
(SELECT distinct kolcsonzo 
FROM kolcsonzes k
JOIN dvd d USING(film)
WHERE s.kid=k.kolcsonzo
and extract(year from s.szuldat)>d.ev
);
commit;

/*15. Hozzunk l�tre k�t n�zetet a t�bl�inkb�l, az egyikben minden 
kapcsol�d� adat szerepeljen, a m�sikban �sszesen minden adat 
szerepeljen a t�bl�inkb�l!*/

-- Az utols� feladatban hozzunk l�tre 2 n�zetet a 3 t�bl�nkb�l, ami alapb�l
-- megk�nny�ti az �sszekapcsol�sos lek�rdez�seket. Az egyik n�zetben csak a
-- t�nyleges k�lcs�nz�sek minden adata szerepeljen. A m�sikban minden olyan
-- szem�ly �s DVD is, amelyek nem szerepeltek egyetlen k�lcs�nz�si esem�nyn�l sem.

CREATE OR REPLACE VIEW minden AS
SELECT film,kid,nev,nem,szuldat,beiratkozas,vip,k.sorszam k_sorszam,kolcsonzo,napok,d.sorszam d_sorszam,rendezo,
ev,hossz, mufaj1,mufaj2,besorolas,imdb_pontszam, gyarto_orszag 
FROM szemely s JOIN kolcsonzes k ON s.kid=k.kolcsonzo
JOIN dvd d USING(film);

CREATE OR REPLACE VIEW minden2 AS
SELECT film,kid,nev,nem,szuldat,beiratkozas,vip,k.sorszam k_sorszam,kolcsonzo,napok,d.sorszam d_sorszam,rendezo,
ev,hossz, mufaj1,mufaj2,besorolas,imdb_pontszam, gyarto_orszag
FROM (szemely s LEFT JOIN kolcsonzes k ON s.kid=k.kolcsonzo) 
RIGHT JOIN dvd d USING(film);

SELECT count(*) minden_kolcsonzes FROM minden;
select count(*) minden_rekord from minden2;

/*******************/
/*�n�ll� feladatok:*/
/*******************/
/*1.	K�rdezz�k le a VIP f�rfi �gyfeleinket. 
Haszn�ljuk az �ra elej�n l�trehozott n�zetet!*/

/*2.	K�rdezz�k le a 40 �vesn�l fiatalabb f�rfiakat �s a n�luk 
fiatalabb n�ket! Rendezz�k a list�t a f�rfiak neve szerint, 
azon bel�l a n�k neve szerint! 
Haszn�ljuk az �ra elej�n l�trehozott n�zeteket!*/

/*3.	K�rdezz�k le, hogy az egyes filmeket h�ny alkalommal k�lcs�n�zt�k 
ki 3 napn�l r�videbb id�re! Csak azokat list�zzuk ki, 
amelyekn�l egy�ltal�n volt ilyen k�lcs�nz�s!*/

/*4.	Ism�telj�k meg az el�z� feladatot, k�rdezz�k le, hogy az 
egyes filmeket h�ny alkalommal k�lcs�n�zt�k ki 3 napn�l r�videbb id�re! 
Azok is jelenjenek meg a lek�rdez�sben, amelyekn�l ez a sz�m 0!*/

/*5.	List�zzuk ki az �tlaghosszn�lh hosszabb filmeket!*/

/*6.	List�zzuk ki azokt a filmeket, amelyek hosszabbak a 
leghosszabb korhat�r n�lk�li filmn�l!*/

/*7.	List�zzuk ki azokat a filmeket amelyek hosszabak a saj�t 
m�fajuk �tlaghossz�n�l (csak a m�faj1 oszlopot vegy�k figyelembe!)*/

/*8.	(Neh�z) List�zzuk ki azokat a filmeket amelyek hosszabak a saj�t 
m�fajuk �tlaghossz�n�l! Vegy�k azonos m�faj�nak minden olyan filmet, 
amelynek a m�faj1 vagy m�faj 2 besorol�sa megegyezik az adott film 
m�faj1 vagy m�faj2 besorol�s�val!*/

/*9.	List�zzuk ki, hogy melyik filmet h�nyszor k�lcs�n�zt�k ki �sszesen, 
�s h�nyszor k�lcs�n�zt�k ki 4 napn�l hosszabb id�re! Ha egyszer sem, 
az is jelenjen meg az eredm�nyben!*/

/*10.	List�zzuk ki, hogy melyik �gyfel�nk h�ny saj�t mag�n�l 
�regebb filmet k�lcs�nz�tt m�r ki!*/


