
--New fields added, good guys is now a subquery
select distinct 

	goodguys.MATNR, 
	goodguys.Material_Type, 
	goodguys.Req_UOM_Combined, 
	marm_uom_combined,  
	case when marm_uom_combined is null then 'FAIL' else 'PASS' end dq_test
	
	from 

-- Begin Good guys subquery

(
SELECT  distinct mara.matnr, mara.lvorm, Material_Type,  Req_UOM_Combined
FROM (
  VALUES ('FERT','EA', 'EA_PC'), 
		 ('FERT','PC', 'EA_PC'),
		 ('HALB','PC', 'PC'), 
		 ('HAWA','PC', 'PC'), 
		 ('ROH', 'PC', 'PC_EA_KG'), 
		 ('ROH', 'EA', 'PC_EA_KG'), 
		 ('ROH', 'KG', 'PC_EA_KG')
) AS UOM_Required(Material_Type,Req_UOM, Req_UOM_Combined) 

cross join mara_dev mara  

where 
	mara.MTART in ('FERT', 'HALB', 'HAWA', 'ROH') and
	mara.LVORM = '' and
	Material_Type = mara.mtart

) as GoodGuys


-- Left outer join to check goodguys -vs- badguys
left outer join 

-- begin bad guys subquery 
(select  mara2.matnr, 
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
) badguys 
-- important to join goodguys to badguys on Material and UOM
on badguys.matnr = goodguys.matnr and badguys.marm_uom_combined = goodguys.Req_UOM_Combined

order by matnr



