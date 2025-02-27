/*1. K�rdezz�k le az Oracle-ben t�rolhat� legkisebb �s legnagyobb d�tumot!*/

/*
Juli�n napt�rsz�m�t�s
napok sorsz�mok �az id�k kezdet�t�l� �s a napon bel�l az id�t t�rtsz�mokkal t�roljuk, pl. 0.5 az pont 12:00

1 = -4712
5373484 = 9999
mert: 4712 * 365 (-4712-t�l 0-ig) + 9999 * 365 (0-t�l 9999-ig) ~ 5373484
sz�k��vek nem lettek figyelembe v�ve,az�rt nem teljesen pontos
9999.dec.30 = -4712.jan.01 + 5373484 (napban)
*/

SELECT 
to_char(to_date(1,'J'),'BC YYYY.MM.DD') els�_nap --Oracle id�sz�m�t�s kezdete
,to_char(to_date(5373484,'J'),'BC YYYY.MM.DD') utols�_nap  --Oracle id�sz�m�t�s v�ge
FROM dual;

/*2. K�rdezz�k le, hogy milyen nap van ma, mi volt tegnap �s mi lesz holnap!*/

-- d�tumokkal k�l�nb�z� m�veleteket is tudunk v�gezni. Pl. kivonni �ket egym�sb�l, sz�m�rt�ket hozz�adni
-- oszt�snak �s a szorz�snak nincs �rtelme illetve k�t d�tumot sem tudunk �sszeadni, �gy ezek a m�veletek nem is alkalmazhat�ak

SELECT
to_char(sysdate,'day') ma
,to_char(SYSDATE -1,'day') tegnap
,to_char(sysdate +1,'day') holnap
FROM DUAL;

/*3. K�rdezz�k le, hogy az aktu�lis h�nap utols� napja milyen napra esik.*/

-- http://docs.oracle.com/cd/B19306_01/server.102/b14200/functions001.htm  Datetime functions

select to_char(last_day(sysdate),'day') UTOLS� from dual;

/*4. K�rdezz�k le k�tf�lek�ppen, hogy mi volt a d�tum 4 �vvel ezel�tt 
(a k�zbees� sz�k��v figyelembe v�tel�vel �s an�lk�l).*/

--Oracle tudja, hogy mikor van sz�k��v, ez�rt az add_months azt figyelembe veszi, m�g ha mi k�zzel adjuk meg az nem

SELECT TO_CHAR(ADD_MONTHS(SYSDATE, -4*12 ),'YYYY.MM.DD') AS l�ssuk,
	TO_CHAR(SYSDATE -4*365,'YYYY.MM.DD') AS m�s_e FROM DUAL;

/*5. K�rdezz�k le a MINTA.IRODALOM t�bl�b�l az �r�k nev�t, 
sz�let�si �s hal�loz�si d�tum�t (teljesen ki�rva) �s k�tf�lek�ppen azt, 
hogy h�ny �vet �ltek. Az �vek sz�m�t 3 tizedesre kerek�tve �rjuk ki. */

SELECT * FROM minta.irodalom;

SELECT n�v, to_char(sz�let�si_id�,'yyyy.mm.dd') sz�let�s
, to_char(hal�l_ideje,'yyyy.mm.dd') hal�l
,round((hal�l_ideje-sz�let�si_id�)/365.25,3) kor1
,round(months_between(hal�l_ideje,sz�let�si_id�)/12,3) kor2 
from minta.irodalom;



