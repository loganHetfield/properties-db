CREATE TABLE [dbo].[BuildingAED] (
    [BuildingAedId]   UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]      UNIQUEIDENTIFIER NOT NULL,
    [FloorNameNumber] VARCHAR (50)     NULL,
    [Location]        VARBINARY (50)   NULL,
    CONSTRAINT [PK_BuildingAED] PRIMARY KEY CLUSTERED ([BuildingAedId] ASC)
);

