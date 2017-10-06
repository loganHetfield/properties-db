﻿IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Building')
BEGIN

CREATE TABLE [dbo].[Building] (
    [AirConditioningPresent]             BIT                    NULL,
    [AvailableFlow]                      INT                    NULL,
    [AlarmsMonitoringCompany]            NVARCHAR (50)          NULL,
    [AlarmsMonitoringCompanyPhone]       NVARCHAR (50)          NULL,
    [AtticUseId]                         INT                    NULL,
    [BaseArea]                           INT                    NULL,
    [BaseFlow]                           INT                    NULL,
    [BasementUseId]                      INT                    NULL,
    [BaseSquareFootage]                  INT                    NULL,
    [BelowGradeConstructionId]           INT                    NULL,
    [BuildingId]                         UNIQUEIDENTIFIER   NOT NULL,
	  [BuildingValue]                      BIGINT                 NULL,
    [CoefficientForConstructionType]     DECIMAL (18, 10)       NULL,
    [ConstructionTypeClass]              INT                    NULL,
    [ConstructionTypeId]                 INT                    NULL,
    [CreatedBy]                          NVARCHAR (50)      NOT NULL,
    [CreatedDate]                        DATETIMEOFFSET (7) NOT NULL,
    [DeactivationReason]                 NVARCHAR (100)         NULL,
    [EighthAlarm]                        NVARCHAR (255)         NULL,
    [EndDate]                            DATE                   NULL,
    [ExposureCommFactor]                 INT                    NULL,
    [Exposures]                          NVARCHAR (255)         NULL,
    [ExteriorDoorsId]                    INT                    NULL,
    [ExteriorWallsId]                    INT                    NULL,
    [ExtinguisherMonitoringCompany]      NVARCHAR (50)          NULL,
    [ExtinguisherMonitoringCompanyPhone] NVARCHAR (50)          NULL,
    [FileName]						               NVARCHAR (255)         NULL,
    [FifthAlarm]                         NVARCHAR (255)         NULL,
    [FireDoorsId]                        INT                    NULL,
    [FireLoadId]                         INT                    NULL,
    [FireWallsId]                        INT                    NULL,
    [FireWallsLocation]                  NVARCHAR (255)         NULL,
    [FirstAlarm]                         NVARCHAR (255)         NULL,
    [FourthAlarm]                        NVARCHAR (255)         NULL,
    [HeatingSystemsPresent]              BIT                    NULL,
    [Height]                             INT                    NULL,
    [ImageHeight]					               INT                    NULL,
    [ImageId]						                 UNIQUEIDENTIFIER       NULL,
    [ImageWidth]					               INT                    NULL,
    [InteriorDoorsId]                    INT                    NULL,
    [InteriorWallsId]                    INT                    NULL,
    [IsDeleted]                          BIT                CONSTRAINT [DF_Building_IsDeleted] DEFAULT ((0)) NOT NULL,
    [IsoConstructionCodeId]              INT                    NULL,
    [Latitude]                           DECIMAL (9, 6)         NULL,
    [Length]                             INT                    NULL,
    [Longitude]                          DECIMAL (9, 6)         NULL,
    [MainFloorConstructionId]            INT                    NULL,
    [NameOrNumber]                       NVARCHAR (50)      NOT NULL,
    [NetFireFlow]                        INT                    NULL,
    [Notes]                              NVARCHAR (255)         NULL,
    [NumberOfRoomsOrUnits]               INT                    NULL,
    [NumberOfStoriesAboveGrade]          INT                    NULL,
    [NumberOfStoriesBelowGrade]          INT                    NULL,
    [OccupancyFactor]                    INT                    NULL,
    [PropertyId]                         UNIQUEIDENTIFIER   NOT NULL,
    [RequiredEquipmentAt25Percent]       NVARCHAR (255)         NULL,
    [RequiredEquipmentAt50Percent]       NVARCHAR (255)         NULL,
    [RequiredEquipmentAt75Percent]       NVARCHAR (255)         NULL,
    [RequiredEquipmentAt100Percent]      NVARCHAR (255)         NULL,
    [RequiredFireFlowAt25Percent]        INT                    NULL,
    [RequiredFireFlowAt50Percent]        INT                    NULL,
    [RequiredFireFlowAt75Percent]        INT                    NULL,
    [RequiredFireFlowAt100Percent]       INT                    NULL,
    [RequiredPersonnelAt25Percent]       NVARCHAR (255)         NULL,
    [RequiredPersonnelAt50Percent]       NVARCHAR (255)         NULL,
    [RequiredPersonnelAt75Percent]       NVARCHAR (255)         NULL,
    [RequiredPersonnelAt100Percent]      NVARCHAR (255)         NULL,
    [RoofMaterialId]                     INT                    NULL,
    [RoofTypeId]                         INT                    NULL,
    [RowVersion]                         ROWVERSION         NOT NULL,
    [SearchAt25Percent]                  NVARCHAR (255)         NULL,
    [SearchAt50Percent]                  NVARCHAR (255)         NULL,
    [SearchAt75Percent]                  NVARCHAR (255)         NULL,
    [SearchAt100Percent]                 NVARCHAR (255)         NULL,
    [SecondAlarm]                        NVARCHAR (255)         NULL,
    [SeventhAlarm]                       NVARCHAR (255)         NULL,
    [SideAExits]                         INT                    NULL,
    [SideBExits]                         INT                    NULL,
    [SideCExits]                         INT                    NULL,
    [SideDExits]                         INT                    NULL,
    [SixthAlarm]                         NVARCHAR (255)         NULL,
    [SprinklerFactor]                    INT                    NULL,
    [StagingAreas]                       NVARCHAR (255)         NULL,
    [StartDate]                          DATETIME           NOT NULL,
    [StatusId]                           INT                    NULL,
    [StockId]                            INT                    NULL,
    [Stories]                            INT                    NULL,
    [TestHydrantId]                      NVARCHAR (255)         NULL,
    [ThirdAlarm]                         NVARCHAR (255)         NULL,
    [TotalExits]                         INT                    NULL,
    [TotalFireFlowNeeded]                INT                    NULL,
    [TotalSquareFeet]                    INT                    NULL,
    [UniqueOrSpecialFeatures]            NVARCHAR (255)         NULL,
    [UpdatedBy]                          NVARCHAR (50)      NOT NULL,
    [UpdatedDate]                        DATETIMEOFFSET (7) NOT NULL,
    [UpperFloorConstructionId]           INT                    NULL,
    [Width]                              INT                    NULL

    CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED ([BuildingId] ASC),
    CONSTRAINT [FK_Building_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

CREATE UNIQUE NONCLUSTERED INDEX [IX_Unique_Building_Name]
    ON [dbo].[Building]([PropertyId] ASC, [NameOrNumber] ASC);

END