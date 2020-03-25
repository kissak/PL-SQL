/*1. Kérdezzük le a dolgozók számát az mdolgozo táblából!*/
--csoportfüggvény - 1 rekord
SELECT count(*) AS fo FROM mdolgozo;

--analitikus függvény - összes rekord, mivel nincs mûveleti tér,
--az egész tábla egyetlen partíció, az eredmény ugyanaz

SELECT count(*) OVER () AS fõ
FROM mdolgozo;

-- 62x kiírja, nem ezért fontos és jó nekünk
--ismétlõdés eltávolítása
SELECT DISTINCT count(*) AS fo
FROM dolgozo;

/*2. Kérdezzük le, hogy az egyes keresztnevek 
hányszor fordulnak elõ az mdolgozo táblában!*/

-- csoportfüggvény mûködése, az eredmény 51 rekord
SELECT knev, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;


-- analitikus függvény mûködése, az eredmény 62 rekord
SELECT knev, COUNT(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo
ORDER BY 1;

--3* kiírja Adélt
-- az ismétlõdõ sorok szûrésével, 51 rekord
SELECT DISTINCT knev AS keresztnev, 
count(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo 
ORDER BY 1;

/*3. Kérdezzük le az mdolgozo tábla adatait, írjuk ki azt is, 
hogy hány dolgozónak azonos a keresztneve!*/

-- analitikus függvénnyel (alkalmazása ilyen feladatra egyszerûbb, mint a group by)
-- sokkal kevesebb erõforrást igényel ilyen módon megoldani a feladatot
-- meg van a 62 db rekoddunk és az aggregált értékek is
SELECT mdolgozo.*, 
COUNT(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo
ORDER BY 1;

-- aggregáló függvénnyel lényegesen bonyolultabb
SELECT id,vnev,knev,szuldat,nem,felv_nap,knev_elofordulas FROM
mdolgozo JOIN
(SELECT knev, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev) 
USING(knev)
ORDER BY 1;

--egy eddig ismeretlen aggregáló függvény a csoportban szereplõ egyedek
--kiírására: LISTAGG, de így is csak 51 rekord
--LISTAGG: adott csoportban levõ rekodokból a kiválasztott mezõt ; jellel elválasztva egymás mellé írja
SELECT 
listagg(vnev,';') WITHIN GROUP (ORDER BY ID) AS vnev
, knev
, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;

-- több adatot összefûzéssel tudnánk kiírni, de így is csak 51 rekord
-- Adélok egy sorba kerülnének
SELECT 
listagg('ID:'||to_char(ID,'00')||' Név: '||vnev||' '||knev
||' Szüldat: '||to_char(szuldat,'yyyy.mm.dd')
||' Nem: '||nem
||' Felvnap: '||to_char(felv_nap,'yyyy.mm.dd'),';') 
WITHIN GROUP (ORDER BY ID) AS dolgozo_adatok
, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;

/*4. Kérdezzük le a dolgozók adatait és mindenki mellé 
írjuk ki az életkorát a felvételkor,
és az elõtte felvett 5 dolgozó életkorának átlagát!*/
--mozgó ablakolású fv (fix hosszúságú)

--átlagok nélkül
SELECT mdolgozo.*, 
round(months_between(felv_nap,szuldat)/12,1) AS kor
FROM mdolgozo
ORDER BY felv_nap;

--analitikus fv kizárólag a selectbe lehet betenni
--feldolgozás sorrendje: join, where, group by, having, select (analitikus) order by
--elõzõ 5 átlagával
--ha nincs partíció megadva, akkor az összes rekord a partíció
--over után kell megadni az ablakot (mindig kell sorbarendezés)
--erre az ablakra számolja majd a megfelelõ értékekeket
--mindig az aktuális sortól kell nézni
--5 legkorábban felvettnél még nincs adat
--avg-tõl a preceding tart az analítikus fv
SELECT mdolgozo.*
,round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING),1) as elozo_5
FROM mdolgozo
ORDER BY felv_nap;

--bármilyen sorrendben kiírhatom (order by), eltérhet a két sorbarendezés:
SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING),1) as elozo_5
FROM mdolgozo
ORDER BY ID;

/*5. Az elõzõ megoldás módosításával kérdezzük le 
a dolgozók adatait és mindenki mellé írjuk ki 
az életkorát a felvételkor,
és a legutóbb felvett 5 dolgozó életkorának átlagát 
(beleszámítva az éppen most felvettet is)!*/

--Good Henriknél azért nem lesz most NUll, mert így már beleszámítja a sajátját is
SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND 0 PRECEDING),1) as utolso_5
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),1) AS utolso_5_ugyanaz
FROM mdolgozo
ORDER BY felv_nap;

/*6. Az elõzõ feladatot kiegészítve kérdezzük le 
az utóbbi egy évben 
felvett dolgozók életkorának átlagát*/

-- rows darabszámot ad meg
-- range nem mindig ugyanannyi darabot ad vissza
-- ami szerint sorba rendeztem, aszerint tolja el
-- szinkronban kell lenni a rendezés és az atolás típusának
SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),1) AS utolso_5
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap RANGE BETWEEN 365 PRECEDING AND CURRENT ROW),1) AS egy_even_belul
FROM mdolgozo
ORDER BY felv_nap;

