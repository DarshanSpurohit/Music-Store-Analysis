--Q1) A query to return email, firstname. lastnamme & genre of all rock music listeners. Return your list ordered alphabetically by email starting with A

select distinct email, first_name, last_name, genre.name from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'
order by customer.email asc

--Q2) write a query that returns the artist name and total track count of the top 10 rock bands

select distinct artist.artist_id, artist.name,count(artist.artist_id) from artist
join album on artist.artist_id = album.artist_id
join track on album.album_id = track.album_id
where track.genre_id like '1'
group by artist.artist_id	
order by count(artist.artist_id) desc
limit 10

--Q3) return all the track names that have a song length longer than the average song length. return the name and milliseconds for each track.
select distinct name,milliseconds from track
where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc
