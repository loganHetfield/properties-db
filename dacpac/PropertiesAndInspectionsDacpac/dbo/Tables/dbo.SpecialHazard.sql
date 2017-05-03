CREATE TABLE [dbo].[SpecialHazard] (
    [SpecialHazardId]   UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]        UNIQUEIDENTIFIER NOT NULL,
    [SpecialHazardType] INT              NULL,
    CONSTRAINT [PK_SpecialHazard] PRIMARY KEY CLUSTERED ([SpecialHazardId] ASC),
    CONSTRAINT [FK_SpecialHazard_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