/*7. Kérdezzük le a cég dolgozóinak átlagéletkorát azokon a napokon, amikor 
új dolgozó került a céghez (tételezzük fel, hogy senki nem távozott menet
közben a cégtõl)!*/

-- kumulált számítás, változó méretû ablak (unboundeddal kezdõdik vagy végzõdik)
-- eltérés a 19. sorban van, az egy napon felvett két dolgozó miatt
-- rows alapján valahogy sorba rendezte és csak az egyiket vette bele
-- range alapján mindkettõt beleveszi
-- megelõzõ sorokat vagy idõszakot akarunk? ezen múlik melyiket használjuk

SELECT mdolgozo.*
,round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap rows BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),1) AS ez_nem_jo
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap RANGE BETWEEN unbounded PRECEDING AND CURRENT ROW),1) AS halmozott_atlagkor
FROM mdolgozo
ORDER BY felv_nap;

/*8. Kérdezzük le a dolgozók életkor szerinti ragnsorát!*/

--eltérés a 7. sorban van (egyszerre lettek felvéve), az egyenlõség utáni sorszám kiosztásában
-- azonos utáni után van az eltérés, kiosztja a hatost a két ötös után vagy nem? ez a kérdés
SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor,
DENSE_RANK() OVER (ORDER BY szuldat) AS suru_rangsor
FROM mdolgozo
ORDER BY szuldat;


/*9. Kérdezzük le a nemenkénti rangsort is!*/

--partíció bármikor lehet
--rangsorolásnál nincs ablak, csak sorbarendezés
--férfiak elõre kerültek (0-s nem kód)
--ha van partíció, akkorpartíciónként számolja a rangsort

SELECT mdolgozo.*, rank() OVER (PARTITION BY nem ORDER BY szuldat) AS rangsor,
DENSE_RANK() OVER (PARTITION BY nem ORDER BY szuldat) AS suru_rangsor
FROM mdolgozo
order by rangsor;
--ORDER BY nem,szuldat
;

/*10. Írjuk ki a 10 legidõsebb dolgozó adatait!*/

SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor
FROM mdolgozo;

--kénytelenek vagyunk beágyazni a lekérdezést
--összes sor száma 6 lesz, ha 5-re rállítjuk a rangsort
select * from
(SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor
FROM mdolgozo)
where rangsor<=10;

/*11. Kérdezzük le, hogy az egyes dolgozók felvétele 
elõtt utoljára férfit vagy nõt vettünk-e fel!*/

--lag(elõzõ)/lead(következõ) fv-ek, 
--különbözõ rekordok értékeit hozzuk egymás mellé
--elsõ emberelõtt nincs senki
select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS ELOZO_nem
from mdolgozo
order by felv_nap;

select mdolgozo.*
, lag(decode(nem,0,'Férfi','Nõ'),1) over (order by felv_nap) AS ELOZO_nem
from mdolgozo
order by felv_nap;

/*12. Kérdezzük le azokat a dolgozókat, akik felvételekor 
az elõzõ két felvett dolgozó is férfi volt!*/

--rank és dense_rank-nek nincs paramétere
-- where feltételt csak akkor tudok rá írni, hogy egy egy szinttel beljebb levõ where-ben  van
select * from
(select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS nem_elozo1
, lag(nem,2) over (order by felv_nap) AS nem_elozo2
from mdolgozo)
where nem_elozo1=0 and nem_elozo2=0
order by felv_nap;

--ha 3 férfi  van egymás után a a rankbõl látszódik a halmozás
select * from
(select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS nem_elozo1
, lag(nem,2) over (order by felv_nap) AS nem_elozo2
, rank() over (order by felv_nap) as sorrend
from mdolgozo)
where nem_elozo1=0 and nem_elozo2=0
order by felv_nap;

/*13. Kor alapján osszuk a dolgozókat 4 azonos tagszámú csoportba, 
kérdezzük le, hogy ki hányadik csoportba került!*/

-- statisztikai fv-ek
-- ntile azonos darabszámú, with_bucket azonos tartományú csoportokat csinál
select mdolgozo.*, ntile(4) over (order by szuldat) as csoport
from mdolgozo;

/*14. Az elõzõ feladatban hányan kerültek az egyes csoportokba?*/
select csoport,count(*)
from
(select ntile(4) over (order by szuldat) as csoport
from mdolgozo)
group by csoport;

/*15. Kérdezzük le a dolgozók közül a legfiatalabb egy negyedet!*/
select * from
(select mdolgozo.*, ntile(4) over (order by szuldat) as csoport
from mdolgozo)
where csoport=4
;

/*16. Kérdezzük le a dolgozók koreloszlását, osszuk õket a koruk alapján 4
csoportra! A 20 év alattiak és a 60 év felettiek legyenek a maradék!*/

-- azonos szélességû csoportok
-- aki kilóg annak egy új csoportbe kerül létrehozásra a négyen felül (0 és 5-ös csoport)
select mdolgozo.*,
round(months_between(sysdate,szuldat)/12,1) kor
,width_bucket(round(months_between(sysdate,szuldat)/12,1),27,60,4) --20 és 60 között 4 részre
as csoport
from mdolgozo
order by csoport;

/*17. Az elõzõ lekérdezésbõl kiindulva számítsuk ki, hogy hány dolgozó került
az egyes csoportokba!*/

--csoportokat képzünk group by alapján
select 
width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
as csoport
,count(*)
from mdolgozo
group by width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
order by csoport;
