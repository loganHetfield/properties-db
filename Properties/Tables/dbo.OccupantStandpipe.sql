IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantStandpipe')
BEGIN

CREATE TABLE [dbo].[OccupantStandpipe] (
    [CertificationDate]    [DATE]                 NULL,
    [CertificationNumber]  [NVARCHAR](50)         NULL,    
    [Class]                [INT]                  NULL,
    [ControlValveLocation] [NVARCHAR](50)         NULL,
    [FDCLocation]          [NVARCHAR](50)         NULL,
    [FileName]             [NVARCHAR](255)        NULL,
	  [ImageHeight]          [INT]                  NULL,
	  [ImageId]              [UNIQUEIDENTIFIER]     NULL,
	  [ImageWidth]           [INT]                  NULL,    
    [OccupantStandpipeId]  [UNIQUEIDENTIFIER] NOT NULL,
    [OccupantId]           [UNIQUEIDENTIFIER] NOT NULL,
    [SizeId]               [INT]                  NULL,
    [StandpipeZone]        [NVARCHAR](50)         NULL,
    [ThumbImageId]         [UNIQUEIDENTIFIER]     NULL,
    [TypeId]               [INT]                  NULL,
    CONSTRAINT [PK_OccupantStandpipe] PRIMARY KEY CLUSTERED ([OccupantStandpipeId] ASC),
    CONSTRAINT [FK_OccupantStandpipe_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END