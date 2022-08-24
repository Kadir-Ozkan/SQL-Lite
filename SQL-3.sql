/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde 
ederek tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY 
yazarak listeyiniz. Listelemede trackid, name ve albumid bilgilerini 
bulunmalıdır. */

SELECT TrackId, name, AlbumId --benim çözüm
FROM tracks
where AlbumId IN (select AlbumId 
				FROM albums
				where Title='Faceless');
		
--hard-coded yöntem, tek bir blokla çözmeliyiz. subquery uygun.	
SELECT AlbumId
FROM albums
WHERE Title = 'Faceless';		
		
SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId = 88;
-- subquery yöntemi. = kullanmamızın sebebi tek değer döndüğünden dolayı
-- birden fazla değer dönecekse = yerine in kullanabilirdik 
SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId = (
				SELECT AlbumId
				FROM albums
				WHERE Title = 'Faceless');
				
-- JOIN
SELECT t.TrackId,
	   t.name,
	   t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId
WHERE a.Title = 'Faceless';
--and li çözüm.
SELECT t.TrackId,
	   t.name,
	   t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId AND a.Title = 'Faceless';
