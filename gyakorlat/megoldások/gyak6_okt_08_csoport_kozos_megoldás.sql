create table g08_egyetem.hallgato(
azonosito varchar(6) primary key check(length(azonosito) = 6)
,nev varchar(100) not null
,szuletesi_datum date not null
,kezdes_datuma date check(to_char(kezdes_datuma,'mmdd') = '0201' or to_char(kezdes_datuma,'mmdd') = '0901')
,szak varchar(100)
);

create table g08_egyetem.targy(
kod varchar(20) primary key 
,neve varchar(100) not null
,kreditertek number(2) check(kreditertek >= 0) 
,besorolas varchar(30) check(besorolas in ('kötelezõ', 'kötelezõen választható', 'választható'))
,tantargyfelelos varchar(100)
,szervezeti_egyseg varchar(100)
,tantargyleiras clob
);

create table g08_egyetem.targyfelvetel(
felvetel_id number(6) generated as identity primary key
,targykod varchar(20) not null references g08_egyetem.targy(kod)
,hallgato_azonosito varchar(6) not null references g08_egyetem.hallgato(azonosito)
,felev varchar(100) not null check(felev like '20__/20__/1' or felev like '20__/20__/2')
);

create table g08_egyetem.eredmeny(
eredmeny_id  number(6) generated as identity primary key
,felvetel_id number(6) not null references g08_egyetem.targyfelvetel(felvetel_id)
,hanyadik number(1) not null
,egyeb varchar(100) check(egyeb in('nem vizsgázott', 'nem jelent meg', 'igazoltan nem jelent meg'))
,eredmeny  number(1) check(eredmeny between 1 and 5)
,felvivo_azonosito varchar(100) default user not null
,felvitel_datuma date default sysdate not null
, constraint const1 check(egyeb is not null or eredmeny is not null)
);
