CREATE TABLE [dbo].[PropertySpecialHazard] (
    [SpecialHazardId]     UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]          UNIQUEIDENTIFIER NOT NULL,
    [SpecialHazardTypeId] INT              NULL,
    [Quantity]            INT              NULL,
    CONSTRAINT [PK_SpecialHazard] PRIMARY KEY CLUSTERED ([SpecialHazardId] ASC),
    CONSTRAINT [FK_SpecialHazard_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

