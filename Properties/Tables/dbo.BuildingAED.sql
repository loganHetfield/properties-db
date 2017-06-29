IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingAED')
BEGIN

CREATE TABLE [dbo].[BuildingAED] (
    [BuildingAedId]   UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]      UNIQUEIDENTIFIER NOT NULL,
    [FloorNameNumber] NVARCHAR (50)    NULL,
    [Location]        NVARCHAR (50)    NULL,
    CONSTRAINT [PK_BuildingAED] PRIMARY KEY CLUSTERED ([BuildingAedId] ASC),
    CONSTRAINT [FK_BuildingAED_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END





