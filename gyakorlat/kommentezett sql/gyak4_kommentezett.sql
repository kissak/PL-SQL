/*1. Kérdezzük le az Oracle-ben tárolható legkisebb és legnagyobb dátumot!*/

/*
Julián naptárszámítás
napok sorszámok „az idõk kezdetétõl” és a napon belül az idõt törtszámokkal tároljuk, pl. 0.5 az pont 12:00

1 = -4712
5373484 = 9999
mert: 4712 * 365 (-4712-tõl 0-ig) + 9999 * 365 (0-tól 9999-ig) ~ 5373484
szökõévek nem lettek figyelembe véve,azért nem teljesen pontos
9999.dec.30 = -4712.jan.01 + 5373484 (napban)
*/

SELECT 
to_char(to_date(1,'J'),'BC YYYY.MM.DD') elsõ_nap --Oracle idószámítás kezdete
,to_char(to_date(5373484,'J'),'BC YYYY.MM.DD') utolsó_nap  --Oracle idószámítás vége
FROM dual;

/*2. Kérdezzük le, hogy milyen nap van ma, mi volt tegnap és mi lesz holnap!*/

-- dátumokkal különbözõ mûveleteket is tudunk végezni. Pl. kivonni õket egymásból, számértéket hozzáadni
-- osztásnak és a szorzásnak nincs értelme illetve két dátumot sem tudunk összeadni, így ezek a mûveletek nem is alkalmazhatóak

SELECT
to_char(sysdate,'day') ma
,to_char(SYSDATE -1,'day') tegnap
,to_char(sysdate +1,'day') holnap
FROM DUAL;

/*3. Kérdezzük le, hogy az aktuális hónap utolsó napja milyen napra esik.*/

-- http://docs.oracle.com/cd/B19306_01/server.102/b14200/functions001.htm  Datetime functions

select to_char(last_day(sysdate),'day') UTOLSÓ from dual;

/*4. Kérdezzük le kétféleképpen, hogy mi volt a dátum 4 évvel ezelõtt 
(a közbeesõ szökõév figyelembe vételével és anélkül).*/

--Oracle tudja, hogy mikor van szökõév, ezért az add_months azt figyelembe veszi, míg ha mi kézzel adjuk meg az nem

SELECT TO_CHAR(ADD_MONTHS(SYSDATE, -4*12 ),'YYYY.MM.DD') AS lássuk,
	TO_CHAR(SYSDATE -4*365,'YYYY.MM.DD') AS más_e FROM DUAL;

/*5. Kérdezzük le a MINTA.IRODALOM táblából az írók nevét, 
születési és halálozási dátumát (teljesen kiírva) és kétféleképpen azt, 
hogy hány évet éltek. Az évek számát 3 tizedesre kerekítve írjuk ki. */

SELECT * FROM minta.irodalom;

SELECT név, to_char(születési_idõ,'yyyy.mm.dd') születés
, to_char(halál_ideje,'yyyy.mm.dd') halál
,round((halál_ideje-születési_idõ)/365.25,3) kor1
,round(months_between(halál_ideje,születési_idõ)/12,3) kor2 
from minta.irodalom;



-------------------------------------------------------------------------------
/*
Datetime függvények, amiket ismerni kell:
-	SYSDATE, SYSTIMESTAMP: ezekkel már dolgoztunk, nincs argumentumuk
-	ADD_MONTHS: ha az eredményhónap rövidebb, mint a kiinduló dátum napja, akkor az adott hónap utolsó napját kapjuk. Csak egész hónapokat lehet kivonni és hozzáadni.
-	LAST_DAY: az adott dátum hónapjának utolsó napja
-	MONTHS_BETWEEN: két dátum között eltelt idõ hónapokban, törthónapokat is eredményül ad. Életkor meghatározására a legbiztosabb módszer, a 365.25-tel való osztás is csak közelítõ pontosságú, de ha a köztes hónapokat osztjuk 12-vel, az teljesen pontos (nincs igazán jelentõsége, ritkán lehet szükség tûpontos életkor meghatározására)
-	NEXT_DAY: csak a nyelvi beállítások ismeretében mûködik, mert a hét napját szövegesen kell megadni
-	TRUNC: levágás az adott dátumelemig (az adott idõszak elsõ napjának 0:00:00 idejét adja vissza)
-	ROUND: az adott dátumelemig lefelé vagy felfelé kerekít.
*/

