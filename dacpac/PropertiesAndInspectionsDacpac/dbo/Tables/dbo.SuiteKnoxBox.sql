CREATE TABLE [dbo].[SuiteKnoxBox] (
    [SuiteKnoxBoxId] UNIQUEIDENTIFIER NOT NULL,
    [SuiteId]        UNIQUEIDENTIFIER NOT NULL,
    [Location]       VARCHAR (50)     NULL,
    CONSTRAINT [PK_SuiteKnoxBox] PRIMARY KEY CLUSTERED ([SuiteKnoxBoxId] ASC)
);

