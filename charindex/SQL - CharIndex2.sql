-- Real world example
declare @str as varchar(50)
set @str = '20,250.00 USD'
select 'Space: ' + cast(charindex(' ', @str) as varchar)
select 'Lenght: ' + cast(len(@str) as varchar)
select 'Results: ' + left(@str,charindex(' ', @str))

--ProTip
--select 'Results: ' + left(@str,charindex(' ', @str)-1) + 'Test'