-- nyelvi beállításoktól erõsen függ, 
-- sysdate eredményét kell bemásolni az aposztrofok közé
-- kedd helyére esetleg tuesday-t írni

SELECT SYSDATE FROM dual;

SELECT NEXT_DAY('17-FEBR. -21','KEDD') "NEXT DAY"
FROM DUAL;


-- nyelvi beállításoktól erõsen függ, 
-- sysdate eredményét kell bemásolni az aposztrofok közé
-- bármilyen formátumra lehet tördelni: http://docs.oracle.com/cd/B19306_01/server.102/b14200/functions230.htm#i1002084
-- levágás
SELECT TRUNC(TO_DATE('17-FEBR. -21','DD-MON-YY'), 'YEAR') évre, 
TRUNC(TO_DATE('17-FEBR. -21','DD-MON-YY'), 'Q') negyedévre,
TRUNC(TO_DATE('17-FEBR. -21','DD-MON-YY')) alapértelmezett --napra
FROM DUAL;


-- nyelvi beállításoktól erõsen függ, 
-- sysdate eredményét kell bemásolni az aposztrofok közé
-- bármilyen formátumra lehet tördelni: http://docs.oracle.com/cd/B19306_01/server.102/b14200/functions230.htm#i1002084
-- kerekítés
SELECT ROUND (TO_DATE ('2017-FEB-21'),'YEAR') felfele_kerekités,
       ROUND (TO_DATE ('2017-DEC-21'),'YEAR') lefele_kerekités 
FROM DUAL;
-------------------------------------------------------------------------------

/*6. Nézzük meg a mintapéldákat és fejtsük meg õket!*/

