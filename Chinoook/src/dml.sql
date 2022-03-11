#1
SELECT count(playlist.Name) FROM playlist, playlisttrack, track
WHERE playlist.Name = 'Grunge'
AND playlist.PlaylistId = playlisttrack.PlaylistId
AND playlisttrack.TrackId = track.TrackId;

#2
SELECT artist.Name FROM artist
WHERE (Name REGEXP 'Jack'
OR Name REGEXP 'John')
AND Name NOT REGEXP 'Martin';

#3
SELECT SUM(Total) AS monetaryAmount FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) >= 100
ORDER BY monetaryAmount DESC;

#4
SELECT DISTINCT e2.Phone FROM employee INNER JOIN employee e2 on employee.ReportsTo = e2.EmployeeId, customer, invoice, artist, mediatype
WHERE MediaTypeId = 1
AND artist.Name = 'Miles Davis'
AND invoice.CustomerId = customer.CustomerId
AND customer.SupportRepId = employee.EmployeeId;

#5
SELECT DISTINCT Album.AlbumId, Title, ArtistId FROM Album, Track, Genre
WHERE Track.GenreId = Genre.GenreId
AND Genre.Name = 'Bossa Nova'
AND Track.AlbumId = Album.AlbumId
AND Track.Name LIKE 'Samba%';

#6
SELECT Genre.Name AS 'Genre',
        TRUNCATE(AVG(Milliseconds/60000), 0) AS 'Minutes'
FROM Track, Genre WHERE Milliseconds/60000 > 30
AND Genre.GenreId = Track.GenreId
GROUP BY Genre;

#7
SELECT DISTINCT count(Company) From customer
WHERE State IS NULL
AND Company IS NOT NULL;

#8
SELECT CONCAT(Employee.FirstName,' ', Employee.LastName) AS 'Employee',
        COUNT(SupportRepId) AS 'Client' FROM Employee
LEFT JOIN Customer C on Employee.EmployeeId = C.SupportRepId
WHERE C.Country = 'USA'
OR C.Country = 'Canada'
OR C.Country = 'Mexico'
GROUP BY Employee HAVING Client > 6;

#9
SELECT CONCAT(FirstName, ',' , LastName) AS fullName,
       IFNULL(Fax, 'S/he has no fax') AS fax FROM customer
WHERE Country = 'USA'
ORDER BY fullName ASC;

#10
SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR, BirthDate, HireDate) AS 'age when hired' FROM employee