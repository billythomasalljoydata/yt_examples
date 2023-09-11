

select 
	-- Simple 
	row_number() over (order by Color ASC) as ROWID_Simple,
	-- Partition by Color
	row_number() OVER(PARTITION BY COLOR order by Color ASC) as ROWID_Partition_Color,


	ProductID,
	Color

from product
