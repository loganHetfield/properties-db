﻿CREATE TABLE [dbo].[Building] (
    [BuildingId]                         UNIQUEIDENTIFIER   NOT NULL,
    [PropertyId]                         UNIQUEIDENTIFIER   NOT NULL,
    [Name]                               VARCHAR (50)       NULL,
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
    [UniqueOrSpecialFeatures]            VARCHAR (255)      NULL,
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
    [ExtinguisherMonitoringCompany]      VARCHAR (50)       NULL,
    [ExtinguisherMonitoringCompanyPhone] VARCHAR (50)       NULL,
    [AlarmsMonitoringCompany]            VARCHAR (50)       NULL,
    [AlarmsMonitoringCompanyPhone]       VARCHAR (50)       NULL,
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
    [FirstAlarm]                         VARCHAR (255)      NULL,
    [SecondAlarm]                        VARCHAR (255)      NULL,
    [ThirdAlarm]                         VARCHAR (255)      NULL,
    [FourthAlarm]                        VARCHAR (255)      NULL,
    [FIfthAlarm]                         VARCHAR (255)      NULL,
    [SixthAlarm]                         VARCHAR (255)      NULL,
    [SeventhAlarm]                       VARCHAR (255)      NULL,
    [EigthAlarm]                         VARCHAR (255)      NULL,
    [StagingAreas]                       VARCHAR (255)      NULL,
    [Exposures]                          VARCHAR (255)      NULL,
    [RequiredPersonnelAt25Percent]       VARCHAR (255)      NULL,
    [RequiredPersonnelAt50Percent]       VARCHAR (255)      NULL,
    [RequiredPersonnelAt75Percent]       VARCHAR (255)      NULL,
    [RequiredPersonnelAt100Percent]      VARCHAR (255)      NULL,
    [RequiredEquipmentAt25Percent]       VARCHAR (255)      NULL,
    [RequiredEquipmentAt50Percent]       VARCHAR (255)      NULL,
    [RequiredEquipmentAt75Percent]       VARCHAR (255)      NULL,
    [RequiredEquipmentAt100Percent]      VARCHAR (255)      NULL,
    [SearchAt25Percent]                  VARCHAR (255)      NULL,
    [SearchAt50Percent]                  VARCHAR (255)      NULL,
    [SearchAt75Percent]                  VARCHAR (255)      NULL,
    [SearchAt100Percent]                 VARCHAR (255)      NULL,
    [Notes]                              VARCHAR (255)      NULL,
    [RowVersion]                         ROWVERSION         NOT NULL,
    [IsDeleted]                          BIT                CONSTRAINT [DF_Building_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED ([BuildingId] ASC),
    CONSTRAINT [FK_Building_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);














GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Unique_Building_Name]
    ON [dbo].[Building]([PropertyId] ASC, [Name] ASC);

