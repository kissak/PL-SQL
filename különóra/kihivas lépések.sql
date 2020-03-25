/*
1. Kérdés: 
Kérdezzük le a minta séma rendelés, rendelési tétel, termék 
és kategória tábláinak segítségével az összes napot, 
amin volt rendelés és azt, hogy mennyi volt a bevételünk a
 megelõzõ egy hétben ruhákból (minden terméket vegyünk
 figyelembe, ami a ruha fõkategóriába tartozik!)
*/

1. lépés: kérdezzük le milyen alkategóriák esnek a 
ruha alkategória alá

select alkategoria, level 
from minta.kategoria
start with fokategoria = 'ruha'
connect by prior alkategoria = fokategoria;

2. lépés: milyen termékek esnek a ruha fokategóriába 
(és annak elkategóriáiba)

select t.*
from minta.termek t
  JOIN minta.kategoria k ON t.kategoria = k.alkategoria
start with fokategoria = 'ruha'
connect by prior alkategoria = fokategoria;

3. lépés: mely rendelésekben volt olyan termék, 
amely a kategóriába tartozik

select rt.*
from minta.termek t
  JOIN minta.kategoria k ON t.kategoria = k.alkategoria
  JOIN minta.rendelesi_tetel rt ON rt.termekkod = t.termekkod
start with fokategoria = 'ruha'
connect by prior alkategoria = fokategoria;

4. lépés: kérdezzük le, hogy mely napokon voltak a rendelések,
 amelybe volt  olyan termék, amely a ruha kategóriába tartozik

select r.rendelesi_ido
from minta.termek t
  JOIN minta.kategoria k ON t.kategoria = k.alkategoria
  JOIN minta.rendelesi_tetel rt ON rt.termekkod = t.termekkod
  JOIN minta.rendeles r ON r.rendelessorszam = rt.rendeles
start with fokategoria = 'ruha'
connect by prior alkategoria = fokategoria;

5. lépés: adjuk össze az adott sor rendelesi idejétől egy héten 
belül rendelt ruhák értékét

select 	r.rendelesi_ido,
sum(egysegar*mennyiseg) OVER (ORDER BY rendelesi_ido RANGE BETWEEN 7 PRECEEDING AND CURRENT ROW)
from minta.termek t
  JOIN minta.kategoria k ON t.kategoria = k.alkategoria
  JOIN minta.rendelesi_tetel rt ON rt.termekkod = t.termekkod
  JOIN minta.rendeles r ON r.rendelessorszam = rt.rendeles
start with fokategoria = 'ruha'
connect by prior alkategoria = fokategoria;

6. lépés: egy rendelést csak egyszer irassunk ki

select distinct	r.rendelesi_ido, r.rendelessorszam,
sum(egysegar*mennyiseg) OVER (ORDER BY rendelesi_ido RANGE BETWEEN 7 PRECEDING AND CURRENT ROW) elmult_egy_het
from minta.termek t
  JOIN minta.kategoria k ON t.kategoria = k.alkategoria
  JOIN minta.rendelesi_tetel rt ON rt.termekkod = t.termekkod
  JOIN minta.rendeles r ON r.rendelessorszam = rt.rendeles
start with fokategoria = 'ruha'
connect by prior alkategoria = fokategoria;


/*
2 kérdés
Listázzuk ki a data dictionaryból a MINTA sémában található
 összes idegen kulcsot! A lekérdezésbõl derüljön ki, 
hogy melyik tábla melyik oszlopa melyik másik tábla melyik 
oszlopára hivatkozik!
*/

1.lépés: kérdezzük le a minta séma idegenkulcsait

select *
from all_constraints
WHERE OWNER = 'MINTA'
AND CONSTRAINT_TYPE = 'R';

2. lépés: melyik tábla melyik oszlopára van definiálva az idegen kulcsot

select acc_fk.owner,  acc_fk.constraint_name, acc_fk.table_name, acc_fk.column_name, --referencing fk, melyik
from all_constraints ac
	JOIN all_cons_columns acc_fk ON acc_fk.CONSTRAINT_NAME = ac.CONSTRAINT_NAME
								 AND acc_fk.owner = ac.owner
WHERE ac.OWNER = 'MINTA'
AND ac.CONSTRAINT_TYPE = 'R';

3. lépés: melyik tábla melyik oszlopára hivatkozik az idegen kulcs

select acc_fk.owner,  acc_fk.constraint_name, acc_fk.table_name, acc_fk.column_name, --referencing fk, melyik
		acc_pk.owner,  acc_pk.constraint_name, acc_pk.table_name, acc_pk.column_name  --referenced pk, melyikre
from all_constraints ac
	JOIN all_cons_columns acc_fk ON acc_fk.CONSTRAINT_NAME = ac.CONSTRAINT_NAME
								 AND acc_fk.owner = ac.owner
	JOIN all_cons_columns acc_pk ON acc_pk.CONSTRAINT_NAME = ac.R_CONSTRAINT_NAME
								 AND acc_pk.owner = ac.owner
