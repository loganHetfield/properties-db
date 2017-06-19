CREATE TABLE [dbo].[OtherWaterSource] (
    [OtherWaterSourceId]  UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]          UNIQUEIDENTIFIER NOT NULL,
    [WaterSourceType]     NVARCHAR (50)    NULL,
    [WaterSourceLocation] NVARCHAR (50)    NULL,
    CONSTRAINT [PK_OtherWaterSource] PRIMARY KEY CLUSTERED ([OtherWaterSourceId] ASC),
    CONSTRAINT [FK_OtherWaterSource_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);



