IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantSprinkler')
BEGIN

CREATE TABLE [dbo].[OccupantSprinkler] (
    [AreaCovered]              INT                    NULL,
    [DesignId]                 [INT]                  NULL,
    [FileName]	               [NVARCHAR](255)	      NULL,
    [FlowDate]                 [DATE]                 NULL,
    [FlowRate]                 [INT]                  NULL,
    [FlowRateInspector]        [UNIQUEIDENTIFIER]     NULL,
		[ImageHeight]	             [INT]	                NULL,
		[ImageId]	                 [UNIQUEIDENTIFIER]  	  NULL,	
		[ImageWidth]	             [INT]	                NULL,
    [MainLocation]             [NVARCHAR](50)         NULL,
    [MainSize]                 [DECIMAL](18, 2)       NULL,
    [Make]                     [NVARCHAR](50)         NULL,    
    [Manufacturer]             [NVARCHAR](50)         NULL,
    [Model]                    [NVARCHAR](50)         NULL,    
    [NumberOfSprinklers]       [INT]                  NULL,
    [OccupantSprinklerId]      [UNIQUEIDENTIFIER] NOT NULL,
    [OccupantId]               [UNIQUEIDENTIFIER] NOT NULL,
    [PSI]                      [INT]                  NULL,
    [SerialNumber]             [NVARCHAR](50)         NULL,
    [SprinklerInstallDate]     [DATE]                 NULL,
    [TypeId]                   [INT]                  NULL,    			
		[ThumbImageId]	           [UNIQUEIDENTIFIER]	    NULL,    
    CONSTRAINT [PK_OccupantSprinkler] PRIMARY KEY CLUSTERED ([OccupantSprinklerId] ASC),
    CONSTRAINT [FK_OccupantSprinkler_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END