WHERE ac.OWNER = 'MINTA'
AND ac.CONSTRAINT_TYPE = 'R';


/*
3 kérdés
A minta séma ügyfél és rendelés táblájából listázzuk ki,
 az egyes rendelések adatait a megrendelõ nevével és a 
fizetési határidõvel együtt. A fizetési határidõ a
 megrendeléstõl számított 15. nap legyen, kivéve, ha
 szombatra
 vagy vasárnapra esik, mert akkor a 15. nap után 
 következõ hétfõ!
*/

1. lépés: listázzuk ki a megrendelő nevét és a fizetési határidőt

select u.login,
		u.vnev || ' ' || u.knev,
		rendelesi_ido + 15 as fizetesi_hatarido 
FROM minta.ugyfel u
	JOIN minta.rendeles r ON u.login = r.login;

2. lépés: ha hétvégére esik, akkor legyen a következő hétfő

select u.login,
		u.vnev || ' ' || u.knev,
		CASE to_char(rendelesi_ido + 15, 'DAY')
			WHEN 'SZOMBAT' THEN next_day(rendelesi_ido + 15, 'HÉTFŐ')
			WHEN 'VASÁRNAP' THEN next_day(rendelesi_ido + 15, 'HÉTFŐ')
			ELSE trunc(rendelesi_ido) + 15
		END as fizetesi_hatarido 
FROM minta.ugyfel u
	JOIN minta.rendeles r ON u.login = r.login;


/*
4 kérdés
Listázzuk ki a minta séma alkalmazott és fõnök 
tábláinak felhasználásával Komondi Aletta 4 legfiatalabb 
beosztottjának minden adatát! (Minden beosztottját 
nézzük, ne csak a közvetleneket!)
*/

1. lépés: Kérdezzük le Komondi Aletta id-ját

select aid 
from alkalmazott
WHERE nev = 'Komondi Aletta';

2. lépés: kérdezzük le Komondi Aletta beosztottjait és születési évük

SELECT a.*
FROM fonok f
	JOIN alkalmazott a ON f.id = a.aID
START WITH f.fonok_id = (select aid 
						from alkalmazott
						WHERE nev = 'Komondi Aletta'
					  )
CONNECT BY f.fonok_id = PRIOR f.ID
ORDER BY szulev DESC
;

3. lépés: kérdezzük le 4 legfiatalabbat
SELECT *
FROM (
	SELECT a.*
	FROM fonok f
		JOIN alkalmazott a ON f.id = a.aID
	START WITH f.fonok_id = (select aid 
							from alkalmazott
							WHERE nev = 'Komondi Aletta'
						  )
	CONNECT BY f.fonok_id = PRIOR f.ID
	ORDER BY szulev DESC)
WHERE ROWNUM <5;

/*
5 kérdés
Másoljuk le a minta séma ügyfél és rendelés tábláit a saját sémánkba! Állítsuk be mindkét tábla kulcs és idegen 
kulcs kényszereit! Egészítsük ki az ügyfél táblát egy TORZSVASARLO oszloppal! Frissítsük a tábla adatait egy 
utasítással: azok legyenek törzsvásárlók, akiknek volt 2015
 májusában és 2017 januárjában is rendelésük!
*/

1. lépés: másoljuk le a minta séma ügyfél és rendelés tábláit
 
CREATE TABLE s_ugyfel AS SELECT * FROM minta.ugyfel;
CREATE TABLE s_rendeles AS SELECT * FROM minta.rendeles;

2. lépés: állítsuk be mindkét tábla elsődleges kulcsát

ALTER TABLE s_ugyfel
ADD CONSTRAINT pk_ugyfel_login PRIMARY KEY (login);

ALTER TABLE s_rendeles
ADD CONSTRAINT pk_rendeles_rendelessorszam PRIMARY KEY (rendelessorszam);

3. lépés: állítsuk be az idegen kulcsot

ALTER TABLE s_rendeles
ADD CONSTRAINT fk_ugyfel_login_rendeles_login FOREIGN KEY (login) REFERENCES s_ugyfel(login);

4. lépés: egészítsük ki az ügyfél táblát egy TORZSVASARLO oszloppal

ALTER TABLE s_ugyfel
ADD torzsvasarlo CHAR(1);

5. lépés: azok legyenek törzsvásárlók, akiknek volt 2015 májusában és 2017 januárjában is rendelésük

UPDATE s_ugyfel s
SET s.torzsvasarlo = 'Y'
WHERE EXISTS(
              SELECT sr.LOGIN
              FROM s_rendeles sr
              WHERE to_char(sr.rendelesi_ido, 'YYYY-MM') = '2015-05'
              AND s.login = sr.login
            )
AND EXISTS(
				SELECT sr.LOGIN
				FROM s_rendeles sr
				WHERE to_char(sr.rendelesi_ido, 'YYYY-MM') = '2017-01'
				AND s.login = sr.login
			);