-------------------------------------------------------------------------------
/*
Datetime f�ggv�nyek, amiket ismerni kell:
-	SYSDATE, SYSTIMESTAMP: ezekkel m�r dolgoztunk, nincs argumentumuk
-	ADD_MONTHS: ha az eredm�nyh�nap r�videbb, mint a kiindul� d�tum napja, akkor az adott h�nap utols� napj�t kapjuk. Csak eg�sz h�napokat lehet kivonni �s hozz�adni.
-	LAST_DAY: az adott d�tum h�napj�nak utols� napja
-	MONTHS_BETWEEN: k�t d�tum k�z�tt eltelt id� h�napokban, t�rth�napokat is eredm�ny�l ad. �letkor meghat�roz�s�ra a legbiztosabb m�dszer, a 365.25-tel val� oszt�s is csak k�zel�t� pontoss�g�, de ha a k�ztes h�napokat osztjuk 12-vel, az teljesen pontos (nincs igaz�n jelent�s�ge, ritk�n lehet sz�ks�g t�pontos �letkor meghat�roz�s�ra)
-	NEXT_DAY: csak a nyelvi be�ll�t�sok ismeret�ben m�k�dik, mert a h�t napj�t sz�vegesen kell megadni
-	TRUNC: lev�g�s az adott d�tumelemig (az adott id�szak els� napj�nak 0:00:00 idej�t adja vissza)
-	ROUND: az adott d�tumelemig lefel� vagy felfel� kerek�t.
*/

-- nyelvi be�ll�t�sokt�l er�sen f�gg, 
-- sysdate eredm�ny�t kell bem�solni az aposztrofok k�z�
-- kedd hely�re esetleg tuesday-t �rni

SELECT SYSDATE FROM dual;

SELECT NEXT_DAY('17-FEBR. -21','KEDD') "NEXT DAY"
FROM DUAL;


-- nyelvi be�ll�t�sokt�l er�sen f�gg, 
-- sysdate eredm�ny�t kell bem�solni az aposztrofok k�z�
-- b�rmilyen form�tumra lehet t�rdelni: http://docs.oracle.com/cd/B19306_01/server.102/b14200/functions230.htm#i1002084
-- lev�g�s
SELECT TRUNC(TO_DATE('17-FEBR. -21','DD-MON-YY'), 'YEAR') �vre, 
TRUNC(TO_DATE('17-FEBR. -21','DD-MON-YY'), 'Q') negyed�vre,
TRUNC(TO_DATE('17-FEBR. -21','DD-MON-YY')) alap�rtelmezett --napra
FROM DUAL;


-- nyelvi be�ll�t�sokt�l er�sen f�gg, 
-- sysdate eredm�ny�t kell bem�solni az aposztrofok k�z�
-- b�rmilyen form�tumra lehet t�rdelni: http://docs.oracle.com/cd/B19306_01/server.102/b14200/functions230.htm#i1002084
-- kerek�t�s
SELECT ROUND (TO_DATE ('2017-FEB-21'),'YEAR') felfele_kerekit�s,
       ROUND (TO_DATE ('2017-DEC-21'),'YEAR') lefele_kerekit�s 
FROM DUAL;
-------------------------------------------------------------------------------

/*6. N�zz�k meg a mintap�ld�kat �s fejts�k meg �ket!*/

