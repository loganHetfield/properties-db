IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Property')
BEGIN

CREATE TABLE [dbo].[Property] (
    [AgencyId]                        UNIQUEIDENTIFIER   NOT NULL,
	[ArePlansInReview]                bit                NULL,
    [CensusTract]                     DECIMAL (18, 2)    NULL,
    [City]                            NVARCHAR (255)     NOT NULL,
    [CommonOrPreviousNames]			  nvarchar(255)      NULL,
	[County]                          NVARCHAR (255)     NULL,
    [CreatedBy]                       NVARCHAR (50)      NOT NULL,
    [CreatedDate]                     DATETIMEOFFSET (7) NOT NULL,
    [DeactivationReason]              NVARCHAR (1023)    NULL,
    [DivisionId]                      INT                NULL,
    [EndDate]                         DATE               NULL,
    [FileName]						  NVARCHAR (255)     NULL,
    [FireConfigMajorVersion]          BIGINT             NOT NULL,
    [FireConfigMinorVeresion]         BIGINT             NOT NULL,
    [FireConfigRevsionVersion]        BIGINT             NOT NULL,
    [FireConfigBundleRevisionVersion] BIGINT             NOT NULL,
    [FireDistrictBattalionId]         INT                NULL,
    [FireMdmMajorVersion]             BIGINT             NOT NULL,
    [FireMdmMinorVersion]             BIGINT             NOT NULL,
    [FireMdmRevisionVersion]          BIGINT             NOT NULL,
    [ImageHeight]					  INT                NULL,
    [ImageId]						  UNIQUEIDENTIFIER   NULL,
    [ImageWidth]					  INT                NULL,
    [InspectionDistrictId]            INT                NULL, 
	[IsConstructionInProgress]        bit                NULL,
    [IsDeleted]                       BIT                CONSTRAINT [DF_Property_IsDeleted] DEFAULT ((0)) NOT NULL,
    [Latitude]                        DECIMAL (9, 6)     NULL,
    [Location]                        [sys].[geography]  NULL,
    [Longitude]                       DECIMAL (9, 6)     NULL,
    [NumberOrMilepost]                NVARCHAR (50)      NOT NULL,
    [ParcelId]                        NVARCHAR (50)      NULL,
    [PlanningZoneId]                  INT                NULL,
    [PropertyId]                      UNIQUEIDENTIFIER   NOT NULL,
    [PropertyIdentity]				  nvarchar(255)      NULL,
	[PropertyValue]                   DECIMAL (18, 2)    NULL,
    [RowVersion]                      ROWVERSION         NOT NULL,
	[StartDate]                       DATE               NULL,
    [State]							  nvarchar(255)      NULL,
    [StateId]                         INT                NOT NULL,
    [StationId]                       INT                NULL,
    [StatusId]                        INT                NULL,
    [StreetOrHighway]                 NVARCHAR (100)     NOT NULL,
	[StreetPrefix]					  nvarchar(255)      NULL,
    [StreetPrefixId]                  INT                NULL,
    [StreetSuffix]					  nvarchar(255)      NULL,
    [StreetSuffixId]                  INT                NULL,	
    [StreetType]					  nvarchar(255)      NULL,
    [StreetTypeId]                    INT                NULL,
    [TaxMapNumber]                    NVARCHAR (50)      NULL,
    [TypeId]                          INT                NULL,
    [UpdatedBy]                       NVARCHAR (50)      NOT NULL,
    [UpdatedDate]                     DATETIMEOFFSET (7) NOT NULL,
    [Zip]                             NVARCHAR (50)      NOT NULL,
    [ZoneTypeId]                      INT                NULL

    CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED ([PropertyId] ASC)
);

CREATE NONCLUSTERED INDEX [IX_Property] ON [dbo].[Property]([PropertyId] ASC);

END

                                                                                                                                                                                                                                                                                                                                                                                                                                                            