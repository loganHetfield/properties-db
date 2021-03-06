﻿IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertiesWithCollapsedOccupantsView')
BEGIN
	DROP VIEW [dbo].[PropertiesWithCollapsedOccupantsView]
END
GO

CREATE VIEW [dbo].[PropertiesWithCollapsedOccupantsView]
AS
SELECT        
	prop.[PropertyId] as "PropertyId", 
	prop.[AgencyId] as "AgencyId",
	prop.[Location] as "GeoLocation",
	prop.[NumberOrMilepost] as "StreetNumber",
	prop.[StreetSuffix] as "StreetPrefix", 
	prop.[StreetOrHighway] as "StreetName",
	prop.[StreetType] as "StreetType",
	prop.[StreetSuffix] as "StreetSuffix",
	prop.[County] as "County",
	prop.[City] as "City",
	prop.[State] as "State",
	prop.[Zip] as "PostalCode",
	prop.StreetPrefixId, 
	prop.StreetTypeId,
	prop.StreetSuffixId,
	prop.StateId, 
	'[' + STUFF
	((
		SELECT ',"' + REPLACE(REPLACE(occ1.[OccupantName], '\', '\\'), '"', '\"') + '"'
		FROM dbo.[Occupant] AS occ1
		WHERE prop.[PropertyId] = occ1.[PropertyId]
		FOR XML PATH(''), TYPE ).value('.[1]', 'nvarchar(max)'), 
		1, 
		1, 
		''
	) + ']' AS "OccupantNames",
	'[' + STUFF
	((
		SELECT ',{"OccupantId":"' + CONVERT(NVARCHAR(MAX), occ2.[OccupantId]) + '","OccupantName":"' + REPLACE(REPLACE(occ2.[OccupantName], '\', '\\'), '"', '\"') + '"}'
		FROM dbo.[Occupant] AS occ2
		WHERE prop.[PropertyId] = occ2.[PropertyId]
		FOR XML PATH(''), TYPE ).value('.[1]', 'nvarchar(max)'), 
		1, 
		1, 
		''
	) + ']' AS "OccupantMapping",
	(SELECT CAST(MAX(ver.[RowVersion]) AS BIGINT) FROM (SELECT prop.[RowVersion] UNION SELECT occ3.[RowVersion] FROM dbo.[Occupant] AS occ3 ) ver) AS "Watermark",
	prop.[IsDeleted]	

FROM dbo.[Property] AS prop