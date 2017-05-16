CREATE TABLE [dbo].[ShutOff] (
    [ShutOffId]   UNIQUEIDENTIFIER NOT NULL,
    [StructureId] UNIQUEIDENTIFIER NOT NULL,
    [Type]        INT              NULL,
    [Location]    VARCHAR (50)     NULL,
    CONSTRAINT [PK_ShutOff] PRIMARY KEY CLUSTERED ([ShutOffId] ASC)
);



