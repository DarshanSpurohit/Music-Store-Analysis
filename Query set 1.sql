--Q1) Who is the seniormost employee based on the job title?

select * from employee
order by levels
desc
limit 1

--Q2) Which countries have the most invoices?

select count(*)as c,billing_country from invoice
group by billing_country
order by c desc

--Q3) What are top 3 values of total invoices?

select * from invoice
order by total desc
limit 3

--Q4) City which has the highest sum of invoice total
select sum(total),billing_city from invoice
group by billing_city
order by sum(total) desc
limit 1

--Q5) The person who has spent the most money

select customer.customer_id, customer.first_name, customer.last_name,sum(invoice.total) as total from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1