-- el�fordul, hogy olyan karaktert kell haszn�lnunk valahol, amely �nmag�ban vez�rl�st seg�t
-- Az alap�rtelmezett �n. escape, azaz kiv�telkezel� karakter az aposztr�f ('), ami am�gy a sz�veghat�rol� elem is, merthogy egy norm�l sz�vegben kiz�r�lag ez, az aposztr�f zavarn� az Oracle-t
SELECT 'Jeanne d''Arc' AS Orleans_i_szuz 
FROM DUAL; -- Mi t�rt�nne, ha csak egy aposztr�f lenne a d ut�n?

-- sz�veg�sszef�z� oper�tor: ||
SELECT to_char(SYSDATE,'YYYY.MM.DD') Ma
, 'Ez az �v ' || TO_CHAR(SYSDATE,'DDD') || '. napja.' Nap
,	'Ez az �v ' || TO_CHAR(SYSDATE,'IW') || '. hete.'  H�t
,	'Ez az �v ' || TO_CHAR(SYSDATE,'Q') || '. negyed�ve.' Negyed�v
FROM DUAL;

/*
sz�vegf�ggv�nyek, amiket tudni kell fejb�l: 
- LENGTH: sz�veg hossz�t adja meg
- UPPER: a teljes sz�veget nagybetusre alak�tja
- LOWER: a teljes sz�veget kisbetusre alak�tja
- INITCAP: minden sz� elso betuj�t nagybetusre, a t�bbit kisbeture cser�li a sz�vegben
- SUBSTR: adott param�tereknek megfelelo sz�vegr�szletet adja vissza
- TRIM: adott karaktert lev�gja a sz�veg mindk�t oldal�r�l

sz�vegf�ggv�nyek, amiket tudni kell dokument�ci� seg�ts�g�vel: 
- LTRIM: adott karaktert lev�gja a sz�veg bal oldal�r�l
- RTRIM: adott karaktert lev�gja a sz�veg jobb oldal�r�l
- LPAD: adott sz�veget kieg�sz�t adott karakterrel adott hosszus�g�ra balr�l
- RPAD: adott sz�veget kieg�sz�t adott karakterrel adott hosszus�g�ra jobbr�l
- INSTR: adott sz�vegben megkeresi az adott kifejez�s n-edik elofordul�s�t a megadott poz�ci�t�l sz�m�tva
- REPLACE: adott sz�veget kicser�l egy m�sik megadott sz�vegre
*/

-- k�t sz�veg �sszef�z�se
SELECT CONCAT( 'Ez is', ' egy megold�s') �sszef�z2
FROM DUAL;

-- csak k�t param�tere lehet
SELECT CONCAT( '�s',' vajon',' ez is?') �sszef�z3
FROM DUAL;

--viszont egym�sba �gyazhat�
SELECT CONCAT( '�s', CONCAT(' vajon',' ez is?')) �sszef�z4
FROM DUAL;

-- kisbet�-nagybet� v�lt� f�ggv�nyek haszn�lat�nak jelent�s�g�r�l: eszt�tikai k�rd�s, m�sr�szt felt�tel megfogalmaz�sakor fontos, mert a sz�vegf�ggv�nyek case sensitivek
-- attrib�tum �r�sm�dj�t mindenk�ppen egys�ges�teni kell, pl. csupa kisbet�sre �s akkor a felt�tel m�sik fel�ben is csupa kisbet�snek kell lennie
-- a f�ggv�ny m�k�d�s�nek meg�rt�se miatt konstans sz�vegekre is haszn�ljuk ezeket a f�ggv�nyeket, de val�di lek�rdez�sekn�l ez ugye felelsleges, �rhatjuk eleve a k�v�nt �r�sm�ddal a sz�veget 
select 
 'kis NAGY' eredeti
,lower('kis NAGY') kicsi 
,upper('kis NAGY') nagy
,initcap('kis NAGY') sz�kezd�_nagy
,length('kis NAGY') sz�veg_hossz
from dual;

-- legt�bbhelyen m�k�d� bal, jobb, k�z�p f�ggv�nyek helyett oracle-ben SUBSTR van
-- ha a m�sodik param�ter negat�v, akkor h�tulr�l sz�molja a karatereket, �gy nem sz�ks�ges a LENGTH f�ggv�ny be�gyaz�sa
select 
 't�k�sm�kosr�tes' eredeti
,substr('t�k�sm�kosr�tes',1,5) eleje
,substr('t�k�sm�kosr�tes',6,5) k�zepe
,substr('t�k�sm�kosr�tes',-5,5) v�ge
from dual;

-- TRIM f�ggv�nynek csak az alapeset�t kell fejb�l tudni, amikor az elej�r�l meg a v�g�r�l a sz�k�z�ket szedi le
-- amikor k�t�jeleket kell leszedni, de azt el�g a dokument�ci�b�l tudni 
SELECT 
 '    lev�gva        ' eredeti
,trim('    lev�gva        ') AS megmi
,ltrim('    lev�gva        ') AS megmi3
,rtrim('    lev�gva        ') AS megmi4
FROM dual;

--instr(sz�veg amiben keres, keresett sz�veg, h�nyadik karaktert�l induljon a keres�s, h�nyadik el�fordul�s pozici�j�t adja vissza)
SELECT INSTR('Corporate Floor','or', 3, 2)
FROM dual;

--replace(melyik sz�vegben, mit, mire cser�ljen)
SELECT REPLACE('JACK and JUE','J','BL') "Csere"
     FROM DUAL;
 
 
-- lpad/rpad( milyen sz�veget, milyen hossz�s�g�ra eg�sz�tsen, milyen karakterekkel t�ltse fel az �res helyeket
-- lpad balr�l, rpad jobbr�l t�lti fel

select LPAD('sz�veg',15,'_'),
RPAD('sz�veg',15,'_')
FROM dual;

SELECT 
 '----lev�gva-------' eredeti
,trim('----lev�gva-------') AS megmi
,trim(both '-' from '----lev�gva-------') AS megmi2
FROM dual;

/*7. Fejts�k meg az al�bbi lek�rdez�seket. Mi t�rt�nik, 
ha a WHERE felt�tel konstans kifejez�st tartalmaz?*/

-- like ir�ny�tott oper�tor, a regul�ris kifejez�s csak a jobb oldalon �llhat
-- sz�mos sz�vegf�ggv�nynek van REGEXP alakja is (regexp_like)
-- like-n�l % helyettes�t ak�rh�ny karaktert, _ helyettes�t egyetlen karaktert
-- csak akkor haszn�ljuk a like-ot, ha t�nyleg mint�t akarunk illeszteni, k�l�nben el�g lesz az = is
-- where felt�tel konstans kifejez�st tartalmaz, akkor is el tudjuk d�nteni, hogy igaz vagy hamis
-- ha igaz, akkor a dual t�bl�b�l megkapjuk egyszer a szelektlist�ban szerepl� �rt�ket
-- ha hamis, akkor 0 sort kapunk eredm�ny�l

SELECT 'Lefutott' AS megmi FROM DUAL 
WHERE 'Okostoj�s' LIKE '%kos%';

SELECT 'Lefutott' AS megmi FROM DUAL 
WHERE 'Okostoj�s' NOT LIKE '%kos%';

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE 'Okostoj�s' LIKE 'okos%'; --kis nagy bet� elt�r

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE 'Okostoj�s' LIKE '_kos%';

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE lower('Okostoj�s') LIKE 'okos%';

/*8. K�rdezz�k le a minta s�ma dolgozo t�bl�j�b�l azokat, akiknek 
a nev�b�l kider�l, hogy feles�gek! Rendezz�k n�vsorba!*/

SELECT id, vnev, knev FROM minta.dolgozo
WHERE vnev LIKE '%n�'
or knev like '%n�'
order by 2,3;

/*vajon �gy is j�?*/
-- sz�vegf�ggv�nyek case sensitivek
SELECT id, vnev, knev FROM minta.dolgozo
WHERE vnev LIKE '%N�'
or knev like '%N�'
order by 2,3;

/*ha biztosra szeretn�nk menni:*/
--minden sort kisbet�sre alak�tunk
SELECT id, vnev, knev FROM minta.dolgozo
WHERE lower(vnev) LIKE '%n�'
or lower(knev) like '%n�'
order by 2,3;

/*9. K�rdezz�k le ugyanazt, mint az el�bb, 
de egys�ges �r�sm�ddal irassuk ki a neveket! Rendezz�k n�vsorba!*/

SELECT id
,initcap(vnev) vnev
,initcap(knev) knev FROM minta.dolgozo
WHERE lower(vnev) LIKE '%n�'
or lower(knev) like '%n�'
order by 2,3;

/*10. K�rdezz�k le a minta s�ma dolgozo 
t�bl�j�b�l az A �s � kezd�bet�s keresztnev� dolgoz�kat! */

select id, vnev, knev
from minta.dolgozo
where upper(knev) like 'A%'
or upper(knev) like '�%';

/*11. K�rdezz�k le a minta s�ma dolgozo t�bl�j�b�l a Tiborokat!*/
select id, vnev, knev
from minta.dolgozo
where upper(knev) like 'TIBOR%'
;

--AJJAJ!

select id, vnev, knev
from minta.dolgozo
where upper(knev) = 'TIBOR';

/*12. K�rdezz�k le a minta s�ma dolgozo t�bl�j�b�l a dolgoz�k nev�t 
�sszef�zve �s kieg�sz�tve 20 karakterre _ karakterekkel!*/

select id, rpad(vnev||' '||knev,20,'_') n�v 
from minta.dolgozo
order by 1;

/******************/
/*�N�LL� FELADATOK*/
/******************/

/*1.	Hozzuk l�tre az ORSZAGADATOK t�bl�t a MINTA s�ma t�bl�j�nak m�sol�s�val. 
A tov�bbi feladatok egy r�sze erre fog vonatkozni.*/

/*2.	�rjuk ki az orsz�gok neveinek hossz�t!*/

/*3.	�rjunk lek�rdez�st, amely az orsz�gok neveinek csak 
a kezd�bet�j�t hagyja meg nagybet�nek, a t�bbi kisbet�s legyen!*/

/*4.	List�zzuk ki a v�lt�p�nzek neveit � az ott l�v� sz�mok n�lk�l!*/

/*5.	List�zzuk ki az eur�pai orsz�gokat! 
(LIKE oper�tor haszn�lat�val!)*/

/*6.	K�rdezz�k le az ALL_TABLES katal�gust�bl�b�l 
azokat a kurzusr�sztvev�ket, akiknek van �RFOLYAM t�bl�juk 
(tal�ljuk meg azokat is, akik az els� bet�t m�shogy �rt�k)! */

/*7.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l azokat a c�geket, 
ahol a c�gn�vben szerepel a a buda sz�r�szlet!*/

/*8.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l azokat 
a nem budapesti c�geket, akiknek a nev�ben szerepel a buda sz�r�szlet!*/

/*9.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l 
a r�szv�nyt�rsas�gokat! 
Vigy�zat, a Zrt-k �s Nyrt-k kellenek, de azok a c�gek ne 
ker�ljenek bele a lek�rdez�sbe, amelyeknek a nev�ben 
v�letlen�l van benne az rt bet�p�ros!*/

/*10.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l azokat 
a c�geket, amelyeknek a nev�ben szerepel a magyar, vagy Hungary 
megjel�l�s �s ebben az �vezredben alap�tott�k �ket!*/

/*11.	K�rdezz�k le a MINTA s�ma C�GEK2 t�bl�j�b�l a c�gek adatait 
�s azt, hogy id�n mikor lesz az �zleti �v v�ge!*/

/*12.	List�zzuk ki a MINTA s�ma ALKALMAZOTT t�bl�j�b�l 
a neveket k�t�jelek k�z�tt �gy, 
hogy a keletkez� sz�veg hossza 32 karakter legyen, 
�s pont k�z�pen van a n�v! 
P�ld�ul: �Gipsz Jakab�-b�l legyen: 
�----------Gipsz Jakab----------� (az id�z�jelek n�lk�l)!*/

/*13. K�rdezz�k le a MINTA s�ma IRODALOM t�bl�j�b�l
a neveket sz�tbontva vezet�k �s keresztn�vre!*/

/*14.	Sz�moljuk ki helyesen az SQL seg�ts�g�vel, 
�vt�l f�ggetlen�l azt az id�pontot, amikor az �ra�t�ll�t�st 
el kell v�gezni, �ra pontoss�ggal. (M�rcius �s okt�ber utols� 
szombatj�n, 2h-kor, illetve 3h-kor kell �t�ll�tani az �r�t.*/

