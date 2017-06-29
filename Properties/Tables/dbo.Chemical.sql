IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Chemical')
BEGIN

CREATE TABLE [dbo].[Chemical] (
    [ChemicalID]                 UNIQUEIDENTIFIER NOT NULL,
    [Chemical]                   UNIQUEIDENTIFIER NULL,
    [MaxUnitsStored]             NVARCHAR (50)    NULL,
    [UnitType]                   INT              NULL,
    [AverageStored]              NVARCHAR (50)    NULL,
    [ChemicalLocation]           NVARCHAR (50)    NULL,
    [StorageType]                NVARCHAR (50)    NULL,
    [IsPressureHazard]           BIT              NULL,
    [IsReactiveHazard]           BIT              NULL,
    [IsAcuteHazard]              BIT              NULL,
    [IsChronicHazard]            BIT              NULL,
    [IsMsdsOnSite]               BIT              NULL,
    [MaxDailyAmount]             NVARCHAR (50)    NULL,
    [PhysicalState]              INT              NULL,
    [StoragePressure]            NVARCHAR (50)    NULL,
    [Temperature]                NVARCHAR (50)    NULL,
    [DaysOnSite]                 NVARCHAR (50)    NULL,
    [AnnualUsage]                NVARCHAR (50)    NULL,
    [SiteSpecificConsiderations] NVARCHAR (50)    NULL,
    [Container]                  INT              NULL,
    [NumberOfContaineres]        INT              NULL,
    CONSTRAINT [PK_Chemical] PRIMARY KEY CLUSTERED ([ChemicalID] ASC)
);

END

