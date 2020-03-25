SELECT * FROM USER_ROLE_PRIVS; --milyen szerepeink vannak

SELECT * FROM ALL_OBJECTS
WHERE OBJECT_TYPE='TABLE'
; --az adatb�zis �sszes t�bla t�pus� objektuma, nem fogjuk l�tni az �sszeset

SELECT COUNT(*) FROM ALL_OBJECTS
WHERE OBJECT_TYPE='TABLE'
; -- h�ny t�bla is van m�r az adatb�zisban?
-- futtassuk le a fenti utas�t�st �gy is, hogy a WHERE-rel kezd�d� sor el� is �runk megjegyz�s jelet: --
-- �gy az �sszes objektum sz�m�t fogjuk megkapni.

SELECT * FROM ALL_TABLES
WHERE OWNER='SCOTT'; -- a MINTA s�m�ban lesznek az �rai �s a gyakorl� t�bl�zatok, onnan b�rmikor import�lhat�ak, illetve lek�rdezhet�ek.