IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantAccess')
BEGIN

CREATE TABLE [dbo].[OccupantAccess] (
    [FileName]         [NVARCHAR](255)        NULL,
    [ImageHeight]      [INT]                  NULL,
    [ImageId]          [UNIQUEIDENTIFIER]     NULL,
    [ImageWidth]       [INT]                  NULL,
    [Location]         [NVARCHAR](50)         NULL,
    [OccupantAccessId] [UNIQUEIDENTIFIER] NOT NULL,
    [OccupantId]       [UNIQUEIDENTIFIER] NOT NULL,
    [ThumbImageId]     [UNIQUEIDENTIFIER]     NULL,
    [TypeId]           [INT]                  NULL,
    CONSTRAINT [PK_OccupantAccess] PRIMARY KEY CLUSTERED ([OccupantAccessId] ASC),
    CONSTRAINT [FK_OccupantAccess_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END