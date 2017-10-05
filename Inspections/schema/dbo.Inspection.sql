IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Inspection')
BEGIN

CREATE TABLE [dbo].[Inspection] (
    [InspectionId]                    UNIQUEIDENTIFIER   NOT NULL,
    [PropertyId]                      UNIQUEIDENTIFIER   NOT NULL,
    [TypeId]                          INT                NOT NULL,
    [ReceivedDate]                    DATE               NULL,
    [ScheduledDate]                   DATE               NULL,
    [LeadInspectorId]                 UNIQUEIDENTIFIER   NULL,
    [StationId]                       UNIQUEIDENTIFIER   NULL,
    [ShiftId]                         UNIQUEIDENTIFIER   NULL,
    [UnitId]                          UNIQUEIDENTIFIER   NULL,
    [CreatedBy]                       NVARCHAR (50)      NOT NULL,
    [CreatedDate]                     DATETIMEOFFSET (7) NOT NULL,
    [UpdatedBy]                       NVARCHAR (50)      NOT NULL,
    [UpdatedDate]                     DATETIMEOFFSET (7) NOT NULL,
    [RowVersion]                      ROWVERSION         NOT NULL,
    [IsDeleted]                       BIT                NOT NULL
	CONSTRAINT [DF_Inspection_IsDeleted] DEFAULT ((0)),
    CONSTRAINT [PK_Inspection] PRIMARY KEY CLUSTERED ([InspectionId] ASC),
	CONSTRAINT [FK_Inspection_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

CREATE NONCLUSTERED INDEX [IX_Inspection] ON [dbo].[Inspection]([InspectionId] ASC);

END
