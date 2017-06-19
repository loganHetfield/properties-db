CREATE TABLE [dbo].[Building] (
    [BuildingId]                         UNIQUEIDENTIFIER   NOT NULL,
    [PropertyId]                         UNIQUEIDENTIFIER   NOT NULL,
    [Name]                               NVARCHAR (50)      NULL,
    [Status]                             INT                NULL,
    [StartDate]                          DATETIMEOFFSET (7) NOT NULL,
    [EndDate]                            DATE               NULL,
    [Length]                             INT                NULL,
    [Width]                              INT                NULL,
    [Height]                             INT                NULL,
    [TotalSquareFeet]                    INT                NULL,
    [TotalExits]                         INT                NULL,
    [InteriorWallsType]                  INT                NULL,
    [InteriorDoorsType]                  INT                NULL,
    [FireDoorsPresent]                   BIT                NULL,
    [FireDoorsType]                      INT                NULL,
    [FireLoad]                           INT                NULL,
    [FireWalls]                          INT                NULL,
    [UniqueOrSpecialFeatures]            NVARCHAR (255)     NULL,
    [NumberOfStoriesAboveGrade]          INT                NULL,
    [NumberOfStoriesBelowGrade]          INT                NULL,
    [NumberOfRoomsOrUnits]               INT                NULL,
    [BaseSquareFootage]                  INT                NULL,
    [SideAExits]                         INT                NULL,
    [SideBExits]                         INT                NULL,
    [SideCExits]                         INT                NULL,
    [SideDExits]                         INT                NULL,
    [ConstructionType]                   INT                NULL,
    [IsoConstructionCode]                INT                NULL,
    [HeatingSystemsPresent]              BIT                NULL,
    [AirConditioningPresent]             BIT                NULL,
    [RoofType]                           INT                NULL,
    [MainFloorConstructionType]          INT                NULL,
    [UpperFloorConstructionType]         INT                NULL,
    [BelowGradeConstructionType]         INT                NULL,
    [ExteriorWallsType]                  INT                NULL,
    [ExteriorDoorsType]                  INT                NULL,
    [Stock]                              INT                NULL,
    [BasementUse]                        INT                NULL,
    [AtticUse]                           INT                NULL,
    [ExtinguisherMonitoringCompany]      NVARCHAR (50)      NULL,
    [ExtinguisherMonitoringCompanyPhone] NVARCHAR (50)      NULL,
    [AlarmsMonitoringCompany]            NVARCHAR (50)      NULL,
    [AlarmsMonitoringCompanyPhone]       NVARCHAR (50)      NULL,
    [CoefficientForConstructionType]     DECIMAL (18, 10)   NULL,
    [ConstructionTypeClass]              INT                NULL,
    [BaseArea]                           INT                NULL,
    [Stories]                            INT                NULL,
    [BaseFlow]                           INT                NULL,
    [OccupancyFactor]                    INT                NULL,
    [SprinklerFactor]                    INT                NULL,
    [ExposureCommFactor]                 INT                NULL,
    [RequiredFireFlowAt25Percent]        INT                NULL,
    [RequiredFireFlowAt50Percent]        INT                NULL,
    [RequiredFireFlowAt75Percent]        INT                NULL,
    [RequiredFireFlowAt100Percent]       INT                NULL,
    [FirstAlarm]                         NVARCHAR (255)     NULL,
    [SecondAlarm]                        NVARCHAR (255)     NULL,
    [ThirdAlarm]                         NVARCHAR (255)     NULL,
    [FourthAlarm]                        NVARCHAR (255)     NULL,
    [FIfthAlarm]                         NVARCHAR (255)     NULL,
    [SixthAlarm]                         NVARCHAR (255)     NULL,
    [SeventhAlarm]                       NVARCHAR (255)     NULL,
    [EigthAlarm]                         NVARCHAR (255)     NULL,
    [StagingAreas]                       NVARCHAR (255)     NULL,
    [Exposures]                          NVARCHAR (255)     NULL,
    [RequiredPersonnelAt25Percent]       NVARCHAR (255)     NULL,
    [RequiredPersonnelAt50Percent]       NVARCHAR (255)     NULL,
    [RequiredPersonnelAt75Percent]       NVARCHAR (255)     NULL,
    [RequiredPersonnelAt100Percent]      NVARCHAR (255)     NULL,
    [RequiredEquipmentAt25Percent]       NVARCHAR (255)     NULL,
    [RequiredEquipmentAt50Percent]       NVARCHAR (255)     NULL,
    [RequiredEquipmentAt75Percent]       NVARCHAR (255)     NULL,
    [RequiredEquipmentAt100Percent]      NVARCHAR (255)     NULL,
    [SearchAt25Percent]                  NVARCHAR (255)     NULL,
    [SearchAt50Percent]                  NVARCHAR (255)     NULL,
    [SearchAt75Percent]                  NVARCHAR (255)     NULL,
    [SearchAt100Percent]                 NVARCHAR (255)     NULL,
    [Notes]                              NVARCHAR (255)     NULL,
    [RowVersion]                         ROWVERSION         NOT NULL,
    [IsDeleted]                          BIT                CONSTRAINT [DF_Building_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED ([BuildingId] ASC),
    CONSTRAINT [FK_Building_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);
















GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Unique_Building_Name]
    ON [dbo].[Building]([PropertyId] ASC, [Name] ASC);

