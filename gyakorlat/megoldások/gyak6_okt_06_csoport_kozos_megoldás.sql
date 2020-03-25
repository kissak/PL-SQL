create table g06_egyetem.hallgato(
azonosito varchar2(6) primary key check(length(azonosito)=6)
,nev varchar2(100) not null
,szuletesi_datum date not null
,kezdes_datuma date check(to_char(kezdes_datuma,'mmdd') in ('0901','0201'))
,szak varchar2(100)
, check (kezdes_datuma > szuletesi_datum)
);

create table g06_egyetem.targyak(
kod varchar(20) primary key
,nev varchar2(100) not null
,kreditertek number(2) check(kreditertek >= 0)
,besorolas varchar(50) check(besorolas in ('kötelezõ', 'kötelezõen választható', 'választható'))
,tantargyfelelos varchar2(100)
,szervezeti_egysg varchar2(100)
,tantárgyleírás clob
);


create table g06_egyetem.felvetel(
felvetel_id number(6) generated as identity primary key
,felev varchar2(20) not null check(felev like '__/__-1' or felev like '__/__-2')
,tantargykod varchar(20) not null references g06_egyetem.targyak(kod)
,hallgato_azonosito varchar2(6) not null references g06_egyetem.hallgato(azonosito)
);


create table g06_egyetem.eredmenyek(
eredmeny_id number(6) generated as identity primary key
, felvetel_id number(6) not null references g06_egyetem.felvetel(felvetel_id)
, sorszam number(1) not null
, egyeb  varchar(50) check(egyeb in ('nem vizsgázott', 'nem jelent meg', 'igazoltan nem jelent meg'))
, osztalyzat number(1) check (osztalyzat between 1 and 5)
, felvivo_azonosito varchar(50) default user not null
, felvitel_datuma date default sysdate  not null
, constraint ertekeles check(egyeb is not null or osztalyzat is not null)
);