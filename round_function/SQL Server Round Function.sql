SELECT   

	ListPrice, 
	-- Example of what happens when we divide
	ListPrice / 3 AS ListPrice_By_3, 
	-- Using Round function to round to the nearest ...
	ROUND(ListPrice / 3,   2) AS Rnd_Nearest_Penny,   -- Hundreth
	ROUND(ListPrice / 3,   1) AS Rnd_Nearest_Dime,	  -- Tenth
	ROUND(ListPrice / 3, - 0) AS Rnd_Nearest_Ones,	  -- Ones
	ROUND(ListPrice / 3, - 1) AS Rnd_Nearest_Tens,	  -- Tens
	ROUND(ListPrice / 3, - 2) AS Rnd_Nearest_Hundreds -- Hundreds

FROM     dbo.Product
