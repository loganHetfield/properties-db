CREATE TABLE [dbo].[PropertyOtherWaterSource] (
    [PropertyOtherWaterSourceId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]                 UNIQUEIDENTIFIER NOT NULL,
    [WaterSourceType]            NVARCHAR (50)    NULL,
    [WaterSourceLocation]        NVARCHAR (50)    NULL,
    CONSTRAINT [PK_PropertyOtherWaterSource] PRIMARY KEY CLUSTERED ([PropertyOtherWaterSourceId] ASC),
    CONSTRAINT [FK_PropertyOtherWaterSource_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

