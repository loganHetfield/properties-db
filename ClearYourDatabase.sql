USE [PropertiesAndInspectionsV1]
GO

-- Attachement

delete [Attachment]

-- Event

delete [EventData]
delete [Event]

-- Image

delete [Image]

-- Chemical & Tank

delete [Tank]
delete [Chemical]

-- Occupant Document

delete [OccupantAccess]
delete [OccupantAED]
delete [OccupantAlarm]
delete [OccupantChemicalTank]
delete [OccupantContact]
delete [OccupantDetector]
delete [OccupantExtinguisherSystem]
delete [OccupantKnoxBox]
delete [OccupantRiser]
delete [OccupantShutOff]
delete [OccupantSprinkler]
delete [OccupantStandpipe]
delete [Occupant]

-- Building Document

delete [BuildingAccess]
delete [BuildingAED]
delete [BuildingAlarm]
delete [BuildingDetector]
delete [BuildingExtinguisherSystem]
delete [BuildingKnoxBox]
delete [BuildingNote]
delete [BuildingRiser]
delete [BuildingShutOff]
delete [BuildingSprinkler]
delete [BuildingStandpipe]
delete [Building]

-- Properties Document

delete [PropertyContactRole]
delete [PropertyContact]
delete [PropertyHydrant]
delete [PropertyNote]
delete [PropertyOtherWaterSource]
delete [PropertySpecialHazard]
delete [Property]