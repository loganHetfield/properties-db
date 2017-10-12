IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantDetector')
BEGIN

CREATE TABLE [dbo].[OccupantDetector] (
		[AreaProtected]       [INT]	                  NULL,
		[FileName]	          [NVARCHAR](255)	        NULL,	
		[HowMany]	            [INT]	                  NULL,	
		[ImageHeight]	        [INT]	                  NULL,
		[ImageId]	            [UNIQUEIDENTIFIER]	    NULL,	
		[ImageWidth]	        [INT]	                  NULL,
		[Make]        	      [NVARCHAR](50)	        NULL,	
		[Manufacturer]	      [NVARCHAR](50)	        NULL,	
		[Model]	              [NVARCHAR](50)	        NULL,	
		[OccupantDetectorId]	[UNIQUEIDENTIFIER]	NOT	NULL,
		[OccupantId]	        [UNIQUEIDENTIFIER]	NOT	NULL,
		[SerialNumber]	      [NVARCHAR](100)	        NULL,	
		[ThumbImageId]	      [UNIQUEIDENTIFIER]	    NULL,	
		[TypeId]	            [INT]	                  NULL,
    CONSTRAINT [PK_OccupantDetector] PRIMARY KEY CLUSTERED ([OccupantDetectorId] ASC),
    CONSTRAINT [FK_OccupantDetector_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END