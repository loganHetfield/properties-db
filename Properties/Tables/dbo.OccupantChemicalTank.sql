IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantChemicalTank')
BEGIN

CREATE TABLE [dbo].[OccupantChemicalTank] (
    [OccupantChemicalTankId] UNIQUEIDENTIFIER NOT NULL,
    [ChemicalId]             UNIQUEIDENTIFIER NULL,
    [TankId]                 UNIQUEIDENTIFIER NULL,
    [OccupantId]             UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_OccupantChemicalTank] PRIMARY KEY CLUSTERED ([OccupantChemicalTankId] ASC),
    CONSTRAINT [FK_OccupantChemicalTank_Chemical] FOREIGN KEY ([ChemicalId]) REFERENCES [dbo].[Chemical] ([ChemicalID]),
    CONSTRAINT [FK_OccupantChemicalTank_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId]),
    CONSTRAINT [FK_OccupantChemicalTank_Tank] FOREIGN KEY ([TankId]) REFERENCES [dbo].[Tank] ([TankId])
);

END