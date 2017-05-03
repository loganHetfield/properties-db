CREATE TABLE [dbo].[Property] (
    [PropertyId]            UNIQUEIDENTIFIER NOT NULL,
    [ContactGroupId]        UNIQUEIDENTIFIER NULL,
    [Type]                  INT              NULL,
    [Status]                INT              NULL,
    [StartDate]             DATE             NULL,
    [EndDate]               DATE             NULL,
    [AddressId]             UNIQUEIDENTIFIER NULL,
    [Division]              INT              NULL,
    [FireDistrictBatallion] INT              NULL,
    [InspectionDistrict]    INT              NULL,
    [Station]               INT              NULL,
    [CensusTract]           DECIMAL (18, 2)  NULL,
    [PlannningZone]         INT              NULL,
    [ZoneType]              INT              NULL,
    [ParcelId]              NVARCHAR (50)    NULL,
    [TaxMapNumber]          NVARCHAR (50)    NULL,
    [PropertyValue]         DECIMAL (18, 2)  NULL,
    [Notes]                 NVARCHAR (255)   NULL,
    CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED ([PropertyId] ASC),
    CONSTRAINT [FK_Property_Address] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([AddressId]),
    CONSTRAINT [FK_Property_ContactGroup] FOREIGN KEY ([ContactGroupId]) REFERENCES [dbo].[ContactGroup] ([ContactGroupId])
);

