IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantKnoxBox')
BEGIN

CREATE TABLE [dbo].[OccupantKnoxBox] (
		[FileName]	        [NVARCHAR](255)	        NULL,	
		[ImageHeight]	      [INT]	                  NULL,
		[ImageId]	          [UNIQUEIDENTIFIER]  	  NULL,	
		[ImageWidth]	      [INT]	                  NULL,
    [Location]          [NVARCHAR](50)          NULL,
    [OccupantKnoxBoxId] [UNIQUEIDENTIFIER]  NOT NULL,
    [OccupantId]        [UNIQUEIDENTIFIER]  NOT NULL,
		[ThumbImageId]	    [UNIQUEIDENTIFIER]	    NULL,
    CONSTRAINT [PK_OccupantKnoxBox] PRIMARY KEY CLUSTERED ([OccupantKnoxBoxId] ASC),
    CONSTRAINT [FK_OccupantKnoxBox_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END