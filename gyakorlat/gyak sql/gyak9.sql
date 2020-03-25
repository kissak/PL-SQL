/*Sz�mol�sok az eg�sz t�bl�ra*/
/*1. Sz�moljuk ki az orsz szinon�m�b�l 
az ott szerepl� orsz�gok teljes n�pess�g�t!*/

select sum(nepesseg) from orsz;

/*2. Sz�moljuk ki, hogy �sszesen 
a n�pess�g mekkora ar�nya lakik f�v�rosokban!*/

select sum(fovaros_nepessege)/sum(nepesseg) from orsz;

/*egy szebb megold�s:*/
select to_char(sum(fovaros_nepessege)/sum(nepesseg)*100,'99')||'%' as F�v�ros_lakosar�ny
from orsz;

/*3. Mekkora a t�bl�ban szerepl� orsz�gok ter�let�nek �tlaga?*/

select avg(terulet) from orsz;

--az �tlagot illik kerek�teni:

select round(avg(terulet),2) from orsz;
desc orsz

/*Darabsz�mok a t�bl�ban*/
/*4. H�ny rekord szerepel az orszagadatok t�bl�ban? 
Ez h�ny orsz�g adata? H�ny orsz�gnak van megadva 
az aut�jele �s ez h�ny k�l�nb�z� aut�jelet jelent?*/

select 
 count(*) sorok_sz�ma
,count(orszag) orsz�gok_sz�ma
,count(autojel) autojelek_sz�ma
,count(distinct autojel) unique_autojelek_sz�ma 
from orsz;

/*5. H�ny k�l�nb�z� f�ldrajzi hely �s f�ldr�sz 
szerepel az orszagadatok t�bl�ban?*/

select count(distinct foldrajzi_hely),count(distinct foldresz) from orsz;

/*Sz�m�t�sok r�szcsoportra. 
Korl�tozzuk a sz�m�t�sban r�sztvev� rekordok sz�m�t.*/

/*6. H�ny eur�pai rekord szerepel az orszagadatok t�bl�ban? 
Ez h�ny orsz�g adata? H�ny orsz�gnak van megadva 
az aut�jele �s ez h�ny k�l�nb�z� aut�jelet jelent?*/

select 
 count(*) sorok_sz�ma
,count(orszag) orsz�gok_sz�ma
,count(autojel) autojelek_sz�ma
,count(distinct autojel) unique_autojelek_sz�ma 
,count(distinct foldrajzi_hely) f�ldrajzi_helyek_sz�ma
from orsz
where foldresz='Eur�pa';

/*7. H�ny orsz�gban haszn�lnak doll�rt?*/

select count(*) doll�rt_haszn�l�k
from orsz
where penznem='doll�r';

/*8.	F�ldr�szenk�nt h�ny orsz�g van a t�bl�ban?*/

select foldresz, count(*) orsz�gok_sz�ma
from orsz
group by foldresz;

/*9.	F�ldrajzi helyenk�nt h�ny orsz�g van a t�bl�ban?*/

select foldrajzi_hely, count(*) orsz�gok_sz�ma
from orsz
group by foldrajzi_hely;

/*10.	F�ldr�szenk�nt �s f�ldrajzi helyenk�nt 
h�ny orsz�g van a t�bl�ban?*/

select foldresz,foldrajzi_hely, count(*) orsz�gok_sz�ma
from orsz
group by foldresz,foldrajzi_hely
order by 1,2;

/*11.	F�ldr�szenk�nt h�ny orsz�gban haszn�lnak doll�rt?*/

select foldresz, count(*) doll�rt_haszn�l�k
from orsz
where penznem='doll�r'
group by foldresz;

/*12. List�zzuk ki azokat a f�ldrajzi helyeket (a f�ldr�szeket is megadva), amelyek t�bb mint 4 orsz�gb�l �llnak!*/

select foldresz,foldrajzi_hely, count(*) orsz�gok_sz�ma
from orsz
group by foldresz,foldrajzi_hely
having count(*)>4
order by 1,2;

/*13.	Mekkora a legkisebb �tlagorsz�gm�ret kontinensenk�nt?*/

select foldresz, round(avg(terulet),2) �tlagter�let
from orsz
group by foldresz
order by �tlagter�let desc;

select min(round(avg(terulet),2)) legkisebb_�tlagter�let
from orsz
group by foldresz;

/*Csoportf�ggv�nyek �sszekapcsolt t�bl�kb�l*/

/*14. K�rdezz�k le a dvd k�lcs�nz� azon �gyfeleit, akik t�bb mint 5-sz�r 
k�lcs�n�ztek m�r ki filmet.
Mindegyik k�l�nb�z� film volt?*/

select kid,nev, count(*) k�lcs�nz�s_sz�m, count(distinct film) film_sz�m, count(*)-count(distinct film) k�l�nbs�g
from mszemely s join mkolcsonzes k
on s.kid=k.kolcsonzo
group by kid,nev
having count(*)>5;

/*15. List�zzuk ki csak azokat, akikn�l volt filmism�tl�d�s*/

