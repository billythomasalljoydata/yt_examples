SELECT  dbo.Calendar_Plant.CalendarID, 
		dbo.Calendar_Plant.Descripiton, 
		dbo.Calendar_Plant.FromDate, 
		dbo.Calendar_Plant.ToDate, 
		dbo.Calendar_Machine.Description, 
		dbo.Calendar_Machine.FromDate AS Machine_FromDate, 
		dbo.Calendar_Machine.ToDate AS Machine_ToDate, 

CASE WHEN 
			(dbo.Calendar_Machine.FromDate >= dbo.Calendar_Plant.FromDate AND
			 dbo.Calendar_Machine.FromDate<=dbo.Calendar_Plant.ToDate) 

		OR

          (dbo.Calendar_Machine.ToDate >= dbo.Calendar_Plant.FromDate AND 
		   Calendar_Machine.ToDate <= dbo.Calendar_Plant.ToDate) 
		   
		   THEN 'FAIL' ELSE 'PASS' END AS Test

FROM     dbo.Calendar_Plant INNER JOIN
          dbo.Calendar_Machine ON dbo.Calendar_Plant.CalendarID = dbo.Calendar_Machine.CalendarID


where (dbo.Calendar_Machine.FromDate >= dbo.Calendar_Plant.FromDate AND
			 dbo.Calendar_Machine.FromDate<=dbo.Calendar_Plant.ToDate) 

		OR

          (dbo.Calendar_Machine.ToDate >= dbo.Calendar_Plant.FromDate AND 
		   Calendar_Machine.ToDate <= dbo.Calendar_Plant.ToDate) 


