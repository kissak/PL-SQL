--------------------------------------------------------
--  File created - p�ntek-m�jus-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object UGYFEL with DBMS_METADATA attempting internal generator.

CREATE TABLE UGYFEL 
(
  LOGIN VARCHAR2(20 BYTE) NOT NULL 
, EMAIL VARCHAR2(50 BYTE) NOT NULL 
, VNEV VARCHAR2(50 BYTE) NOT NULL 
, KNEV VARCHAR2(50 BYTE) NOT NULL 
, SZULEV NUMBER(4, 0) 
, CIM VARCHAR2(100 BYTE) 
);

ALTER TABLE UGYFEL
ADD CONSTRAINT CON_UGYFEL_EMAIL CHECK 
(email LIKE '%@%.__' OR  email LIKE '%@%.___');

ALTER TABLE UGYFEL
ADD CONSTRAINT NN_UGYFEL_EMAIL CHECK 
("EMAIL" IS NOT NULL);

ALTER TABLE UGYFEL
ADD CONSTRAINT NN_UGYFEL_KNEV CHECK 
("KNEV" IS NOT NULL);

ALTER TABLE UGYFEL
ADD CONSTRAINT NN_UGYFEL_VNEV CHECK 
("VNEV" IS NOT NULL);

ALTER TABLE UGYFEL
ADD CONSTRAINT U_UGYFEL_EMAIL UNIQUE 
(
  EMAIL 
);

ALTER TABLE UGYFEL
ADD CONSTRAINT PK_UGYFEL_LOGIN PRIMARY KEY 
(
  LOGIN 
);


