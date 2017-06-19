CREATE TABLE [dbo].[Hydrant] (
    [HydrantsId]                 UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]                 UNIQUEIDENTIFIER NOT NULL,
    [HydrantLocationDescription] NVARCHAR (50)    NULL,
    [CrossStreet]                NVARCHAR (50)    NULL,
    [Flow]                       INT              NULL,
    CONSTRAINT [PK_Hydrant] PRIMARY KEY CLUSTERED ([HydrantsId] ASC),
    CONSTRAINT [FK_Hydrant_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);



