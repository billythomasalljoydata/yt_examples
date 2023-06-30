-- very simple case statement
select case when 1=2 then 'Yes' else 'No' end as Test

-- Sales Data
select Name, State, Sales from sales

-- case where State = 'SC'
select 
	Name, 
	State, 
	Sales, 
	case when State = 'SC' 
		then 'True' 
		else 'False' 
		end as SC_Case
from sales

-- case with nested query
select 
	Name, 
	State, 
	Sales, 
	case when Sales =  (select max(Sales) from sales) 
		then 'True' 
		else 'False' 
		end as Biggest_Sale 
from sales

-- case statement used in the where clause
select 
	Name, 
	State, 
	Sales
	from sales
		where
			case when Sales =  (select max(Sales) from sales) 
				then 'True' 
				else 'False' end 
		= 'True'
