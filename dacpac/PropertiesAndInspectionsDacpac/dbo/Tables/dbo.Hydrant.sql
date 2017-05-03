CREATE TABLE [dbo].[Hydrant] (
    [HydrantsId]                 UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]                 UNIQUEIDENTIFIER NOT NULL,
    [HydrantLocationDescription] VARCHAR (50)     NULL,
    [CrossStreet]                VARCHAR (50)     NULL,
    [Flow]                       INT              NULL,
    CONSTRAINT [PK_Hydrant] PRIMARY KEY CLUSTERED ([HydrantsId] ASC),
    CONSTRAINT [FK_Hydrant_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

