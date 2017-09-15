IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertyOtherWaterSource')
BEGIN

CREATE TABLE [dbo].[PropertyOtherWaterSource] (
    [PropertyOtherWaterSourceId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]                 UNIQUEIDENTIFIER NOT NULL,
    [WaterSourceType]            NVARCHAR (50)    NULL,
    [WaterSourceLocation]        NVARCHAR (50)    NULL,
    [ImageId]                    UNIQUEIDENTIFIER NULL,
    [ThumbImageId]               UNIQUEIDENTIFIER NULL,
    [FileName]				NVARCHAR (255)    NULL,
    [ImageHeight]          INT              NULL,
    [ImageWidth]         INT              NULL
    CONSTRAINT [PK_PropertyOtherWaterSource] PRIMARY KEY CLUSTERED ([PropertyOtherWaterSourceId] ASC),
    CONSTRAINT [FK_PropertyOtherWaterSource_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

END

