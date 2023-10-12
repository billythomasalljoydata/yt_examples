--create view badguys as

select  mara2.matnr, 
		mara2.mtart, 
		marm.meinh, 
		CASE 	
			when mara2.mtart = 'FERT' and marm.meinh in ('EA', 'PC') then 'EA_PC'
			when mara2.mtart = 'HALB' and marm.meinh = ('PC') then 'PC'
			when mara2.mtart = 'HAWA' and marm.meinh = ('PC') then 'PC'
			when mara2.mtart = 'ROH' and marm.meinh in ('PC', 'EA', 'KG') then 'PC_EA_KG' 
		end marm_uom_combined
		
		from marm_dev marm

		inner join mara_dev mara2 on mara2.matnr = marm.matnr
where mara2.matnr <>''
and mara2.mtart in ('FERT', 'HAWA', 'HALB', 'ROH')



