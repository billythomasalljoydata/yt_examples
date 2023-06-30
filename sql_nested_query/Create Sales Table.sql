
CREATE TABLE [dbo].[Sales](
	[Name] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Sales] [money] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO


INSERT INTO [dbo].[Sales](Name, State, Sales)
VALUES
('BILL','SC',116),
('BILL','SC',1000),
('BILL','SC',225),
('JOHN','GA',100),
('JOHN','GA',95),
('SUE','OH',80),
('SUE','OH',90),
('SUE','OH',87),
('SUE','OH',40),
('SALLY','FL',102),
('SALLY','FL',105),
('SALLY','FL',102),
('JIM','SC',95),
('JIM','SC',100)
GO


