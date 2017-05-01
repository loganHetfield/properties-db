* Database Build Script Documentation (BuildDB.ps1 and Build.ps1)

BuildDB.ps1 has been deprecated in favor of Build.ps1 for all databases except
for Hospital Data Uplink, because we still want to produce a single SQL
concatenated script for that particular database (for now.)

BuildDB.ps1 will concatenate all the specified scripts for a given database
and write it to a file.  The compiled script is written to
sql/Compiled/{database dir name}.sql.

PS C:\> & "<<YOURPATH>>\Build.ps1"
PS C:\> .\Build.ps1

Build.ps1 will generate one sqlcmd script in for a given database.  The script
is written to sql/{database dir name}/deploy.sql.  This script will just call
all the other scripts designated by the manifest file.  You can execute the
script from the command line.  For example, to deploy locally:

sqlcmd -b -i deploy.sql -d HDE

Or remotely:

sqlcmd -b -i deploy.sql -d HDE -S server -U username -P password

Because the deploy script references files using relative paths, you must start
sqlcmd from the directory containing deploy.sql.

Build.ps1 also returns the list of generated files (or only one if a
particular database script dir is specified) so it can be used from other
scripts.  Build.ps1 has no built in options for executing the resulting script
against a live database because you can already do that in one line using sqlcmd.

The manifest file works identically for both scripts.

** Manifest File

The manifest file contains a list of path specs that refer to all the scripts
to compile for one database.  There should be one manifest file (always called
Manifest.txt) for each database, placed in the subdirectory for the database.

The format is a plain text file with one line per path spec.  A path spec can
include wildcards (or anything else PowerShell supports.)  Path specs that
resolve to more than one file will be expanded to the full list and the list
will be deduplicated before processing.  This gives you the ability to run
specific files before others.  (Normally, files are processed in alphabetical
order.)

For example, if you have the files a.sql, b.sql, and c.sql, but you want to
run c.sql first, you can specify the following lines in the manifest:

SomeDir\c.sql
SomeDir\*.sql

The last line will expand to: a.sql b.sql c.sql.
But the second appearance of c.sql will be ignored because it already appeared
before.

You can process all files matching a pattern but excluding other patterns.
SomeDir\*.sql -exclude foo.sql
SomeDir\*.sql -exclude foo.sql,bar.sql
SomeDir\*.sql -exclude somePrefix*.sql

Basically, you can do anything the PowerShell Get-ChildItem command can do.

** Running BuildDB.ps1

./BuildDB.ps1
If you specify no arguments, the script will iterate through each subdirectory
that has a Manifest.txt and will generate a SQL script <directory>.sql in the
Compiled dir with all the specified script files concatenated.

./BuildDB.ps1 -databaseDir hde
This will only compile the scripts for the HDE subdirectory.

./BuildDB.ps1 -databaseDir hde -verbose
This will emit more output for debugging purposes.  Normally you won't see any
output unless there is an error.

./BuildDB.ps1 -databaseDir HDE -ServerName localhost -DatabaseName HDE -UserName user -Password password -DataSize 1000 -LogSize 1000 -GrowRate 100 -DBDataFilePath "C:\\DBDataFilePath\\" -DBLogFilePath "C:\\DBLogsFilePath\\"
(or from command shell c:\> powershell .\BuildDB.ps1 -databaseDir HDE -ServerName localhost -DatabaseName HDE -UserName user -Password password -DataSize 1000 -LogSize 1000 -GrowRate 100 -DBDataFilePath "C:\\DBDataFilePath\\" -DBLogFilePath "C:\\DBLogsFilePath\\")

This script will execute and apply scripts to DB in next order: CreateDB.sql, Compiled\HDE.sql 

** Running Build.ps1

./Build.ps1
If you specify no arguments, the script will iterate through each subdirectory
that has a Manifest.txt and will generate a sqlcmd script deploy.sql in the
database dir that will run all the scripts specified by the manifest.

./Build.ps1 hde
This will only generate a deploy script for the scripts in the HDE subdirectory.

./Build.ps1 hde,cdr
This will generate scripts for both HDE and CDR.  (You can specify a comma
separated list of directories.)

./Build.ps1 hde -verbose
This will emit more output for debugging purposes.  Normally the only output you
will see is the path of the generated script file.

