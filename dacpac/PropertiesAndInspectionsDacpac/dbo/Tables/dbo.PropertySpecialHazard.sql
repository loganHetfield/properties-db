CREATE TABLE [dbo].[PropertySpecialHazard] (
    [PropertySpecialHazardId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]              UNIQUEIDENTIFIER NOT NULL,
    [SpecialHazardTypeId]     INT              NULL,
    [Quantity]                INT              NULL,
    [ImageId]                 UNIQUEIDENTIFIER NULL,
    [ThumbImageId]            UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_PropertySpecialHazard] PRIMARY KEY CLUSTERED ([PropertySpecialHazardId] ASC),
    CONSTRAINT [FK_PropertySpecialHazard_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);





