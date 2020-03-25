/*1. K�rdezz�k le a dolgoz�k sz�m�t az mdolgozo t�bl�b�l!*/
--csoportf�ggv�ny - 1 rekord
SELECT count(*) AS f� FROM mdolgozo;

--analitikus f�ggv�ny - �sszes rekord, mivel nincs m�veleti t�r,
--az eg�sz t�bla egyetlen part�ci�, az eredm�ny ugyanaz

SELECT count(*) OVER () AS f�
FROM mdolgozo;

--ism�tl�d�s elt�vol�t�sa
SELECT DISTINCT count(*) over() AS f�
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

-- az ism�tl�d� sorok sz�r�s�vel, 51 rekord
SELECT DISTINCT knev AS keresztnev, 
count(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo 
ORDER BY 1;

/*3. K�rdezz�k le az mdolgozo t�bla adatait, �rjuk ki azt is, 
hogy h�ny dolgoz�nak azonos a keresztneve!*/

-- analitikus f�ggv�nnyel
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
SELECT 
listagg(vnev,';') WITHIN GROUP (ORDER BY ID) AS vnev
, knev
, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;

-- t�bb adatot �sszef�z�ssel tudn�nk ki�rni, de �gy is csak 51 rekord
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

--�tlagok n�lk�l
SELECT mdolgozo.*, 
round(months_between(felv_nap,szuldat)/12,1) AS kor
FROM mdolgozo
ORDER BY felv_nap;

--el�z� 5 �tlag�val
SELECT mdolgozo.*
,round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING),1) as elozo_5
FROM mdolgozo
ORDER BY felv_nap;

--b�rmilyen sorrendben ki�rhatom, elt�rhet a k�t sorbarendez�s:
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

SELECT mdolgozo.*
,round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap rows BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),1) AS ez_nem_jo
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap RANGE BETWEEN unbounded PRECEDING AND CURRENT ROW),1) AS halmozott_atlagkor
FROM mdolgozo
ORDER BY felv_nap;
--elt�r�s a 19. sorban van, az egy napon felvett k�t dolgoz� miatt

/*8. K�rdezz�k le a dolgoz�k �letkor szerinti ragnsor�t!*/
SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor,
DENSE_RANK() OVER (ORDER BY szuldat) AS suru_rangsor
FROM mdolgozo
ORDER BY szuldat;
--elt�r�s a 7. sorban van, az egyenl�s�g ut�ni sorsz�m kioszt�s�ban

/*9. K�rdezz�k le a nemenk�nti rangsort is!*/
SELECT mdolgozo.*, rank() OVER (PARTITION BY nem ORDER BY szuldat) AS rangsor,
DENSE_RANK() OVER (PARTITION BY nem ORDER BY szuldat) AS suru_rangsor
FROM mdolgozo
order by rangsor;
--ORDER BY nem,szuldat
;

/*10. �rjuk ki a 10 legid�sebb dolgoz� adatait!*/

SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor
FROM mdolgozo;

select * from
(SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor
FROM mdolgozo)
where rangsor<=10;

/*11. K�rdezz�k le, hogy az egyes dolgoz�k felv�tele 
el�tt utolj�ra f�rfit vagy n�t vett�nk-e fel!*/

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

select * from
(select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS nem_elozo1
, lag(nem,2) over (order by felv_nap) AS nem_elozo2
from mdolgozo)
where nem_elozo1=0 and nem_elozo2=0
order by felv_nap;

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

select mdolgozo.*
,width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
as csoport
from mdolgozo
order by csoport;

/*17. Az el�z� lek�rdez�sb�l kiindulva sz�m�tsuk ki, hogy h�ny dolgoz� ker�lt
az egyes csoportokba!*/

select 
width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
as csoport
,count(*)
from mdolgozo
group by width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
order by csoport;

/*******************/
/*�n�ll� feladatok:*/
/*******************/

/*1. K�rdezz�k le az mkolcsonzes t�bl�b�l az �sszes k�lcs�nz�st 
�s azt is, hogy az adott fimet h�nyszor k�lcs�n�zt�k ki, illetve 
�sszesen h�ny napra*/

/*2. K�rdezz�k le az mkolcsonzes t�bl�b�l az �sszes k�lcs�nz�st
�s azt, hogy az adott k�lcs�nz� �tlagosan h�ny napra szokott
k�lcs�n�zni. Egy k�l�n oszlopba �rjuk ki, hogy "�tlagosn�l hosszabb",
ha az adott k�lcs�nz� �tlag�n�l hosszabb id�re k�lcs�n�zte ki 
az adott filmet!*/

/*3. List�zzuk ki az mkolcsonzes t�bla teljes tartalm�t sorsz�m szerinti
sorrendben �s sz�m�tsunk a napok sz�m�b�l mozg� �tlagot. A mozg��tlagot
a megel�z� 4 k�lcs�nz�sb�l �s az aktu�lis k�lcs�nz�sb�l sz�m�tsuk!*/

/*4. Az mkolcsonzes t�bl�b�l sz�m�tsuk ki a halmozott napsz�mot 
k�lcs�nz�nk�nt sorsz�m szerinti sorrendben!*/

/*5. �rjuk ki az mdvd t�bl�b�l a 10 legmagasabb pontsz�m� filmet! 
(Vigy�zzanak a null �rt�kekkel!)*/

/*6. �rjuk ki a k�lcs�nz�k nev�t �s hogy h�ny alkalommal k�lcs�n�ztek
ki filmet. Sz�moljuk ki, hogy mennyi a k�lcs�nz�sek �tlag sz�ma nemenk�nt
�s �rjuk a k�lcs�nz�k mell�, hogy �k a nem�k �tlag�hoz k�pest mennyivel 
t�bbsz�r vagy kevesebbszer k�lcs�n�ztek ki filmet.*/

/*7. Volt-e olyan eset, amikor k�tszre egym�s ut�n ugyanazt a filmet vitt�k
ki! List�zzuk ki a k�t egym�s ut�ni k�lcs�nz�s sorsz�m�t �s a film c�m�t!*/

/*8. Volt-e olyan eset, amikor egy k�lcs�nz� k�tszer egym�s ut�n
ugyanazt a filmet vitte ki? Ki �s melyik filmet vitte ki egym�s ut�n k�tszer?*/

/*9. Osszuk a filmeket a keletkez�s �ve alapj�n 10 egyenl� csoportra!*/

/*10. �rassuk ki a legr�gebbi 10%-ba tartoz� filmek adatait!*/

/*11. K�sz�ts�nk hisztogramot a filmekr�l a keletkez�s �ve alapj�n! 
1930 �s 2000 k�z�tt tizes oszt�lyk�zzel! Azt �rjuk ki, hogy az egyes
csoportokba h�ny film ker�lt!*/

