CREATE TABLE [dbo].[Occupant] (
    [OccupantId]                         UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]                         UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]                         UNIQUEIDENTIFIER NOT NULL,
    [OccupantName]                       VARCHAR (50)     NOT NULL,
    [SuiteUnitLocation]                  VARCHAR (50)     NULL,
    [Status]                             INT              NULL,
    [OccupancyStartDate]                 DATE             NOT NULL,
    [OccupancyEndDate]                   DATE             NULL,
    [Type]                               INT              NULL,
    [OccupantUse]                        INT              NULL,
    [MixedUse]                           INT              NULL,
    [ContentValue]                       DECIMAL (18, 2)  NULL,
    [SecurityType]                       INT              NULL,
    [DoesSecurityCarryKeys]              BIT              NULL,
    [ExtinguisherMonitorCompany]         VARCHAR (50)     NULL,
    [ExtinguisherMonitorCompanyPhone]    VARCHAR (50)     NULL,
    [AlarmsMonitoringCompany]            VARCHAR (50)     NULL,
    [AlarmsMonitoringCompanyPhone]       VARCHAR (50)     NULL,
    [OccupancyClassicfication]           INT              NULL,
    [StandardIndustrialClassification]   INT              NULL,
    [OccupancyLoadRated]                 INT              NULL,
    [ResidentialOccupantsPresent]        BIT              NULL,
    [NumberOfResidentsOrOccupants]       INT              NULL,
    [SpecialNeedsOccupantsPressent]      BIT              NULL,
    [NumberOfOccupantsWithSpecialNeeds]  INT              NULL,
    [OccupancyLoadByHours800To1700]      INT              NULL,
    [OccupancyLoadByHours1700To2300]     INT              NULL,
    [OccupancyLoadByHours2300To800]      INT              NULL,
    [OccupantsNonAmbulatoryOrRestrained] BIT              NULL,
    [HoursOfOperationStart]              TIME (7)         NULL,
    [HoursOfOPerationEnd]                TIME (7)         NULL,
    [OpenToPublicStart]                  TIME (7)         NULL,
    [OpenToPublicEnd]                    TIME (7)         NULL,
    [NumberOfEmployees]                  INT              NULL,
    [EmergencyIncidentPlayPresent]       BIT              NULL,
    [OccupancyPermitRequired]            BIT              NULL,
    [NFPAUseCode]                        INT              NULL,
    [NFPAOccCode]                        INT              NULL,
    [StateOccCode]                       INT              NULL,
    [LocalOccCode]                       INT              NULL,
    [CertificateOfOccupancyIssued]       BIT              NULL,
    [CertificateOfOccupancyDateOfIssue]  DATE             NULL,
    [PreviousAndPartialCOIssued]         VARCHAR (255)    NULL,
    [Length]                             INT              NULL,
    [Width]                              INT              NULL,
    [Height]                             INT              NULL,
    [TotalSquareFootage]                 INT              NULL,
    [TotalExits]                         INT              NULL,
    [InteriorWallsType]                  INT              NULL,
    [InteriorDoorsType]                  INT              NULL,
    [FireDoorsPresent]                   BIT              NULL,
    [FireDoorsType]                      INT              NULL,
    [FireLoad]                           INT              NULL,
    [FireWalls]                          INT              NULL,
    [Notes]                              VARCHAR (255)    NULL,
    [RowVersion]                         ROWVERSION       NOT NULL,
    [IsDeleted]                          BIT              CONSTRAINT [DF_Occupant_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Occupant] PRIMARY KEY CLUSTERED ([OccupantId] ASC),
    CONSTRAINT [FK_Occupant_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId]),
    CONSTRAINT [FK_Occupant_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);














GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Occupant_UniqueOccupantSuiteForBuilding]
    ON [dbo].[Occupant]([BuildingId] ASC, [OccupantName] ASC, [SuiteUnitLocation] ASC);

