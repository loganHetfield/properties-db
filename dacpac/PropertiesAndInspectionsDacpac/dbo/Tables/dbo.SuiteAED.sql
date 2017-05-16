CREATE TABLE [dbo].[SuiteAED] (
    [SuiteAedId]      UNIQUEIDENTIFIER NOT NULL,
    [SuiteId]         UNIQUEIDENTIFIER NOT NULL,
    [FloorNameNumber] VARCHAR (50)     NULL,
    [Location]        VARBINARY (50)   NULL,
    CONSTRAINT [PK_SuiteAED] PRIMARY KEY CLUSTERED ([SuiteAedId] ASC)
);

