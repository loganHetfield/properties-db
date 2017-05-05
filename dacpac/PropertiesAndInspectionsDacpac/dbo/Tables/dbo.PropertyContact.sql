CREATE TABLE [dbo].[PropertyContact] (
    [PropertyId] UNIQUEIDENTIFIER NOT NULL,
    [ContactId]  UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_PropertyContact] PRIMARY KEY CLUSTERED ([PropertyId] ASC, [ContactId] ASC),
    CONSTRAINT [FK_PropertyContact_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([ContactId]),
    CONSTRAINT [FK_PropertyContact_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