select kid,nev, count(*) k�lcs�nz�s_sz�m, count(distinct film) film_sz�m, count(*)-count(distinct film) k�l�nbs�g
from mszemely s join mkolcsonzes k
on s.kid=k.kolcsonzo
group by kid,nev
having count(*)-count(distinct film)>0;

/*16. �tlagosan h�ny �vesek az egyes �gyfeleink �ltal kik�lcs�nz�tt filmek. Sz�moljunk el�sz�r a hi�nyz� �vsz�mok kihagy�s�val,
azt�n �gy, hogy felt�tellez�k, hogy azok 1960-ban k�sz�ltek. Csak azokat �rassuk ki, ahol az eredm�ny elt�r.*/

select kid,nev,count(*) db
,round(avg(extract(year from sysdate)-ev),2) �tlagkor
,round(avg(extract(year from sysdate)-nvl(ev,1960)),2) �tlagkor2
from mszemely s join mkolcsonzes k on s.kid=k.kolcsonzo
join mdvd using(film)
group by kid, nev
having avg(extract(year from sysdate)-ev)<>avg(extract(year from sysdate)-nvl(ev,1960));

/*17. List�zzuk ki, hogy h�ny filmet k�lcs�n�ztek ki a n�i 
�gyfeleink. Akik m�g nem k�lcs�n�ztek, azokn�l 0 szerepeljen! Csak azokat �rjuk ki, akik 5-n�l kevesebb filmet vettek eddig ki!*/

select kid,nev, count(film) kolcsonzesek
from mszemely s left join mkolcsonzes k
on kid=kolcsonzo
where nem='N'
group by kid,nev
having count(film)<5
order by kolcsonzesek desc;

/*******************/
/*�n�ll� feladatok:*/
/*******************/
/*A feladatokhoz haszn�lhat� s�m�k:
G01_Szallashely
G12_Szallashely
G02_Szallashely
G11_Szallashely
G03_Szallashely
G04_Egyetem
G06_Egyetem
G08_Egyetem
G13_Egyetem
G05_Webshop
G07_Webshop
G14_Webshop
G09_Webshop
G10_Webshop
*/

/*1.	List�zzuk ki, hogy �sszesen h�ny szoba szerepel 
az adatb�zisunkban!*/

/*2.	List�zzuk ki, hogy sz�ll�shelyenk�nt h�ny szoba 
�s h�ny f�r�hely szerepel az adatb�zisunkban! �rjuk ki a 
sz�ll�s nev�t �s c�m�t is!*/

/*3.	List�zzuk ki azokat az �gyfelelinket, akik foglaltak 
m�r le kl�m�s szob�t! H�ny alkalommal t�rt�nt ez meg?*/

/*4.	�gyfeleink �sszesen h�nyszor foglaltak n�lunk 
sz�ll�st? Csak azokat list�zzuk ki, akik maximum 2-szer!*/

/*5.	�gyfeleink �sszesen h�ny �jszak�ra foglaltak n�lunk 
sz�ll�st? Csak azokat �rjuk ki, akikn�l legal�bb 40 napot 
sz�molunk!*/

/*6.	Mennyi a legt�bb nap, amit valaki a sz�ll�sainkon 
foglalt?*/

/**************************/

/*7.	List�zzuk ki, hogy �sszesen h�ny hallgat� szerepel 
az adatb�zisunkban!*/

/*8.	List�zzuk ki az egyetemi adatb�zisunkb�l a hallgat�kat 
�s hogy h�ny t�rgyat vettek fel a 2015/16-os tan�v m�sodik f�l�v�ben! Jelen�ts�k meg a hallgat�k nev�t �s szakj�t is!*/

/*9.	List�zzuk ki, hogy h�ny p�nz�gy szakos hallgat� 
vette fel az adatb�zisban szerepl� v�laszthat� t�rgyakat!*/

/*10.	Szakonk�nt �s f�l�venk�nt sz�moljuk ki az eredm�nyek 
�tlag�t!*/

/*11.	Mennyi ezeknek az �tlagoknak a maximuma illetve 
minimuma?*/

/*12.	List�zzuk ki azokat a k�telez� t�rgyainkat, 
amit 20-n�l kevesebben vettek fel! Azok is jelenjenek 
meg, amelyeket egy hallgat� sem vett fel!*/

/********************/

/*13. List�zzuk ki, hogy �tlagosan mekkora a k�szlet�nk 
a term�keinkb�l!*/

/*14. List�zzuk ki, hogy havonta mekkora volt a rendel�sek 
�ssz�rt�ke a webshopunkban!*/

/*15.	List�zzuk ki azokat az �gyfeleinket, akik rendeltek 
m�r n�lunk kab�tot! Fejenk�nt �sszesen h�ny darabot?*/

/*16.	List�zzuk ki, hogy a term�keinkb�l �sszesen mekkora 
�sszegben rendeltek! Csak azokat jelen�ts�k meg, ahol az �sszeg 
1000 Ft-n�l kevesebb. Amib�l m�g nem rendeltek, azok is jelenjenek meg!*/

/*17.	Sz�moljuk ki, hogy term�kkateg�ri�nk�nt mekkora volt a bev�tel�nk! 
Mennyi ezeknek a bev�teleknek az �tlaga?*/