-- elõfordul, hogy olyan karaktert kell használnunk valahol, amely önmagában vezérlést segít
-- Az alapértelmezett ún. escape, azaz kivételkezelõ karakter az aposztróf ('), ami amúgy a szöveghatároló elem is, merthogy egy normál szövegben kizárólag ez, az aposztróf zavarná az Oracle-t
SELECT 'Jeanne d''Arc' AS Orleans_i_szuz 
FROM DUAL; -- Mi történne, ha csak egy aposztróf lenne a d után?

-- szövegösszefûzõ operátor: ||
SELECT to_char(SYSDATE,'YYYY.MM.DD') Ma
, 'Ez az év ' || TO_CHAR(SYSDATE,'DDD') || '. napja.' Nap
,	'Ez az év ' || TO_CHAR(SYSDATE,'IW') || '. hete.'  Hét
,	'Ez az év ' || TO_CHAR(SYSDATE,'Q') || '. negyedéve.' Negyedév
FROM DUAL;

/*
szövegfüggvények, amiket tudni kell fejbõl: 
- LENGTH: szöveg hosszát adja meg
- UPPER: a teljes szöveget nagybetusre alakítja
- LOWER: a teljes szöveget kisbetusre alakítja
- INITCAP: minden szó elso betujét nagybetusre, a többit kisbeture cseréli a szövegben
- SUBSTR: adott paramétereknek megfelelo szövegrészletet adja vissza
- TRIM: adott karaktert levágja a szöveg mindkét oldaláról

szövegfüggvények, amiket tudni kell dokumentáció segítségével: 
- LTRIM: adott karaktert levágja a szöveg bal oldaláról
- RTRIM: adott karaktert levágja a szöveg jobb oldaláról
- LPAD: adott szöveget kiegészít adott karakterrel adott hosszuságúra balról
- RPAD: adott szöveget kiegészít adott karakterrel adott hosszuságúra jobbról
- INSTR: adott szövegben megkeresi az adott kifejezés n-edik elofordulását a megadott pozíciótól számítva
- REPLACE: adott szöveget kicserél egy másik megadott szövegre
*/

-- két szöveg összefûzése
SELECT CONCAT( 'Ez is', ' egy megoldás') összefûz2
FROM DUAL;

-- csak két paramétere lehet
SELECT CONCAT( 'És',' vajon',' ez is?') összefûz3
FROM DUAL;

--viszont egymásba ágyazható
SELECT CONCAT( 'És', CONCAT(' vajon',' ez is?')) összefûz4
FROM DUAL;

-- kisbetû-nagybetû váltó függvények használatának jelentõségérõl: esztétikai kérdés, másrészt feltétel megfogalmazásakor fontos, mert a szövegfüggvények case sensitivek
-- attribútum írásmódját mindenképpen egységesíteni kell, pl. csupa kisbetûsre és akkor a feltétel másik felében is csupa kisbetûsnek kell lennie
-- a függvény mûködésének megértése miatt konstans szövegekre is használjuk ezeket a függvényeket, de valódi lekérdezéseknél ez ugye felelsleges, írhatjuk eleve a kívánt írásmóddal a szöveget 
select 
 'kis NAGY' eredeti
,lower('kis NAGY') kicsi 
,upper('kis NAGY') nagy
,initcap('kis NAGY') szókezdõ_nagy
,length('kis NAGY') szöveg_hossz
from dual;

-- legtöbbhelyen mûködõ bal, jobb, közép függvények helyett oracle-ben SUBSTR van
-- ha a második paraméter negatív, akkor hátulról számolja a karatereket, így nem szükséges a LENGTH függvény beágyazása
select 
 'tökösmákosrétes' eredeti
,substr('tökösmákosrétes',1,5) eleje
,substr('tökösmákosrétes',6,5) közepe
,substr('tökösmákosrétes',-5,5) vége
from dual;

-- TRIM függvénynek csak az alapesetét kell fejbõl tudni, amikor az elejérõl meg a végérõl a szóközöket szedi le
-- amikor kötõjeleket kell leszedni, de azt elég a dokumentációból tudni 
SELECT 
 '    levágva        ' eredeti
,trim('    levágva        ') AS megmi
,ltrim('    levágva        ') AS megmi3
,rtrim('    levágva        ') AS megmi4
FROM dual;

--instr(szöveg amiben keres, keresett szöveg, hányadik karaktertõl induljon a keresés, hányadik elõfordulás pozicióját adja vissza)
SELECT INSTR('Corporate Floor','or', 3, 2)
FROM dual;

--replace(melyik szövegben, mit, mire cseréljen)
SELECT REPLACE('JACK and JUE','J','BL') "Csere"
     FROM DUAL;
 
 
-- lpad/rpad( milyen szöveget, milyen hosszúságúra egészítsen, milyen karakterekkel töltse fel az üres helyeket
-- lpad balról, rpad jobbról tölti fel

select LPAD('szöveg',15,'_'),
RPAD('szöveg',15,'_')
FROM dual;

SELECT 
 '----levágva-------' eredeti
,trim('----levágva-------') AS megmi
,trim(both '-' from '----levágva-------') AS megmi2
FROM dual;

/*7. Fejtsük meg az alábbi lekérdezéseket. Mi történik, 
ha a WHERE feltétel konstans kifejezést tartalmaz?*/

-- like irányított operátor, a reguláris kifejezés csak a jobb oldalon állhat
-- számos szövegfüggvénynek van REGEXP alakja is (regexp_like)
-- like-nál % helyettesít akárhány karaktert, _ helyettesít egyetlen karaktert
-- csak akkor használjuk a like-ot, ha tényleg mintát akarunk illeszteni, különben elég lesz az = is
-- where feltétel konstans kifejezést tartalmaz, akkor is el tudjuk dönteni, hogy igaz vagy hamis
-- ha igaz, akkor a dual táblából megkapjuk egyszer a szelektlistában szereplõ értéket
-- ha hamis, akkor 0 sort kapunk eredményül

SELECT 'Lefutott' AS megmi FROM DUAL 
WHERE 'Okostojás' LIKE '%kos%';

SELECT 'Lefutott' AS megmi FROM DUAL 
WHERE 'Okostojás' NOT LIKE '%kos%';

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE 'Okostojás' LIKE 'okos%'; --kis nagy betû eltér

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE 'Okostojás' LIKE '_kos%';

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE lower('Okostojás') LIKE 'okos%';

/*8. Kérdezzük le a minta séma dolgozo táblájából azokat, akiknek 
a nevébõl kiderül, hogy feleségek! Rendezzük névsorba!*/

SELECT id, vnev, knev FROM minta.dolgozo
WHERE vnev LIKE '%né'
or knev like '%né'
order by 2,3;

/*vajon így is jó?*/
-- szövegfüggvények case sensitivek
SELECT id, vnev, knev FROM minta.dolgozo
WHERE vnev LIKE '%NÉ'
or knev like '%NÉ'
order by 2,3;

/*ha biztosra szeretnénk menni:*/
--minden sort kisbetûsre alakítunk
SELECT id, vnev, knev FROM minta.dolgozo
WHERE lower(vnev) LIKE '%né'
or lower(knev) like '%né'
order by 2,3;

/*9. Kérdezzük le ugyanazt, mint az elõbb, 
de egységes írásmóddal irassuk ki a neveket! Rendezzük névsorba!*/

SELECT id
,initcap(vnev) vnev
,initcap(knev) knev FROM minta.dolgozo
WHERE lower(vnev) LIKE '%né'
or lower(knev) like '%né'
order by 2,3;

/*10. Kérdezzük le a minta séma dolgozo 
táblájából az A és Á kezdõbetûs keresztnevû dolgozókat! */

select id, vnev, knev
from minta.dolgozo
where upper(knev) like 'A%'
or upper(knev) like 'Á%';

/*11. Kérdezzük le a minta séma dolgozo táblájából a Tiborokat!*/
select id, vnev, knev
from minta.dolgozo
where upper(knev) like 'TIBOR%'
;

--AJJAJ!

select id, vnev, knev
from minta.dolgozo
where upper(knev) = 'TIBOR';

/*12. Kérdezzük le a minta séma dolgozo táblájából a dolgozók nevét 
összefûzve és kiegészítve 20 karakterre _ karakterekkel!*/

select id, rpad(vnev||' '||knev,20,'_') név 
from minta.dolgozo
order by 1;

/******************/
/*ÖNÁLLÓ FELADATOK*/
/******************/

/*1.	Hozzuk létre az ORSZAGADATOK táblát a MINTA séma táblájának másolásával. 
A további feladatok egy része erre fog vonatkozni.*/

/*2.	Írjuk ki az országok neveinek hosszát!*/

/*3.	Írjunk lekérdezést, amely az országok neveinek csak 
a kezdõbetûjét hagyja meg nagybetûnek, a többi kisbetûs legyen!*/

/*4.	Listázzuk ki a váltópénzek neveit – az ott lévõ számok nélkül!*/

/*5.	Listázzuk ki az európai országokat! 
(LIKE operátor használatával!)*/

/*6.	Kérdezzük le az ALL_TABLES katalógustáblából 
azokat a kurzusrésztvevõket, akiknek van ÁRFOLYAM táblájuk 
(találjuk meg azokat is, akik az elsõ betût máshogy írták)! */

/*7.	Kérdezzük le a MINTA séma CÉGEK táblájából azokat a cégeket, 
ahol a cégnévben szerepel a a buda szórészlet!*/

/*8.	Kérdezzük le a MINTA séma CÉGEK táblájából azokat 
a nem budapesti cégeket, akiknek a nevében szerepel a buda szórészlet!*/

/*9.	Kérdezzük le a MINTA séma CÉGEK táblájából 
a részvénytársaságokat! 
Vigyázat, a Zrt-k és Nyrt-k kellenek, de azok a cégek ne 
kerüljenek bele a lekérdezésbe, amelyeknek a nevében 
véletlenül van benne az rt betûpáros!*/

/*10.	Kérdezzük le a MINTA séma CÉGEK táblájából azokat 
a cégeket, amelyeknek a nevében szerepel a magyar, vagy Hungary 
megjelölés és ebben az évezredben alapították õket!*/

/*11.	Kérdezzük le a MINTA séma CÉGEK2 táblájából a cégek adatait 
és azt, hogy idén mikor lesz az üzleti év vége!*/

/*12.	Listázzuk ki a MINTA séma ALKALMAZOTT táblájából 
a neveket kötõjelek között úgy, 
hogy a keletkezõ szöveg hossza 32 karakter legyen, 
és pont középen van a név! 
Például: „Gipsz Jakab”-ból legyen: 
„----------Gipsz Jakab----------” (az idézõjelek nélkül)!*/

/*13. Kérdezzük le a MINTA séma IRODALOM táblájából
a neveket szétbontva vezeték és keresztnévre!*/

/*14.	Számoljuk ki helyesen az SQL segítségével, 
évtõl függetlenül azt az idõpontot, amikor az óraátállítást 
el kell végezni, óra pontossággal. (Március és október utolsó 
szombatján, 2h-kor, illetve 3h-kor kell átállítani az órát.*/

