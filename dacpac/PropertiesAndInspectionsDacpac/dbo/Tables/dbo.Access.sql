CREATE TABLE [dbo].[Access] (
    [AccessId]    UNIQUEIDENTIFIER NOT NULL,
    [StructureId] UNIQUEIDENTIFIER NOT NULL,
    [Type]        INT              NULL,
    [Location]    VARCHAR (50)     NULL,
    CONSTRAINT [PK_Access] PRIMARY KEY CLUSTERED ([AccessId] ASC)
);



