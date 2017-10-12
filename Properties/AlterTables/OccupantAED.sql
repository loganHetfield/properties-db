IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'OccupantAED')
BEGIN
    DROP TABLE [OccupantAED]
END