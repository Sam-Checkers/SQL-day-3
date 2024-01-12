-- List all customers who live in Texas
select customer_id, first_name, last_name, customer_state 
from customer
where customer_state = 'TX';

--Get all payments above $6.99 with the Customer's Full name
select payment.amount, customer.first_name, customer.last_name
from payment
inner join customer on customer.customer_id = payment.customer_id
where payment.amount >6.99;

--Show all customers names who have made payments over $175
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

--List all customers that live in Nepal
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING city = 'Nepal'
);

--Which staff member had the most transactions? Mike Hillyer
select payment_id, first_name, last_name, staff.staff_id
from payment
inner join staff
on payment.staff_id = staff.staff_id;

--How many movies of each rating are there?

select rating, count (rating)
from film
group by rating;

--Show all customers who have made a single payment above $6.99
SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer.customer_id IN (
    SELECT payment.customer_id
    FROM payment
    WHERE payment.amount > 6.99
);
-- How many free rentals did the store give away?

select *
from payment
where payment.amount = 0;