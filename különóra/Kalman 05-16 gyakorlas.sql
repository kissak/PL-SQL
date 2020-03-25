/*10. Írassuk ki a dolgozókról, hogy milyen napon születtek (hétfő, kedd stb.)*/

desc mdolgozo
select id , to_char (szuldat, 'DAY') FROM mdolgozo;


1, Kérdezzük le azokat a férfi dolgozókat a minta 
séma dolgozo nevű táblájából, 
akik a születésnapjuk hónapjában kerültek a céghez!

select id, vnev,knev 
from mdolgozo
where to_char(felv_nap, 'month') = to_char(szuldat, 'month')
and nem=0;ev

/*3. Kérdezzük le az mdolgozo tábla adatait,
 írjuk ki azt is, 
hogy hány dolgozónak azonos a keresztneve!*/

select *, count(knev) OVER (PARTITION BY knev)  
FROM mdolgozo
;

select mdolgozo.*, count(knev) 
OVER (PARTITION BY knev)  AS azonos_keresztnevuek
FROM mdolgozo
;

/*4. Kérdezzük le a dolgozók adatait és mindenki 
mellé 
írjuk ki az életkorát a felvételkor,
és az előtte felvett 5 dolgozó életkorának 
átlagát!*/
--mozgó ablakolású fv (fix hosszúságúMDOLGOZO
DESC MDOLGOZOBY

select mdolgozo.* , 
round((felv_nap-szuldat)/365.25) ,
round(avg((felv_nap-szuldat)/365.25) OVER (ORDER by
felv_nap  rows between 5 preceding and 1 preceding))
from mdolgozo;

/*4b. Kérdezzük le a dolgozók adatait és mindenki 
mellé 
írjuk ki az életkorát a felvételkor,
és az előtte felvett 4 dolgozó életkorának és onmagának
átlagát!*/
--mozgó ablakolású fv (fix hosszúságúMDOLGOZO
DESC MDOLGOZO

select mdolgozo.* , 
round((felv_nap-szuldat)/365.25) AS életkor ,
round(avg((felv_nap-szuldat)/365.25) OVER (ORDER by
felv_nap  rows between 4 preceding and 0 preceding))
AS átlagkor 
from mdolgozo;


 
 
 
 
 
 
 