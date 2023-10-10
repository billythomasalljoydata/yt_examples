-- Example 1, By Default This function performs a case-insensitive search.
select charindex('b', 'abcdefghijklmnopqrstuvwxyz')
-- Example 2 - same results
select charindex('M', 'abcdefghijklmnopqrstuvwxyz')
-- Example 3 - case sensitve
select charindex('M', 'abcdefghijklmnopqrstuvwxyz' COLLATE Latin1_General_CS_AS)
-- Example 4 - long string
select charindex
	('Billy', 'Hello and thank you for subscribing to my channel.  
	My name is Billy Thomas.')