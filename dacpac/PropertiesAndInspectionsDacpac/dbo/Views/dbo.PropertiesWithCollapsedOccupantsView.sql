
CREATE VIEW [dbo].[PropertiesWithCollapsedOccupantsView]
AS
SELECT        
	prop.[PropertyId] as "PropertyId", 
	prop.[AgencyId] as "AgencyId",
	prop.[Location] as "GeoLocation",
	prop.[NumberOrMilepost] as "StreetNumber",
	null as "StreetPrefix", 
	prop.[StreetOrHighway] as "StreetName",
	null as "StreetType",
	null as "StreetSuffix",
	prop.[County] as "County",
	prop.[City] as "City",
	null as "State",
	prop.[Zip] as "PostalCode",
	prop.[StreetPrefix] as "StreetPrefixId", 
	prop.[StreetType] as "StreetTypeId",
	prop.[StreetSuffix] as "StreetSuffixId",
	prop.[State] as "StateId", 
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
		SELECT ',["' + REPLACE(REPLACE(occ2.[OccupantName], '\', '\\'), '"', '\"') + '","' + CONVERT(NVARCHAR(MAX), occ2.[OccupantId]) + '"]'
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