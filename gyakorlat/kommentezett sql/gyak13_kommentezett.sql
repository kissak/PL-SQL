/*1. K�rdezz�k le a dolgoz�k sz�m�t az mdolgozo t�bl�b�l!*/
--csoportf�ggv�ny - 1 rekord
SELECT count(*) AS fo FROM mdolgozo;

--analitikus f�ggv�ny - �sszes rekord, mivel nincs m�veleti t�r,
--az eg�sz t�bla egyetlen part�ci�, az eredm�ny ugyanaz

SELECT count(*) OVER () AS f�
FROM mdolgozo;

-- 62x ki�rja, nem ez�rt fontos �s j� nek�nk
--ism�tl�d�s elt�vol�t�sa
SELECT DISTINCT count(*) AS fo
FROM dolgozo;

/*2. K�rdezz�k le, hogy az egyes keresztnevek 
h�nyszor fordulnak el� az mdolgozo t�bl�ban!*/

-- csoportf�ggv�ny m�k�d�se, az eredm�ny 51 rekord
SELECT knev, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;


-- analitikus f�ggv�ny m�k�d�se, az eredm�ny 62 rekord
SELECT knev, COUNT(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo
ORDER BY 1;

--3* ki�rja Ad�lt
-- az ism�tl�d� sorok sz�r�s�vel, 51 rekord
SELECT DISTINCT knev AS keresztnev, 
count(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo 
ORDER BY 1;

/*3. K�rdezz�k le az mdolgozo t�bla adatait, �rjuk ki azt is, 
hogy h�ny dolgoz�nak azonos a keresztneve!*/

-- analitikus f�ggv�nnyel (alkalmaz�sa ilyen feladatra egyszer�bb, mint a group by)
-- sokkal kevesebb er�forr�st ig�nyel ilyen m�don megoldani a feladatot
-- meg van a 62 db rekoddunk �s az aggreg�lt �rt�kek is
SELECT mdolgozo.*, 
COUNT(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo
ORDER BY 1;

-- aggreg�l� f�ggv�nnyel l�nyegesen bonyolultabb
SELECT id,vnev,knev,szuldat,nem,felv_nap,knev_elofordulas FROM
mdolgozo JOIN
(SELECT knev, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev) 
USING(knev)
ORDER BY 1;

--egy eddig ismeretlen aggreg�l� f�ggv�ny a csoportban szerepl� egyedek
--ki�r�s�ra: LISTAGG, de �gy is csak 51 rekord
--LISTAGG: adott csoportban lev� rekodokb�l a kiv�lasztott mez�t ; jellel elv�lasztva egym�s mell� �rja
SELECT 
listagg(vnev,';') WITHIN GROUP (ORDER BY ID) AS vnev
, knev
, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;

-- t�bb adatot �sszef�z�ssel tudn�nk ki�rni, de �gy is csak 51 rekord
-- Ad�lok egy sorba ker�ln�nek
SELECT 
listagg('ID:'||to_char(ID,'00')||' N�v: '||vnev||' '||knev
||' Sz�ldat: '||to_char(szuldat,'yyyy.mm.dd')
||' Nem: '||nem
||' Felvnap: '||to_char(felv_nap,'yyyy.mm.dd'),';') 
WITHIN GROUP (ORDER BY ID) AS dolgozo_adatok
, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;

/*4. K�rdezz�k le a dolgoz�k adatait �s mindenki mell� 
�rjuk ki az �letkor�t a felv�telkor,
�s az el�tte felvett 5 dolgoz� �letkor�nak �tlag�t!*/
--mozg� ablakol�s� fv (fix hossz�s�g�)

--�tlagok n�lk�l
SELECT mdolgozo.*, 
round(months_between(felv_nap,szuldat)/12,1) AS kor
FROM mdolgozo
ORDER BY felv_nap;

--analitikus fv kiz�r�lag a selectbe lehet betenni
--feldolgoz�s sorrendje: join, where, group by, having, select (analitikus) order by
--el�z� 5 �tlag�val
--ha nincs part�ci� megadva, akkor az �sszes rekord a part�ci�
--over ut�n kell megadni az ablakot (mindig kell sorbarendez�s)
--erre az ablakra sz�molja majd a megfelel� �rt�kekeket
--mindig az aktu�lis sort�l kell n�zni
--5 legkor�bban felvettn�l m�g nincs adat
--avg-t�l a preceding tart az anal�tikus fv
SELECT mdolgozo.*
,round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING),1) as elozo_5
FROM mdolgozo
ORDER BY felv_nap;

--b�rmilyen sorrendben ki�rhatom (order by), elt�rhet a k�t sorbarendez�s:
SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING),1) as elozo_5
FROM mdolgozo
ORDER BY ID;

