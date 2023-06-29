-- Average Sales
select avg(sales) as average_sales from Sales

--Average Sales by Name
select Name, avg(sales) as average_sales from Sales group by name
--Nested 
select avg(average_sales) average_sales_by_name from
(select Name, avg(sales) as average_sales from Sales group by name) avg_sales_by_name

--Average Sales by State
select State, avg(sales) as average_sales from Sales group by State
--Nested 
select avg(average_sales) average_sales_by_state from
(select State, avg(sales) as average_sales from Sales group by State) avg_sales_by_state

--Average Sales by Name, State
select Name, State, avg(sales) as average_sales from Sales group by name, state
--Nested #1
select State, avg(average_sales) average_sales_by_name_state from
(select Name, State, avg(sales) as average_sales from Sales group by name, state) avg_sales_by_name
	group by state

--Nested #2
select avg(average_sales_by_name_state) from 
( select State, avg(average_sales) average_sales_by_name_state from
(select Name, State, avg(sales) as average_sales from Sales group by name, state) avg_sales_by_name
	group by state) average_name_state
