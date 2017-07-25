IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Property')
BEGIN

CREATE TABLE [dbo].[Property] (
    [PropertyId]                      UNIQUEIDENTIFIER   NOT NULL,
    [AgencyId]                        UNIQUEIDENTIFIER   NOT NULL,
    [TypeId]                          INT                NULL,
    [StatusId]                        INT                NULL,
    [StartDate]                       DATE               NULL,
    [EndDate]                         DATE               NULL,
    [DivisionId]                      INT                NULL,
    [FireDistrictBattalionId]         INT                NULL,
    [InspectionDistrictId]            INT                NULL,
    [StationId]                       INT                NULL,
    [CensusTract]                     DECIMAL (18, 2)    NULL,
    [PlanningZoneId]                  INT                NULL,
    [ZoneTypeId]                      INT                NULL,
    [ParcelId]                        NVARCHAR (50)      NULL,
    [TaxMapNumber]                    NVARCHAR (50)      NULL,
    [PropertyValue]                   DECIMAL (18, 2)    NULL,
    [NumberOrMilepost]                NVARCHAR (50)      NOT NULL,
    [StreetPrefixId]                  INT                NULL,
    [StreetOrHighway]                 NVARCHAR (100)     NOT NULL,
    [StreetTypeId]                    INT                NULL,
    [StreetSuffixId]                  INT                NULL,
    [City]                            NVARCHAR (255)     NOT NULL,
    [StateId]                         INT                NOT NULL,
    [Zip]                             NVARCHAR (50)      NOT NULL,
    [County]                          NVARCHAR (255)     NULL,
    [Latitude]                        DECIMAL (9, 6)     NULL,
    [Longitude]                       DECIMAL (9, 6)     NULL,
    [Location]                        [sys].[geography]  NULL,
    [CreatedBy]                       NVARCHAR (50)      NOT NULL,
    [CreatedDate]                     DATETIMEOFFSET (7) NOT NULL,
    [UpdatedBy]                       NVARCHAR (50)      NOT NULL,
    [UpdatedDate]                     DATETIMEOFFSET (7) NOT NULL,
    [FireConfigMajorVersion]          BIGINT             NOT NULL,
    [FireConfigMinorVeresion]         BIGINT             NOT NULL,
    [FireConfigRevsionVersion]        BIGINT             NOT NULL,
    [FireConfigBundleRevisionVersion] BIGINT             NOT NULL,
    [FireMdmMajorVersion]             BIGINT             NOT NULL,
    [FireMdmMinorVersion]             BIGINT             NOT NULL,
    [FireMdmRevisionVersion]          BIGINT             NOT NULL,
    [RowVersion]                      ROWVERSION         NOT NULL,
    [IsDeleted]                       BIT                
	CONSTRAINT [DF_Property_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED ([PropertyId] ASC)
);

CREATE NONCLUSTERED INDEX [IX_Property] ON [dbo].[Property]([PropertyId] ASC);

END

