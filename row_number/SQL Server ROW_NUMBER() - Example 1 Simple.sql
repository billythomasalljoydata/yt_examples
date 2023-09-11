select 
	-- Simple Example #1
	row_number() over (order by Color ASC) as ROWID_Simple,
	ProductID,
	Color

from product