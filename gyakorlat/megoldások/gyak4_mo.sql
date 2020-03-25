/*1. K�rdezz�k le az Oracle-ben t�rolhat� legkisebb �s legnagyobb d�tumot!*/
SELECT 
to_char(to_date(1,'J'),'BC YYYY.MM.DD') els�_nap
,to_char(to_date(5373484,'J'),'BC YYYY.MM.DD') utols�_nap
FROM dual;

/*2. K�rdezz�k le, hogy milyen nap van ma, mi volt tegnap �s mi lesz holnap!*/
SELECT
to_char(sysdate,'day') ma
,to_char(SYSDATE -1,'day') tegnap
,to_char(sysdate +1,'day') holnap
FROM DUAL;

/*3. K�rdezz�k le, hogy az aktu�lis h�nap utols� napja milyen napra esik.*/
select to_char(last_day(sysdate),'day') UTOLS� from dual;

/*4. K�rdezz�k le k�tf�lek�ppen, hogy mi volt a d�tum 4 �vvel ezel�tt 
(a k�zbees� sz�k��v figyelembe v�tel�vel �s an�lk�l).*/

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

/*6. N�zz�k meg a mintap�ld�kat �s fejts�k meg �ket!*/

SELECT 'Jeanne d''Arc' AS Orleans_i_szuz 
FROM DUAL; -- Mi t�rt�nne, ha csak egy aposztr�f lenne a d ut�n?


SELECT to_char(SYSDATE,'YYYY.MM.DD') Ma
, 'Ez az �v ' || TO_CHAR(SYSDATE,'DDD') || '. napja.' Nap
,	'Ez az �v ' || TO_CHAR(SYSDATE,'IW') || '. hete.'  H�t
,	'Ez az �v ' || TO_CHAR(SYSDATE,'Q') || '. negyed�ve.' Negyed�v
FROM DUAL;

SELECT CONCAT( 'Ez is', ' egy megold�s') �sszef�z2
FROM DUAL;

SELECT CONCAT( '�s',' vajon',' ez is?') �sszef�z3
FROM DUAL;

select 
 'kis NAGY' eredeti
,lower('kis NAGY') kicsi 
,upper('kis NAGY') nagy
,initcap('kis NAGY') sz�kezd�
from dual;

select 
 't�k�sm�kosr�tes' eredeti
,substr('t�k�sm�kosr�tes',1,5) eleje
,substr('t�k�sm�kosr�tes',6,5) k�zepe
,substr('t�k�sm�kosr�tes',-5,5) v�ge
from dual;

SELECT 
 '    lev�gva        ' eredeti
,trim('    lev�gva        ') AS megmi
FROM dual;


SELECT 
 '----lev�gva-------' eredeti
,trim('----lev�gva-------') AS megmi
,trim(both '-' from '----lev�gva-------') AS megmi2
FROM dual;


/*7. Fejts�k meg az al�bbi lek�rdez�seket. Mi t�rt�nik, 
ha a WHERE felt�tel konstans kifejez�st tartalmaz?*/

SELECT 'Lefutott' AS megmi FROM DUAL 
WHERE 'Okostoj�s' LIKE '%kos%';

SELECT 'Lefutott' AS megmi FROM DUAL 
WHERE 'Okostoj�s' NOT LIKE '%kos%';

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE 'Okostoj�s' LIKE 'okos%';

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
SELECT id, vnev, knev FROM minta.dolgozo
WHERE vnev LIKE '%N�'
or knev like '%N�'
order by 2,3;

/*ha biztosra szeretn�nk menni:*/

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

create table orszagadatok as 
select * from orszagadatok;
desc orszagadatok

/*2.	�rjuk ki az orsz�gok neveinek hossz�t!*/

select orszag, length(orszag) from orszagadatok;

/*3.	�rjunk lek�rdez�st, amely az orsz�gok neveinek csak 
a kezd�bet�j�t hagyja meg nagybet�nek, a t�bbi kisbet�s legyen!*/

select initcap(orszag) from orszagadatok;

/*4.	List�zzuk ki a v�lt�p�nzek neveit � az ott l�v� sz�mok n�lk�l!*/

select orszag, valtopenz from orszagadatok;
select orszag orsz�g
, substr(valtopenz,instr(valtopenz,' ')+1,length(valtopenz)) v�lt�p�nz 
from orszagadatok;
/*a substr 3. param�tere lehet nagyobb sz�m, akkor a v�g�ig �rja ki. 
Ez�rt nem sz�molgattam, hogy pontosan h�ny karatert is kellene ki�rni.*/

/*5.	List�zzuk ki az eur�pai orsz�gokat! 
(LIKE oper�tor haszn�lat�val!)*/

select orszag eur�pai_orsz�gok, foldrajzi_hely
from orszagadatok
where lower(foldrajzi_hely) like '%eur�pa%'
order by 2,1;

