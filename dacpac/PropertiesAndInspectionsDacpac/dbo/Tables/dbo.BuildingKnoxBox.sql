CREATE TABLE [dbo].[BuildingKnoxBox] (
    [BuildingKnoxBoxId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]        UNIQUEIDENTIFIER NOT NULL,
    [Location]          VARCHAR (50)     NULL,
    CONSTRAINT [PK_BuildingKnoxBox] PRIMARY KEY CLUSTERED ([BuildingKnoxBoxId] ASC)
);