CREATE UNIQUE INDEX PK_UGYFEL_LOGIN ON UGYFEL (LOGIN ASC);
CREATE UNIQUE INDEX U_UGYFEL_EMAIL ON UGYFEL (EMAIL ASC);
REM INSERTING into UGYFEL
SET DEFINE OFF;
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('peter4','p�ter.b�r�@mail.hu','B�r�','P�ter','1985','R�k�czi utca 67.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tibor','tibor.gombos@mail.hu','Gombos','Tibor','1993','Kossuth utca 77.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('agnes','agnes@gmail.com','Lengyel','�gnes','1979','De�k Ferenc �t 5.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('nikoletta4','nikoletta4@gmail.com','K�','Nikoletta','1972','F� �t 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balazs1','bal�zs.bozsik@mail.hu','Bozsik','Bal�zs','1992','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('jozsef','jozsef@gmail.com','Gergely','J�zsef','1985','F� �t 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('KRISZTIANM','KRISZTIANM@gmail.com','Mogyr�di','Kriszti�n','1968','J�szai t�r 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('dora3','d�ra.sarodi@mail.hu','Sarodi','D�ra','1995','F� �t 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('aniko','aniko@gmail.com','T�th','Anik�','1973','De�k Ferenc �t 5.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ZSUZSAV','zsuzsa.vajda@mail.hu','Vajda','Zsuzsa','1976','Kossuth utca 77.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('roland1','roland.ferencz@mail.hu','Ferencz','Roland','1985','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balint1','balint1@gmail.com','Moln�r','B�lint','1989','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ARONK','�ron.kelemen@mail.hu','Kelemen','�ron','1989','Pet�fi utca 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('emese','emese.kuruc@mail.hu','Kuruc','Emese','1989','R�k�czi utca 67.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ferenc1','ferenc.orosz@mail.hu','Orosz','Ferenc','1983','Arany J�nos utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('SZILARDS','szil�rd.szalai@mail.hu','Szalai','Szil�rd','1967','F� �t 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('szilvia1','szilvia.tari@mail.hu','Tari','Szilvia','1971','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('NANDORF','n�ndor.f�@mail.hu','F�','N�ndor','1968','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ZOLTANT','zolt�n.t�th@mail.hu','T�th','Zolt�n','1985','Posta k�z 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eszter4','eszter.f�l�p@mail.hu','F�l�p','Eszter','1993','Kossuth Lajos utca 47/b.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('agnes3','agnes3@gmail.com','Harty�nszky','�gnes','1967','Posta k�z 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tamas','tam�s.antal@mail.hu','Antal','Tam�s','1984','Posta k�z 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('bertalan','bertalan@gmail.com','Csiger','Bertalan','1977','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras41','andras41@gmail.com','Komj�ti','Andr�s','1997','Kossuth �t 24.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BEATRIXK','beatrix.ker�nyi@mail.hu','Ker�nyi','Beatrix','1972','Kossuth Lajos utca 47/b.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('pal','p�l.barab�s@mail.hu','Barab�s','P�l','1968','Szolnoki �t 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andrea3','andrea3@gmail.com','Szomor','Andrea','1996','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('LASZLON','l�szl�.nagy@mail.hu','Nagy','L�szl�','1969','J�szai t�r 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('matyas2','matyas2@gmail.com','Botka','M�ty�s','1972','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('JUDITH','JUDITH@gmail.com','H�dasi','Judit','1997','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANIKOS','ANIKOS@gmail.com','Simon','Anik�','1988','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('RENATAK','ren�ta.kardos@mail.hu','Kardos','Ren�ta','1988','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('david','david@gmail.com','Ambrus','D�vid','1974','F� �t 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('attila4','attila.bar�ti@mail.hu','Bar�ti','Attila','1975','Arany J�nos utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('krisztina','krisztina@gmail.com','Szedl�r','Krisztina','1979','Arany J�nos utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('aladar','alad�r.dunai@mail.hu','Dunai','Alad�r','1980','�rp�d utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BEATRIXS','beatrix.szekendi@mail.hu','Szekendi','Beatrix','1981','J�szai t�r 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('TAMASF','TAMASF@gmail.com','F�nyes','Tam�s','1997','Arany J�nos utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('szabolcs','szabolcs.bodor@mail.hu','Bodor','Szabolcs','1990','Ady Endre �t 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('adam1','�d�m.kiss@mail.hu','Kiss','�d�m','1991','Szolnoki �t 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANDRASE','ANDRASE@gmail.com','Erdei','Andr�s','1997','Szolnoki �t 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('julia','julia@gmail.com','T�th','J�lia','1993','�rp�d utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('peter1','peter1@gmail.com','Kozma','P�ter','1976','K�zponti telep 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MARKH','m�rk.horv�th@mail.hu','Horv�th','M�rk','1997','Badacsonyi utca 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('brigitta3','brigitta.pataki@mail.hu','Pataki','Brigitta','1991','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('IBOLYAA','ibolya.andor@mail.hu','Andor','Ibolya','1983','Posta k�z 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balu','b�lint.endresz@mail.hu','Endresz','B�lint','1976','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eva2','eva2@gmail.com','Perlinger','�va','1971','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('laszlo1','l�szl�.farkas@mail.hu','Farkas','L�szl�','1967','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MONIKAM','m�nika.mohos@mail.hu','Mohos','M�nika','1974','Baracsi L�szl� utca 14.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('akos','�kos.b�r�@mail.hu','B�r�','�kos','1982','Kossuth Lajos utca 47/b.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('aron2','aron2@gmail.com','Jakab','�ron','1971','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zoltan4','zoltan4@gmail.com','Barna','Zolt�n','1986','J�szai t�r 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('LASZLOA','l�szl�.antal@mail.hu','Antal','L�szl�','1969','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eszter2','eszter.balogh@mail.hu','Balogh','Eszter','1998','Kossuth utca 11.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('roland','roland@gmail.com','T�th','Roland','1968','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('brigitta','brigitta.sz�kely@mail.hu','Sz�kely','Brigitta','1978','F� utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eva','eva@gmail.com','Enyedi','�va','1967','Pet�fi utca 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras21','andr�s.moln�r@mail.hu','Moln�r','Andr�s','1977','R�k�czi utca 67.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('SZABOLCSM','szabolcs.mikl�s@mail.hu','Mikl�s','Szabolcs','1980','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('daniel1','d�niel.keszler@mail.hu','Keszler','D�niel','1969','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sebestyen','sebestyen@gmail.com','Rab','Sebesty�n','1992','K�zponti telep 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('roza2','roza2@gmail.com','Bucsk�','R�za','1988','Arany J�nos utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('maria1','m�ria.bar�th@mail.hu','Bar�th','M�ria','1995','Posta k�z 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('KRISZTINAG','KRISZTINAG@gmail.com','Gy�rf�s','Krisztina','1987','Arany J�nos utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANNAMARIAR','ANNAMARIAR@gmail.com','Reg�s','Annam�ria','1977','Pet�fi S�ndor t�r 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ZSOLTJ','ZSOLTJ@gmail.com','J�zsa','Zsolt','1983','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ZOLTANP','zolt�n.pint�r@mail.hu','Pint�r','Zolt�n','1977','F� �t 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANDREAT','ANDREAT@gmail.com','Tornyos','Andrea','1986','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gabor1','gabor1@gmail.com','K�ves','G�bor','1973','�rp�d utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('janos3','janos3@gmail.com','Harangoz�','J�nos','1967','Pet�fi S�ndor t�r 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ESZTERE','eszter.�rsek@mail.hu','�rsek','Eszter','1978','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ROBERTP','ROBERTP@gmail.com','P�sztor','R�bert','1972','Ady Endre �t 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsuzsa3','zsuzsa.vars�nyi@mail.hu','Vars�nyi','Zsuzsa','1979','�rp�d utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('norbert5','norbert5@gmail.com','B�res','Norbert','1975','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ilona3','ilona3@gmail.com','Bosny�k','Ilona','1990','Posta k�z 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsuzsa','zsuzsanna@gmail.com','Pusztai','Zsuzsanna','1980','Badacsonyi utca 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('marton','marton@gmail.com','Kalacsi','M�rton','1989','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('annamaria1','annam�ria.sz�cs@mail.hu','Sz�cs','Annam�ria','1990','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kriszti','kriszti@gmail.com','Horv�th','Krisztina','1978','�rp�d utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('RENATAS','RENATAS@gmail.com','Szirmai','Ren�ta','1991','Kossuth utca 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('julia4','julia4@gmail.com','Nagy','J�lia','1985','J�szai t�r 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('PETERB','p�ter.berendi@mail.hu','Berendi','P�ter','1969','Vas�t utca 4/10.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('bernadett2','bernadett.kov�cs@mail.hu','Kov�cs','Bernadett','1996','F� �t 122.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MIKLOSB','mikl�s.balla@mail.hu','Balla','Mikl�s','1979','Szent Istv�n utca 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras3','andr�s.v�gh@mail.hu','V�gh','Andr�s','1971','Arany J�nos utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('georgij','georgij.ny�ri@mail.hu','Ny�ri','Georgij','1983','Grassalkovich �t 10.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsuzsanna','zsuzsanna.barta@mail.hu','Barta','Zsuzsanna','1994','D�zsa Gy�rgy utca 37.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('JANOSG','JANOSG@gmail.com','Giliga','J�nos','1975','De�k Ferenc �t 5.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('jozsef2','j�zsef.vajda@mail.hu','Vajda','J�zsef','1978','Baracsi L�szl� utca 14.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kornel4','korn�l.luk�cs@mail.hu','Luk�cs','Korn�l','1975','B�csi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('bence','bence@gmail.com','Gy�rffy','Bence','1987','�rp�d utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balazs3','balazs3@gmail.com','Bak�dy','Bal�zs','1986','Arany J�nos utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('AGNESH','AGNESH@gmail.com','Horv�th','�gnes','1981','R�k�czi utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ARPADM','�rp�d.m�ricz@mail.hu','M�ricz','�rp�d','1986','R�k�czi utca 67.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('rajmond4','rajmond.r�cz@mail.hu','R�cz','Rajmond','1993','Pet�fi utca 1/2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('norbert2','norbert.heged�s@mail.hu','Heged�s','Norbert','1991','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('GABORS','GABORS@gmail.com','Sz�ll�si','G�bor','1990','Kossuth utca 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kata','katalin.gondos@mail.hu','Gondos','Katalin','1968','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sandor4','sandor4@gmail.com','Nagy','S�ndor','1997','F� utca 47.');
commit;
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('norbert4','norbert4@gmail.com','Mile','Norbert','1983','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balint','balint@gmail.com','Horv�th','B�lint','1996','Endr�di S�ndor utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('JANOSP','JANOSP@gmail.com','P�link�s','J�nos','1984','Padragi �t 158.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('miklos2','miklos2@gmail.com','Gondos','Mikl�s','1995','�rp�d utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('istvan','istvan@gmail.com','So�s','Istv�n','1986','Kossuth utca 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ARPADH','�rp�d.horv�th@mail.hu','Horv�th','�rp�d','1990','D�zsa Gy�rgy u. 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('klaudia2','klaudia.bak�@mail.hu','Bak�','Klaudia','1982','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('veronika4','veronika4@gmail.com','Tank�','Veronika','1983','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('VIKTORIAU','viktoria.urb�n@mail.hu','Urb�n','Viktoria','1996','N�pboltsor  2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('denes','denes@gmail.com','T�mb�ly','D�nes','1975','Kossuth �t 39.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('edit','edit.bittmann@mail.hu','Bittmann','Edit','1984','F� utca 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsolt1','zsolt.pulai@mail.hu','Pulai','Zsolt','1988','F� utca 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras4','andras4@gmail.com','Back','Andr�s','1984','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BERNADETTO','bernadett.orb�n@mail.hu','Orb�n','Bernadett','1987','Arany J�nos utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sandor3','s�ndor.farkas@mail.hu','Farkas','S�ndor','1989','Tan�csk�zt�rsas�g t�r 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('krisztian4','kriszti�n.cz�rna@mail.hu','Cz�rna','Kriszti�n','1970','D�zsa Gy�rgy utca 37.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('AGNESK','AGNESK@gmail.com','Kov�cs','�gnes','1988','Endr�di S�ndor utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ATTILAO','ATTILAO@gmail.com','Opra','Attila','1995','R�k�czi �t 200.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('EVAV','EVAV@gmail.com','Viktor','�va','1980','Arany J�nos utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gabriella10','gabriella10@gmail.com','Vida','Gabriella','1969','Arany J�nos utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andi','andrea.mar�di@mail.hu','Mar�di','Andrea','1968','�rp�d utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('peter3','peter3@gmail.com','Szalai','P�ter','1983','Arany J�nos utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('GYONGYIK','gy�ngyi.kornse�@mail.hu','Kornse�','Gy�ngyi','1974','F� �t 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('katka','katalin.kov�cs@mail.hu','Kov�cs','Katalin','1975','Pet�fi utca 22.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BELAF','BELAF@gmail.com','Farkas','B�la','1995','Pet�fi S�ndor utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANDRASN','andr�s.nagy@mail.hu','Nagy','Andr�s','1980','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tibor2','tibor2@gmail.com','D�niel','Tibor','1985','�rp�d utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gusztav','gusztav@gmail.com','B�rci','Guszt�v','1967','Endr�di S�ndor utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('bernadett1','bernadett1@gmail.com','Simon','Bernadett','1984','F� utca 108.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('julianna4','julianna4@gmail.com','Szab�','Julianna','1990','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ROBERTI','r�bert.iv�n@mail.hu','Iv�n','R�bert','1967','Pet�fi S�ndor utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balazs2','bal�zs.sz�cs@mail.hu','Sz�cs','Bal�zs','1984','Szabads�g utca 95.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('peter2','peter2@gmail.com','Bozs�','P�ter','1976','Zombori �t 2/A');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('GYORGYO','GYORGYO@gmail.com','Oroszi','Gy�rgy','1980','D�zsa Gy�rgy u. 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zoltan','zolt�n.fodor@mail.hu','Fodor','Zolt�n','1979','F� utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andrea','andrea.kiss@mail.hu','Kiss','Andrea','1993','Pet�fi S�ndor utca 87.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('alexandra','alexandra.bag�czki@mail.hu','Bag�czki','Alexandra','1992','Pet�fi utca 1/2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('lala','lajos.nagymih�ly@mail.hu','Nagymih�ly','Lajos','1997','R�k�czi �t 200.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('dani','daniel@gmail.com','V�r�s','D�niel','1986','D�zsa Gy�rgy u. 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('imre1','imre.papp@mail.hu','Papp','Imre','1976','Szolnoki �t 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('aniko4','aniko4@gmail.com','B�r�cz','Anik�','1978','Pet�fi S�ndor t�r 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('imre','imre.b�za@mail.hu','B�za','Imre','1988','Pet�fi S�ndor t�r 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('david1','david1@gmail.com','Sobj�k','D�vid','1970','Arany J�nos utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('adam4','�d�m.bieniek@mail.hu','Bieniek','�d�m','1976','Juh�szf�ldi �t 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('mark','m�rk.kisp�l@mail.hu','Kisp�l','M�rk','1996','Juh�szf�ldi �t 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('arpad2','�rp�d.�tv�s@mail.hu','�tv�s','�rp�d','1990','Padragi �t 158.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('daniel','d�niel.r�cz@mail.hu','R�cz','D�niel','1978','Szabads�g t�r 9.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('VIKTORK','viktor.kereszt�ri@mail.hu','Kereszt�ri','Viktor','1989','Nagy Lajos t�r 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('nikolett3','nikolett3@gmail.com','Horv�th','Nikolett','1981','Arany J�nos utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('valentin','valentin.fer�@mail.hu','Fer�','Valentin','1986','B�v�r utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('reka4','r�ka.szikszai@mail.hu','Szikszai','R�ka','1969','Templom utca 73.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('polla','polla@gmail.com','Pal�gyi','Polla','1994','F� �t 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MATEK','m�t�.koza@mail.hu','Koza','M�t�','1997','K�zponti telep 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('csongor3','csongor.nagymih�ly@mail.hu','Nagymih�ly','Csongor','1984','De�k Ferenc �t 5.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kati','katalin.zatyk�@mail.hu','Zatyk�','Katalin','1995','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('laszlo2','l�szl�.m�ra@mail.hu','M�ra','L�szl�','1975','Pet�fi utca 1/2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('norbert','norbert@gmail.com','Sz�cs','Norbert','1969','Gy�ri utca 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MATYASS','m�ty�s.szil�gyi@mail.hu','Szil�gyi','M�ty�s','1975','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('vivien3','vivien3@gmail.com','Boros','Vivien','1991','F� �t 122.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('henrik3','henrik.n�dudvari@mail.hu','N�dudvari','Henrik','1986','Tan�csk�zt�rsas�g t�r 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('adam3','adam3@gmail.com','Bark�ci','�d�m','1970','D�zsa Gy�rgy utca 37.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('debora','deb�ra.barna@mail.hu','Barna','Deb�ra','1976','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BENCEB','bence.bajusz@mail.hu','Bajusz','Bence','1973','F� utca 56.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('timea2','t�mea.dusha@mail.hu','Dusha','T�mea','1975','Kossuth utca 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gabor4','g�bor.telek@mail.hu','Telek','G�bor','1987','F� �t 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tunde','tunde@gmail.com','Turcsik','T�nde','1974','F� �t 122.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ISTVANV','ISTVANV@gmail.com','Varga','Istv�n','1989','H�s�k tere 11.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kristof4','kristof4@gmail.com','Popr�di','Krist�f','1984','M�sz�ros utca 7.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('NIKOLETTAT','nikoletta.tat�r@mail.hu','Tat�r','Nikoletta','1997','Gy�ri utca 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sandor','sandor@gmail.com','Karasz','S�ndor','1970','Kossuth Lajos utca 1/a.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('david4','david4@gmail.com','Berta','D�vid','1990','Balatoni �t 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('JOZSEFG','j�zsef.gyuris@mail.hu','Gyuris','J�zsef','1975','Pet�fi utca 1/2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tamara2','tamara.mikl�s@mail.hu','Mikl�s','Tamara','1980','Kossuth �t 39.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sara','s�ra.farkas@mail.hu','Farkas','S�ra','1973','Felszabadul�s utca 32.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('attila1','attila.guly�s@mail.hu','Guly�s','Attila','1982','Szolnoki �t 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('SEBASTIANF','SEBASTIANF@gmail.com','Folt�nyi','Sebasti�n','1992','Grassalkovich �t 10.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('anett3','anett.pivarcsi@mail.hu','Pivarcsi','Anett','1967','F� �t 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsofi1','zsofi1@gmail.com','Moln�r','Zs�fi','1983','�rp�d utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MIHALYJ','mih�ly.juh�sz@mail.hu','Juh�sz','Mih�ly','1979','R�k�czi utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('fruzsina4','fruzsina4@gmail.com','Frank','Fruzsina','1996','Szabads�g utca 95.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tihamer','tiham�r.kazy@mail.hu','Kazy','Tiham�r','1991','F� utca 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('katalin4','katalin4@gmail.com','Kert�sz','Katalin','1986','B�v�r utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras2','andr�s.t�th@mail.hu','T�th','Andr�s','1997','Pet�fi utca 30.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('istvan1','istv�n.vizi@mail.hu','Vizi','Istv�n','1997','R�k�czi utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('anita','anita.hamvay-kov�cs@mail.hu','Hamvay-Kov�cs','Anita','1971','T�ncsics utca 19.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('robert2','robert2@gmail.com','Patay','R�bert','1977','R�k�czi utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('timea','timea@gmail.com','Pap�s','T�mea','1996',' Kossuth �t 77.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('beata4','be�ta.bagi@mail.hu','Bagi','Be�ta','1994','Felszabadul�s utca 32.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eszter','eszter.moln�r@mail.hu','Moln�r','Eszter','1987','F� �t 77.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('attila','attila@gmail.com','Cs�ti','Attila','1979','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balint2','balint2@gmail.com','Vukasinovity','B�lint','1997','B�ke utca 7.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('krisztina1','krisztina.bori@mail.hu','Bori','Krisztina','1969','F� utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('katalin','katalin.horv�th@mail.hu','Horv�th','Katalin','1968','R�k�czi �t 200.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andrea4','andrea4@gmail.com','Neizer','Andrea','1981','Kiss u. 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('lajos','lajos.kiss@mail.hu','Kiss','Lajos','1978','Dob utca 1');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gabriella1','gabriella1@gmail.com','Nagy','Gabriella','1982','Dob utca 1');
commit;
-- Unable to render INDEX DDL for object U_UGYFEL_EMAIL with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX U_UGYFEL_EMAIL ON UGYFEL (EMAIL ASC);
-- Unable to render INDEX DDL for object PK_UGYFEL_LOGIN with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX PK_UGYFEL_LOGIN ON UGYFEL (LOGIN ASC);
