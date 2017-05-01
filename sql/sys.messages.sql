-- PLEASE READ: 
-- Do not UPDATE these messages. If you would like to update the text, please use a new message number 
-- as other apps could be dependent on the existing message format and/or text.
--
-- When adding new messages, please be generic enough that other applications can use the message too
-- (no hard-coded values or references).
--
-- Please start all message text with '%s :: '. ADO does not bubble up inner procedure names, so this is the 
-- only way the services can see where errors in nested procedure calls originated.
--
-- ENJOY!

EXEC sp_addmessage @msgnum = 50001, @severity = 10, @msgtext = N'%s :: %s', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50002, @severity = 10, @msgtext = N'%s :: %s', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50003, @severity = 11, @msgtext = N'%s :: %s', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50004, @severity = 11, @msgtext = N'%s :: Invalid parameter value(s) specified.', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50005, @severity = 11, @msgtext = N'%s :: %s already exists in %s.', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50006, @severity = 11, @msgtext = N'%s :: SELECT failed on the %s table.', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50007, @severity = 11, @msgtext = N'%s :: INSERT failed on the %s table.', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50008, @severity = 11, @msgtext = N'%s :: UPDATE failed on the %s table.', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50009, @severity = 11, @msgtext = N'%s :: DELETE failed on the %s table.', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50010, @severity = 11, @msgtext = N'%s :: MERGE failed on the %s table.', @with_log = 'FALSE', @replace = 'replace';
EXEC sp_addmessage @msgnum = 50011, @severity = 11, @msgtext = N'%s :: Nested procedure call to %s returned an error.', @with_log = 'FALSE', @replace = 'replace';

--SELECT * FROM sys.messages