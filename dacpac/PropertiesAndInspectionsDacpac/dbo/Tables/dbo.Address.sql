CREATE TABLE [dbo].[Address] (
    [AddressId]        UNIQUEIDENTIFIER NOT NULL,
    [AddressType]      NCHAR (10)       NULL,
    [NumberOrMilepost] VARCHAR (50)     NULL,
    [StreetPrefix]     INT              NULL,
    [StreetOrHighway]  VARCHAR (50)     NULL,
    [StreetType]       INT              NULL,
    [StreetSuffix]     INT              NULL,
    [City]             INT              NULL,
    [State]            INT              NULL,
    [Zip]              INT              NULL,
    [County]           INT              NULL,
    [Latitude]         INT              NULL,
    [Longitude]        INT              NULL,
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([AddressId] ASC)
);

