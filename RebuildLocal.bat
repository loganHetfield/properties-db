sqlcmd -b -i DropAllForeignKeys.sql -d PropertiesAndInspectionsV1 -S .
sqlcmd -b -i DropAllDatabases.sql -d PropertiesAndInspectionsV1 -S .
powershell -NoProfile -ExecutionPolicy Bypass -Command "& .\SimpleBuild.ps1 -verbose"
cd Properties
sqlcmd -b -i deploy.sql -d PropertiesAndInspectionsV1 -S .
cd ..