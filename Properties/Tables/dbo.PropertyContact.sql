CREATE TABLE [dbo].[PropertyContact] (
    [PropertyContactId]       UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]              UNIQUEIDENTIFIER NOT NULL,
    [FirstName]               NVARCHAR (50)    NULL,
    [LastName]                NVARCHAR (50)    NULL,
    [BusinessName]            NVARCHAR (50)    NULL,
    [IsPrimaryContact]        BIT              NULL,
    [IsEmergencyContact]      BIT              NULL,
    [Phone]                   NVARCHAR (50)    NULL,
    [Email]                   NVARCHAR (1024)  NULL,
    [IsAddressSameAsProperty] BIT              NULL,
    [NumberOrMilepost]        NVARCHAR (50)    NOT NULL,
    [StreetPrefixId]          INT              NULL,
    [StreetOrHighway]         NVARCHAR (100)   NOT NULL,
    [StreetTypeId]            INT              NULL,
    [StreetSuffixId]          INT              NULL,
    [City]                    NVARCHAR (255)   NOT NULL,
    [StateId]                 INT              NOT NULL,
    [Zip]                     NVARCHAR (50)    NOT NULL,
    [County]                  NVARCHAR (255)   NULL,
    CONSTRAINT [PK_PropertyContact] PRIMARY KEY CLUSTERED ([PropertyContactId] ASC),
    CONSTRAINT [FK_PropertyContact_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);







