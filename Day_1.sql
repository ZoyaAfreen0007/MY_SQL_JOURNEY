use MyDatabase

-- this is an inline comment.

/* this is
          a 
              multi line  
                           comment */


-- Retrieve all customer data.
SELECT * 
FROM customers


-- Retrieve all the ordered data.
SELECT *
FROM orders

-- Retrieve each customer's name, country and score.
SELECT 
first_name,
country,
score 
FROM customers


-- Retrieve customers with a score not equals to 0.
SELECT*
FROM customers
WHERE score!= 0 



-- Retrieve customers from germany.
SELECT*
FROM customers
WHERE country = 'Germany'


-- Retrieve all customers and sort the results by the highest score first.
select *
from customers
order by score desc


-- Retrieve all customers and sort the results by the lowest score first.
select *
from customers
order by score asc



-- NESTED ORDER BY.......................
-- Retrieve all customers and sort the results by the country and then by the highest score first.
select *
from customers
order by
    country asc,
    score desc


-- Find the total score for each country.
select
    country,
    SUM (score) as total_score        -- "as" - (alias)
from customers
group by 
    country 


--Find the total score and total number of customers for each country.
select 
    country,
    count(id) as total_number_of_customers,
    sum (score )as total_score
from customers
group by country


/* find the average score for each country considering only customers with a score not equal
to 0 and return only those countries with an avg score greater than 430.*/

select
   country,
   AVG (score ) as avg_score
from customers 
where score != 0
group by country 
having  AVG (score )> 430


--Return unique list of all countries....
select distinct 
    country
from customers

--Retrieve the top 3 customers with the highest scores.

select top 3 *
from customers
order by score desc


-- get the two most recent orders.

select top 2 *
from orders
order by order_date desc