/*5. Az el�z� megold�s m�dos�t�s�val k�rdezz�k le 
a dolgoz�k adatait �s mindenki mell� �rjuk ki 
az �letkor�t a felv�telkor,
�s a legut�bb felvett 5 dolgoz� �letkor�nak �tlag�t 
(belesz�m�tva az �ppen most felvettet is)!*/

--Good Henrikn�l az�rt nem lesz most NUll, mert �gy m�r belesz�m�tja a saj�tj�t is
SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND 0 PRECEDING),1) as utolso_5
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),1) AS utolso_5_ugyanaz
FROM mdolgozo
ORDER BY felv_nap;

/*6. Az el�z� feladatot kieg�sz�tve k�rdezz�k le 
az ut�bbi egy �vben 
felvett dolgoz�k �letkor�nak �tlag�t*/

-- rows darabsz�mot ad meg
-- range nem mindig ugyanannyi darabot ad vissza
-- ami szerint sorba rendeztem, aszerint tolja el
-- szinkronban kell lenni a rendez�s �s az atol�s t�pus�nak
SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),1) AS utolso_5
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap RANGE BETWEEN 365 PRECEDING AND CURRENT ROW),1) AS egy_even_belul
FROM mdolgozo
ORDER BY felv_nap;

/*7. K�rdezz�k le a c�g dolgoz�inak �tlag�letkor�t azokon a napokon, amikor 
�j dolgoz� ker�lt a c�ghez (t�telezz�k fel, hogy senki nem t�vozott menet
k�zben a c�gt�l)!*/

-- kumul�lt sz�m�t�s, v�ltoz� m�ret� ablak (unboundeddal kezd�dik vagy v�gz�dik)
-- elt�r�s a 19. sorban van, az egy napon felvett k�t dolgoz� miatt
-- rows alapj�n valahogy sorba rendezte �s csak az egyiket vette bele
-- range alapj�n mindkett�t beleveszi
-- megel�z� sorokat vagy id�szakot akarunk? ezen m�lik melyiket haszn�ljuk

SELECT mdolgozo.*
,round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap rows BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),1) AS ez_nem_jo
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap RANGE BETWEEN unbounded PRECEDING AND CURRENT ROW),1) AS halmozott_atlagkor
FROM mdolgozo
ORDER BY felv_nap;

/*8. K�rdezz�k le a dolgoz�k �letkor szerinti ragnsor�t!*/

--elt�r�s a 7. sorban van (egyszerre lettek felv�ve), az egyenl�s�g ut�ni sorsz�m kioszt�s�ban
-- azonos ut�ni ut�n van az elt�r�s, kiosztja a hatost a k�t �t�s ut�n vagy nem? ez a k�rd�s
SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor,
DENSE_RANK() OVER (ORDER BY szuldat) AS suru_rangsor
FROM mdolgozo
ORDER BY szuldat;


/*9. K�rdezz�k le a nemenk�nti rangsort is!*/

--part�ci� b�rmikor lehet
--rangsorol�sn�l nincs ablak, csak sorbarendez�s
--f�rfiak el�re ker�ltek (0-s nem k�d)
--ha van part�ci�, akkorpart�ci�nk�nt sz�molja a rangsort

