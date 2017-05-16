CREATE TABLE [dbo].[Suite] (
    [SuiteId]           UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]        UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]        UNIQUEIDENTIFIER NOT NULL,
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
    [NotesField]        NCHAR (10)       NULL,
    CONSTRAINT [PK_Suite] PRIMARY KEY CLUSTERED ([SuiteId] ASC),
    CONSTRAINT [FK_Suite_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId]),
    CONSTRAINT [FK_Suite_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);



