declare @value varchar(50)
declare @patindex_value integer
declare @value_length integer
declare @result varchar(50)

set @value = '000000000000000049'
set @value_length = len(@value)
set @patindex_value = PATINDEX('%[^0]%', @value+'.')

--SUBSTRING(string, start,    length)
--SUBSTRING(@value, patindex, length of @value)
set @result = SUBSTRING(@value, PATINDEX('%[^0]%', @value), LEN(@value))

print 'Value:   ' + @value
print 'Length:  ' + cast(len(@value) as varchar)
print 'Patindex: ' + cast(@patindex_value as varchar)
print 'Result:   ' + @result