/*6.	K�rdezz�k le az ALL_TABLES katal�gust�bl�b�l 
azokat a kurzusr�sztvev�ket, akiknek van �RFOLYAM t�bl�juk 
(tal�ljuk meg azokat is, akik az els� bet�t m�shogy �rt�k)! */

select DISTINCT OWNER from all_tables
where upper(owner) like 'GI17_%'
and upper(table_name) like '_RFOLYAM'
ORDER BY 1;

/*7.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l azokat a c�geket, 
ahol a c�gn�vben szerepel a a buda sz�r�szlet!*/

desc minta.cegek
select * from
minta.cegek
where upper(szekhely) like '%BUDA%';

/*8.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l azokat 
a nem budapesti c�geket, akiknek a nev�ben szerepel a buda sz�r�szlet!*/

select * from
minta.cegek
where upper(szekhely) like '%BUDA%'
and upper(szekhely)<>'BUDAPEST'; --rossz adatbevitel miatt nem a legjobb eredm�ny

select * from
minta.cegek
where upper(szekhely) like '%BUDA%'
and upper(szekhely) not like '%BUDAPEST%';

/*9.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l 
a r�szv�nyt�rsas�gokat! 
Vigy�zat, a Zrt-k �s Nyrt-k kellenek, de azok a c�gek ne 
ker�ljenek bele a lek�rdez�sbe, amelyeknek a nev�ben 
v�letlen�l van benne az rt bet�p�ros!*/

select * from minta.cegek
where lower(cegnev) like '% rt%'
or lower(cegnev) like '% zrt%'
or lower(cegnev) like '% nyrt%';

/*10.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l azokat 
a c�geket, amelyeknek a nev�ben szerepel a magyar, vagy Hungary 
megjel�l�s �s ebben az �vezredben alap�tott�k �ket!*/

select * from minta.cegek
where (lower(cegnev) like '%hungary%'
or lower(cegnev) like '%magyar%')
and alapitas>=to_date('2000','YYYY');
/*kell a felt�telben a z�r�jelez�s!*/

/*11.	K�rdezz�k le a MINTA s�ma C�GEK2 t�bl�j�b�l a c�gek adatait 
�s azt, hogy id�n mikor lesz az �zleti �v v�ge!*/

select cegnev, szekhely, cid, alapitas
,to_date(to_char(sysdate,'YYYY')||to_char(uzletiev_vege,'MMDD'),'YYYYMMDD') �zleti_�v_v�ge
from minta.cegek2;

/*12.	List�zzuk ki a MINTA s�ma ALKALMAZOTT t�bl�j�b�l 
a neveket k�t�jelek k�z�tt �gy, 
hogy a keletkez� sz�veg hossza 32 karakter legyen, 
�s pont k�z�pen van a n�v! 
P�ld�ul: �Gipsz Jakab�-b�l legyen: 
�----------Gipsz Jakab----------� (az id�z�jelek n�lk�l)!*/

select rpad(lpad(nev,(32-length(nev))/2+length(nev),'-'),32,'-') N�v
from minta.alkalmazott;

/*13. K�rdezz�k le a MINTA s�ma IRODALOM t�bl�j�b�l
a neveket sz�tbontva vezet�k �s keresztn�vre!*/

select n�v
,substr(n�v,1,instr(n�v,' ')-1) vezet�k_n�v
,substr(n�v,instr(n�v,' ')+1,length(n�v)) kereszt_n�v
from minta.irodalom;

/*14.	Sz�moljuk ki helyesen az SQL seg�ts�g�vel, 
�vt�l f�ggetlen�l azt az id�pontot, amikor az �ra�t�ll�t�st 
el kell v�gezni, �ra pontoss�ggal. (M�rcius �s okt�ber utols� 
szombatj�n, 2h-kor, illetve 3h-kor kell �t�ll�tani az �r�t.*/

/*�rok n�h�ny lehets�ges megolds�t, az �vsz�mot tesztel�s c�lj�b�l
�t lehet �rni b�rmi m�sra.*/

select to_char(
last_day(to_date( '2017-03', 'YYYY-MM' ))
- to_char( to_date( '03.31', 'MM.DD' ), 'D' )
+ 1/12,
'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_�ra�t�ll�t�s from dual;


SELECT to_char(NEXT_DAY(last_day(to_date( '2017-03', 'YYYY-MM' ))-7,'VAS�RNAP') + 2/24,
'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_�ra�t�ll�t�s from dual;

SELECT to_char(next_day(add_months(trunc(sysdate,'yyyy'),3)-8,'VAS�RNAP') + 2/24, --ez az aktu�lis �vre m�k�dik, de a sysdate hely�re b�rmilyen d�tum be�rhat�
'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_�ra�t�ll�t�s from dual;

/*a dolgoz�k sz�let�si �v�ben az �ra�t�ll�t�s id�pontja:*/
SELECT id, vnev, knev, szuldat, to_char(next_day(add_months(trunc(szuldat,'yyyy'),3)-8,'VAS�RNAP') + 2/24,
'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_�ra�t�ll�t�s from minta.dolgozo;


