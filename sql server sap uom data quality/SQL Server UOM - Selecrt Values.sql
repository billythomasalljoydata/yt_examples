SELECT distinct Material_Type,  Req_UOM_Combined
FROM (
  VALUES ('FERT','EA', 'EA_PC'), 
		 ('FERT','PC', 'EA_PC'),
		 ('HALB','PC', 'PC'), 
		 ('HAWA','PC', 'PC'), 
		 ('ROH', 'PC', 'PC_EA_KG'), 
		 ('ROH', 'EA', 'PC_EA_KG'), 
		 ('ROH', 'KG', 'PC_EA_KG')
) AS UOM_Required(Material_Type,Req_UOM, Req_UOM_Combined) 