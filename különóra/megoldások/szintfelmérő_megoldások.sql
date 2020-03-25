--Szintfelmérő

/*1, Kérdezzük le azokat a férfi dolgozókat a minta séma dolgozo nevű táblájából, 
akik a születésnapjuk hónapjában kerültek a céghez!*/

	SELECT * FROM dolgozo
	WHERE to_char(felv_nap,'mm')=to_char(szuldat,'mm')
	AND nem=0;

/*2, Számoljuk ki helyesen az SQL segítségével, 
évtől függetlenül azt az időpontot, amikor az óraátállítást 
el kell végezni, óra pontossággal. (Március és október utolsó 
szombatján, 2h-kor, illetve 3h-kor kell átállítani az órát)*/

	select to_char(
	last_day(to_date( '2017-03', 'YYYY-MM' ))
	- to_char( to_date( '03.31', 'MM.DD' ), 'D' )
	+ 1/12,
	'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_óraátállítás from dual;

	select to_char(
	last_day(to_date( '2017-10', 'YYYY-MM' ))
	- to_char( to_date( '10.31', 'MM.DD' ), 'D' )
	+ 3/24,
	'YYYY. MON DD. HH24:MI:SS' ) as őszi_óraátállítás from dual;

/*3, Kérdezzük le a MINTA séma CEGEK táblájából az Rt-ket úgy, 
hogy az Rt után legyen pont, de ha volt pont eleve, 
akkor ne legyen két pont utána!*/

	SELECT REPLACE(cegnev,' Rt',' Rt.') cégnév
	FROM minta.cegek
	WHERE lower(cegnev) LIKE '% rt%'
	AND lower(cegnev) NOT LIKE '% rt.%'
	UNION
	SELECT cegnev
	FROM minta.cegek
	WHERE lower(cegnev) LIKE '% rt.%';

/*4, Listázzuk ki az egyetemi adatbázisunkból (G06_Egyetem séma) a hallgatókat és a 
tárgyak kódját, amiket felvettek. Azt is, hogy az adott tárgyat melyik 
félévben vették fel. (Csak azok a hallgatók kellenek, akik vettek már
fel tárgyat.)*/

	select azonosito, nev, tantargykod, felev
	from g06_egyetem.hallgato h, g06_egyetem.felvetel f
	where h.azonosito=f.hallgato_azonosito
	order by nev,tantargykod,felev;

/*5, Listázzuk a webáruházunkból (G05_Webshop séma) azokat a vevőket, akik
még soha nem rendeltek. Van ilyen*/
	
	select login, név
	from g05_webshop.VEVOK join g05_webshop.rendeles using(login)
	where sorszam is null;

/*6, Listázzuk ki a webáruházunkból (G05_Webshop séma) azokat a termékeket,
amelyekből még soha nem rendeltek!*/

	select * from 
	g05_webshop.TERMEKEK t left join g05_webshop.TETEL r
	using(cikkszam)
	where RENDELÉS_SORSZÁMA is null;
	
	

/*7, Listázzuk ki, hogy szálláshelyenként (G01_Szallashely séma) hány szoba 
és hány férőhely szerepel az adatbázisunkban! Írjuk ki a 
szállás nevét és címét is!*/
	
	SELECT A.SZALLASHELYID, A.nev,A.cim, count(b.SZOBAID) szobaszám, sum(b.AGYAK_SZAMA + POTAGY) férőhely
	FROM g01_szallashely.szallashely A LEFT JOIN g01_szallashely.szoba b ON(A.SZALLASHELYID = b.SZALLASHELYFK)
	GROUP BY A.SZALLASHELYID,A.nev,A.cim
	ORDER BY A.SZALLASHELYID;

/*8, Ügyfeleink összesen hány éjszakára foglaltak nálunk 
szállást? Csak azokat írjuk ki, akiknél legalább 40 napot 
számolunk! (G01_Szallashely séma)*/
	
	SELECT b.FELHASZNALO, b.nev, sum(A.meddig-A.mettol) foglalt_éjszakák_száma
	FROM g01_szallashely.foglalas A JOIN g01_szallashely.ugyfel b ON(A.FELHASZNALO=b.FELHASZNALO)
	GROUP BY b.FELHASZNALO, b.nev
	HAVING sum(A.meddig-A.mettol)>=40
	ORDER BY b.nev;

/*9, Listázzuk ki, hogy melyik filmet hányszor kölcsönözték ki összesen, 
és hányszor kölcsönözték ki 4 napnál hosszabb időre! Ha egyszer sem, 
az is jelenjen meg az eredményben! (szemely, kolcsonzes, dvd táblák használhatóak)*/
	
	select film, nvl(osszesen,0) osszesen, nvl(hosszu,0) hosszu
	from (mdvd d left join
	(select film, count(*) osszesen
	from mkolcsonzes
	group by film) o
	using(film))
	left join
	(select film,count(*) hosszu
	from mkolcsonzes
	where napok>4
	group by film) h
	using(film)
	order by osszesen desc,hosszu desc;
	
/*10, Kérdezzük le, hogy Komondi Alettának hány férfi 
és hány női alkalmazottja van! (dolgozo és fonok táblák használhatóak)*/

	SELECT decode(nem,0,'Férfi','Nő') nem, count(*) fő
	FROM mfonok JOIN mdolgozo ON mfonok.id=mdolgozo.ID
	START WITH fonok_id IN 
	(SELECT ID FROM mdolgozo WHERE vnev = 'Komondi' AND knev='Aletta')
	CONNECT BY PRIOR mfonok.ID = fonok_id
	GROUP BY nem
	; 

/*11, Írjuk ki a kölcsönzők nevét és hogy hány alkalommal kölcsönöztek
ki filmet. Számoljuk ki, hogy mennyi a kölcsönzések átlag száma nemenként
és írjuk a kölcsönzők mellé, hogy ők a nemük átlagához képest mennyivel 
többször vagy kevesebbszer kölcsönöztek ki filmet. (szemely, kolcsonzes, dvd 
táblák használhatóak)*/

	select kid, nev,hányszor
	, hányszor-round(avg(hányszor) over (partition by nem),2) eltérés_a_nem_átlagától
	from
	(select kid,nev,nem,count(*) hányszor
	from mkolcsonzes join mszemely on (kid=kolcsonzo)
	group by kid,nev,nem)
	order by kid;
	
/*12, Készítsünk hisztogramot a filmekről a keletkezés éve alapján! 
1930 és 2000 között tizes osztályközzel! Azt írjuk ki, hogy az egyes
csoportokba hány film került! (szemely, kolcsonzes, dvd táblák használhatóak)*/

	select 
	width_bucket(ev,1930,2000,7)
	as csoport
	,decode(width_bucket(ev,1930,2000,7)
	,0,'<1930'
	,1,'30-39'
	,2,'40-49'
	,3,'50-59'
	,4,'60-69'
	,5,'70-79'
	,6,'80-89'
	,7,'90-99'
	,8,'>=2000')evek
	,count(*)
	from mdvd
	group by width_bucket(ev,1930,2000,7)
	order by csoport;