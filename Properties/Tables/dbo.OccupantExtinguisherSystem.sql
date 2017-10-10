IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantExtinguisherSystem')
BEGIN

CREATE TABLE [dbo].[OccupantExtinguisherSystem] (
    [AESShutoff]                    [NVARCHAR](50)         NULL,
    [CertificationDate]             [DATE]                 NULL,
    [CertificationNumber]           [NVARCHAR](50)         NULL,
    [ExtinguisherInspectionDate]    [DATE]                 NULL,
    [ExtinguishingSystemId]         [INT]                  NULL,
    [ExtinguishingSystemLocation]   [NVARCHAR](50)         NULL,    
    [FileName]	                    [NVARCHAR](255)	       NULL,
		[ImageHeight]	                  [INT]	                 NULL,
		[ImageId]	                      [UNIQUEIDENTIFIER]	   NULL,
		[ImageWidth]	                  [INT] 	               NULL,
    [OccupantExtinguisherSystemsId] [UNIQUEIDENTIFIER] NOT NULL,
    [OccupantId]                    [UNIQUEIDENTIFIER] NOT NULL,    
		[SerialNumber]	                [NVARCHAR](100)	       NULL,
		[TestDate]                      [DATE]                 NULL,
    [TestTypeId]                    [INT]                  NULL,
		[ThumbImageId]	                [UNIQUEIDENTIFIER]	   NULL,
    CONSTRAINT [PK_OccupantExtinguisherSystem] PRIMARY KEY CLUSTERED ([OccupantExtinguisherSystemsId] ASC),
    CONSTRAINT [FK_OccupantExtinguisherSystem_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END