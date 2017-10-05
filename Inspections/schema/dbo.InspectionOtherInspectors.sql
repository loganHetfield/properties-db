IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'InspectionOtherInspectors')
BEGIN

CREATE TABLE [dbo].[InspectionOtherInspectors] (
	[OtherInspectorId]                UNIQUEIDENTIFIER NOT NULL,
	[InspectionId]                    UNIQUEIDENTIFIER NOT NULL,
	[AgencyPersonId]                  UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_InspectionOtherInspectors] PRIMARY KEY CLUSTERED ([OtherInspectorId] ASC),
	CONSTRAINT [FK_InspectionOtherInspectors_Inspection] FOREIGN KEY([InspectionId]) REFERENCES [dbo].[Inspection] ([InspectionId])
);

CREATE NONCLUSTERED INDEX [IX_InspectionOtherInspectors] ON [dbo].[InspectionOtherInspectors] ([OtherInspectorId] ASC);

END
