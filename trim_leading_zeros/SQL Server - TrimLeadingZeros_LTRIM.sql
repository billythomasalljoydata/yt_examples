

SELECT  LTRIM('000000000000000049','0')
SELECT  LTRIM('0000000000000000490','0')
SELECT  LTRIM('000000000C00000049','0')


SELECT  LTRIM('000 000000 000000490','0')
--REPLACE ( string_expression , string_pattern , string_replacement ) 
SELECT REPLACE('000 000000 000000490',' ', '')
SELECT ltrim(REPLACE('000 000000 000000490',' ', ''),'0')
