IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantShutOff')
BEGIN

CREATE TABLE [dbo].[OccupantShutOff] (
    [FileName]          [NVARCHAR](255)        NULL,
    [ImageHeight]       [INT]                  NULL,
    [ImageId]           [UNIQUEIDENTIFIER]     NULL,
    [ImageWidth]        [INT]                  NULL,
    [Location]          [NVARCHAR](50)         NULL,
    [OccupantId]        [UNIQUEIDENTIFIER] NOT NULL,    
    [OccupantShutOffId] [UNIQUEIDENTIFIER] NOT NULL,    
    [ThumbImageId]      [UNIQUEIDENTIFIER]     NULL,
    [TypeId]            [INT]                  NULL,    
    CONSTRAINT [PK_OccupantShutOff] PRIMARY KEY CLUSTERED ([OccupantShutOffId] ASC),
    CONSTRAINT [FK_OccupantShutOff_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END