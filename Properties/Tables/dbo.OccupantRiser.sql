IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantRiser')
BEGIN

CREATE TABLE [dbo].[OccupantRiser] (
    [Certification]        [NVARCHAR](50)         NULL,
    [CertificationDate]    [DATE]                 NULL,
    [Drain]                [NVARCHAR](50)         NULL,
    [DrainLocation]        [NVARCHAR](50)         NULL,
    [FileName]             [NVARCHAR](255)        NULL,
    [IdentificationNumber] [NVARCHAR](50)         NULL,
    [ImageHeight]          [INT]                  NULL,
    [ImageId]              [UNIQUEIDENTIFIER]     NULL,
    [ImageWidth]           [INT]                  NULL,
    [FDCLocation]          [NVARCHAR](50)         NULL,
    [Location]             [NVARCHAR](50)         NULL,
    [OccupantId]           [UNIQUEIDENTIFIER] NOT NULL,
    [OccupantRiserId]      [UNIQUEIDENTIFIER] NOT NULL,   
    [PipeSize]             [DECIMAL](18, 2)       NULL,    
    [ThumbImageId]         [UNIQUEIDENTIFIER]     NULL,    
    CONSTRAINT [PK_OccupantRiser] PRIMARY KEY CLUSTERED ([OccupantRiserId] ASC),
    CONSTRAINT [FK_OccupantRiser_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END