SELECT mdolgozo.*, rank() OVER (PARTITION BY nem ORDER BY szuldat) AS rangsor,
DENSE_RANK() OVER (PARTITION BY nem ORDER BY szuldat) AS suru_rangsor
FROM mdolgozo
order by rangsor;
--ORDER BY nem,szuldat
;

/*10. �rjuk ki a 10 legid�sebb dolgoz� adatait!*/

SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor
FROM mdolgozo;

--k�nytelenek vagyunk be�gyazni a lek�rdez�st
--�sszes sor sz�ma 6 lesz, ha 5-re r�ll�tjuk a rangsort
select * from
(SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor
FROM mdolgozo)
where rangsor<=10;

/*11. K�rdezz�k le, hogy az egyes dolgoz�k felv�tele 
el�tt utolj�ra f�rfit vagy n�t vett�nk-e fel!*/

--lag(el�z�)/lead(k�vetkez�) fv-ek, 
--k�l�nb�z� rekordok �rt�keit hozzuk egym�s mell�
--els� emberel�tt nincs senki
select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS ELOZO_nem
from mdolgozo
order by felv_nap;

select mdolgozo.*
, lag(decode(nem,0,'F�rfi','N�'),1) over (order by felv_nap) AS ELOZO_nem
from mdolgozo
order by felv_nap;

/*12. K�rdezz�k le azokat a dolgoz�kat, akik felv�telekor 
az el�z� k�t felvett dolgoz� is f�rfi volt!*/

--rank �s dense_rank-nek nincs param�tere
-- where felt�telt csak akkor tudok r� �rni, hogy egy egy szinttel beljebb lev� where-ben  van
select * from
(select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS nem_elozo1
, lag(nem,2) over (order by felv_nap) AS nem_elozo2
from mdolgozo)
where nem_elozo1=0 and nem_elozo2=0
order by felv_nap;

--ha 3 f�rfi  van egym�s ut�n a a rankb�l l�tsz�dik a halmoz�s
select * from
(select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS nem_elozo1
, lag(nem,2) over (order by felv_nap) AS nem_elozo2
, rank() over (order by felv_nap) as sorrend
from mdolgozo)
where nem_elozo1=0 and nem_elozo2=0
order by felv_nap;

/*13. Kor alapj�n osszuk a dolgoz�kat 4 azonos tagsz�m� csoportba, 
k�rdezz�k le, hogy ki h�nyadik csoportba ker�lt!*/

-- statisztikai fv-ek
-- ntile azonos darabsz�m�, with_bucket azonos tartom�ny� csoportokat csin�l
select mdolgozo.*, ntile(4) over (order by szuldat) as csoport
from mdolgozo;

/*14. Az el�z� feladatban h�nyan ker�ltek az egyes csoportokba?*/
select csoport,count(*)
from
(select ntile(4) over (order by szuldat) as csoport
from mdolgozo)
group by csoport;

/*15. K�rdezz�k le a dolgoz�k k�z�l a legfiatalabb egy negyedet!*/
select * from
(select mdolgozo.*, ntile(4) over (order by szuldat) as csoport
from mdolgozo)
where csoport=4
;

/*16. K�rdezz�k le a dolgoz�k koreloszl�s�t, osszuk �ket a koruk alapj�n 4
csoportra! A 20 �v alattiak �s a 60 �v felettiek legyenek a marad�k!*/

-- azonos sz�less�g� csoportok
-- aki kil�g annak egy �j csoportbe ker�l l�trehoz�sra a n�gyen fel�l (0 �s 5-�s csoport)
select mdolgozo.*,
round(months_between(sysdate,szuldat)/12,1) kor
,width_bucket(round(months_between(sysdate,szuldat)/12,1),27,60,4) --20 �s 60 k�z�tt 4 r�szre
as csoport
from mdolgozo
order by csoport;

/*17. Az el�z� lek�rdez�sb�l kiindulva sz�m�tsuk ki, hogy h�ny dolgoz� ker�lt
az egyes csoportokba!*/

--csoportokat k�pz�nk group by alapj�n
select 
width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
as csoport
,count(*)
from mdolgozo
group by width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
order by csoport;
