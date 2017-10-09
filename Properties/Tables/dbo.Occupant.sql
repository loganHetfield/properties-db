﻿IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Occupant')
BEGIN

CREATE TABLE [dbo].[Occupant] (
    [AlarmsMonitoringCompany]            NVARCHAR (50)      NULL,
    [AlarmsMonitoringCompanyPhone]       NVARCHAR (50)      NULL,
    [BuildingId]                         UNIQUEIDENTIFIER   NOT NULL,
    [BuildingNameNumber]				 NVARCHAR (255)     NULL,
	[CertificateOfOccupancyDateOfIssue]  DATE               NULL,
    [CertificateOfOccupancyIssued]       BIT                NULL,
    [ContentValue]                       DECIMAL (18, 2)    NULL,
    [CreatedBy]                          NVARCHAR (50)      NOT NULL,
    [CreatedDate]                        DATETIMEOFFSET (7) NOT NULL,
    [DeactivationReason]                 NVARCHAR (1023)    NULL,
    [DoesSecurityCarryKeys]              BIT                NULL,
    [EmergencyIncidentPlayPresent]       BIT                NULL,
    [ExtinguisherMonitorCompany]         NVARCHAR (50)      NULL,
    [ExtinguisherMonitorCompanyPhone]    NVARCHAR (50)      NULL,
    [FireDoorsType]                      INT                NULL,
    [FireLoad]                           INT                NULL,
    [FireWalls]                          INT                NULL,
    [HasRestrainedOccupants]			 BIT                NULL,
    [Height]                             INT                NULL,
    [HoursOfOPerationEnd]                TIME (7)           NULL,
    [HoursOfOperationStart]              TIME (7)           NULL,
    [InteriorDoorsType]                  INT                NULL,
    [InteriorWallsType]                  INT                NULL,
    [IsDeleted]                          BIT                CONSTRAINT [DF_Occupant_IsDeleted] DEFAULT ((0)) NOT NULL,
    [Length]                             INT                NULL,
    [LocalOccCode]                       INT                NULL,
    [MixedUse]                           INT                NULL,
    [NFPAOccCode]                        INT                NULL,
    [NFPAUseCode]                        INT                NULL,
    [Notes]                              NVARCHAR (255)     NULL,
    [NumberOfEmployees]                  INT                NULL,
    [NumberOfOccupantsWithSpecialNeeds]  INT                NULL,
    [NumberOfResidentsOrOccupants]       INT                NULL,
    [OccupancyClassicfication]           INT                NULL,
    [OccupancyEndDate]                   DATE               NULL,
    [OccupancyLoadByHours800To1700]      INT                NULL,
    [OccupancyLoadByHours1700To2300]     INT                NULL,
    [OccupancyLoadByHours2300To800]      INT                NULL,
    [OccupancyPermitRequired]            BIT                NULL,
    [OccupancyLoadRated]                 INT                NULL,
    [OccupancyStartDate]                 DATE               NOT NULL,
    [OccupantId]                         UNIQUEIDENTIFIER   NOT NULL,
    [OccupantName]                       NVARCHAR (50)      NOT NULL,
    [OccupantsNonAmbulatoryOrRestrained] BIT                NULL,
    [OccupantUse]                        INT                NULL,
    [OpenToPublicEnd]                    TIME (7)           NULL,
    [OpenToPublicStart]                  TIME (7)           NULL,
    [PreviousAndPartialCOIssued]         NVARCHAR (255)     NULL,
    [PropertyId]                         UNIQUEIDENTIFIER   NOT NULL,
	[ResidentialOccupantsPresent]        BIT                NULL,
	[RowVersion]                         ROWVERSION         NOT NULL,
    [SecurityType]                       INT                NULL,
    [SpecialNeedsOccupantsPressent]      BIT                NULL,
    [StandardIndustrialClassification]   INT                NULL,
    [StateOccCode]                       INT                NULL,
    [Status]                             INT                NULL,
    [SuiteNameNumber]					 NVARCHAR (255)     NULL,
    [SuiteUnitLocation]                  NVARCHAR (50)      NULL,
    [TotalExits]                         INT                NULL,
    [TotalSquareFootage]                 INT                NULL,
    [Type]                               INT                NULL,
    [Width]                              INT                NULL,
    [UpdatedBy]                          NVARCHAR (50)      NOT NULL,
    [UpdatedDate]                        DATETIMEOFFSET (7) NOT NULL,
    
    CONSTRAINT [PK_Occupant] PRIMARY KEY CLUSTERED ([OccupantId] ASC),
    CONSTRAINT [FK_Occupant_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId]),
    CONSTRAINT [FK_Occupant_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

CREATE NONCLUSTERED INDEX [IX_Occupant_UniqueOccupantSuiteForBuilding] ON [dbo].[Occupant]([BuildingId] ASC, [OccupantName] ASC, [SuiteUnitLocation] ASC);

END

