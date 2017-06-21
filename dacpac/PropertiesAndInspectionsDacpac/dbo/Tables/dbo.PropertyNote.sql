CREATE TABLE [dbo].[PropertyNote] (
    [PropertyNoteId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]     UNIQUEIDENTIFIER NOT NULL,
    [Note]           VARCHAR (255)    NULL,
    CONSTRAINT [PK_PropertyNote] PRIMARY KEY CLUSTERED ([PropertyNoteId] ASC),
    CONSTRAINT [FK_PropertyNote_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

