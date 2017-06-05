

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
                STUFF
                ((
                                SELECT ',"' + REPLACE(REPLACE(occ2.[OccupantName], '\', '\\'), '"', '\"') + '",' + CONVERT(NVARCHAR(MAX), occ2.[OccupantId])
        FROM dbo.[Occupant] AS occ2
        WHERE prop.[PropertyId] = occ2.[PropertyId]
        FOR XML PATH(''), TYPE ).value('.[1]', 'nvarchar(max)'), 
                                1, 
                                1, 
                                ''
                ) AS "OccupantMapping",
                CAST(prop.[RowVersion] AS BIGINT) + CAST((SELECT MAX(occ3.[RowVersion]) FROM dbo.[Occupant] AS occ3 WHERE prop.[PropertyId] = occ3.[PropertyId]) AS BIGINT) AS "Watermark",
                CASE WHEN prop.[IsDeleted] = 1 THEN 'True' 
                                ELSE (SELECT CASE WHEN EXISTS (SELECT 1 FROM [dbo].[Occupant] as occ4 WHERE prop.[PropertyId] = occ4.[PropertyId] AND [IsDeleted] = 1) THEN 'True' ELSE 'False' END) 
                END AS "IsDeleted"
                
FROM dbo.[Property] AS prop