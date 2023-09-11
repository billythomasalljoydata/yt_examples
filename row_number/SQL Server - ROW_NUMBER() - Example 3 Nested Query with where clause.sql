--Nest for testing sample
select * from 
(

select 
	-- Simple 
	row_number() over (order by Color ASC) as ROWID_Simple,
	-- Partition by Color
	row_number() OVER(PARTITION BY COLOR order by Color ASC) as ROWID_Partition_Color,
	ProductID,
	Color

from product
)

as rowid_recordset

where ROWID_Partition_Color <=10