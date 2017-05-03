CREATE TABLE [dbo].[Structure] (
    [StructureId]       UNIQUEIDENTIFIER NOT NULL,
    [Name]              VARCHAR (50)     NULL,
    [Status]            INT              NULL,
    [StartDate]         DATE             NULL,
    [EndDate]           DATE             NULL,
    [Length]            INT              NULL,
    [Width]             INT              NULL,
    [Height]            INT              NULL,
    [TotalSquareFeet]   INT              NULL,
    [TotalExits]        INT              NULL,
    [InteriorWallsType] INT              NULL,
    [InteriorDoorsType] INT              NULL,
    [FireDoorsPresent]  BIT              NULL,
    [FireDoorsType]     INT              NULL,
    [FireLoad]          INT              NULL,
    [FireWalls]         INT              NULL,
    CONSTRAINT [PK_Structure] PRIMARY KEY CLUSTERED ([StructureId] ASC)
);

