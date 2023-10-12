
CREATE VIEW [dbo].[Material_UOM_Consistency]
AS
SELECT DISTINCT dbo.goodguys.matnr, dbo.goodguys.lvorm, dbo.goodguys.Material_Type, dbo.goodguys.Req_UOM_Combined, dbo.badguys.marm_uom_combined, CASE WHEN marm_uom_combined IS NULL THEN 'FAIL' ELSE 'PASS' END AS dq_test
FROM     dbo.goodguys LEFT OUTER JOIN
          dbo.badguys ON dbo.goodguys.matnr = dbo.badguys.matnr AND dbo.goodguys.Req_UOM_Combined = dbo.badguys.marm_uom_combined
GO
