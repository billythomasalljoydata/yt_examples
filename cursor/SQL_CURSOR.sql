USE AdventureWorksLT2016

-- Declare the cursor
DECLARE Scorecard_Reports_cursor CURSOR FOR 
SELECT [Rule_Name], View_Name, Test_Field  from dq_rules
--where 1 = 2 --(example of empty set)
-- at this point the cursor has all the data from the select

-- Declare 3 variables for the 3 fields
Declare @Rule_Name varchar(250)
Declare @View_Name varchar(250)
Declare @test_field nvarchar(50)

OPEN Scorecard_Reports_cursor; 
 
-- Perform the first fetch. 
	FETCH FROM Scorecard_Reports_cursor 
		INTO @Rule_Name, @View_Name, @Test_field

print @@FETCH_STATUS
 
-- Check @@FETCH_STATUS to see if there are any more rows to fetch. 
-- Returns the status of the last cursor fetch

	WHILE @@FETCH_STATUS = 0 

	BEGIN 
    -- This is executed as long as the previous fetch succeeds. 

		PRINT  @Rule_Name + ' | ' + @View_Name + ' | ' + @Test_field
	
	PRINT @@FETCH_STATUS

		FETCH NEXT FROM Scorecard_Reports_cursor 
			INTO @Rule_Name, @View_Name, @Test_Field
   

	END 

	PRINT @@FETCH_STATUS

-- clean up 
CLOSE Scorecard_Reports_cursor; 
DEALLOCATE Scorecard_Reports_cursor; 
