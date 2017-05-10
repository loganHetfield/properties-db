CREATE TABLE [dbo].[Property] (
    [PropertyId]                      UNIQUEIDENTIFIER   NOT NULL,
    [AgencyId]                        UNIQUEIDENTIFIER   NOT NULL,
    [ContactGroupId]                  UNIQUEIDENTIFIER   NULL,
    [Type]                            INT                NULL,
    [Status]                          INT                NULL,
    [StartDate]                       DATE               NULL,
    [EndDate]                         DATE               NULL,
    [AddressId]                       UNIQUEIDENTIFIER   NULL,
    [Division]                        INT                NULL,
    [FireDistrictBatallion]           INT                NULL,
    [InspectionDistrict]              INT                NULL,
    [Station]                         INT                NULL,
    [CensusTract]                     DECIMAL (18, 2)    NULL,
    [PlannningZone]                   INT                NULL,
    [ZoneType]                        INT                NULL,
    [ParcelId]                        NVARCHAR (50)      NULL,
    [TaxMapNumber]                    NVARCHAR (50)      NULL,
    [PropertyValue]                   DECIMAL (18, 2)    NULL,
    [Notes]                           NVARCHAR (255)     NULL,
    [NumberOrMilepost]                VARCHAR (50)       NOT NULL,
    [StreetPrefix]                    INT                NULL,
    [StreetOrHighway]                 VARCHAR (50)       NOT NULL,
    [StreetType]                      INT                NULL,
    [StreetSuffix]                    INT                NULL,
    [City]                            INT                NOT NULL,
    [State]                           INT                NOT NULL,
    [Zip]                             VARCHAR (10)       NOT NULL,
    [County]                          INT                NOT NULL,
    [Location]                        [sys].[geography]  NULL,
    [Latitude]                        DECIMAL (9, 6)     NULL,
    [Longitude]                       DECIMAL (9, 6)     NULL,
    [CreatedBy]                       NVARCHAR (50)      NOT NULL,
    [CreatedDate]                     DATETIMEOFFSET (7) NOT NULL,
    [UpdatedBy]                       NVARCHAR (50)      NOT NULL,
    [UdatedDate]                      DATETIMEOFFSET (7) NOT NULL,
    [FireConfigMajorVersion]          BIGINT             NOT NULL,
    [FireConfigMinorVeresion]         BIGINT             NOT NULL,
    [FireConfigRevsionVersion]        BIGINT             NOT NULL,
    [FireConfigBundleRevisionVersion] BIT                NOT NULL,
    [FireMdmMajorVersion]             BIGINT             NOT NULL,
    [FireMdmMinorVersion]             BIGINT             NOT NULL,
    [FireMdmRevisionVersion]          BIGINT             NOT NULL,
    CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED ([PropertyId] ASC)
);






GO
CREATE NONCLUSTERED INDEX [IX_Property]
    ON [dbo].[Property]([PropertyId] ASC);

