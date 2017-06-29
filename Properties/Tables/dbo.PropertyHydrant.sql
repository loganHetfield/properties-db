IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertyHydrant')
BEGIN

CREATE TABLE [dbo].[PropertyHydrant] (
    [PropertyHydrantId]          UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]                 UNIQUEIDENTIFIER NOT NULL,
    [HydrantLocationDescription] NVARCHAR (50)    NULL,
    [CrossStreet]                NVARCHAR (50)    NULL,
    [Flow]                       INT              NULL,
    [ImageId]                    UNIQUEIDENTIFIER NULL,
    [ThumbImageId]               UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_PropertyHydrant] PRIMARY KEY CLUSTERED ([PropertyHydrantId] ASC),
    CONSTRAINT [FK_PropertyHydrant_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

END



