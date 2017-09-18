sqlcmd -b -i "DropAllForeignKeys.sql" -d "Properties" -S "eso-devdb-01.database.windows.net" -U "build_master" -P "Password#1"
sqlcmd -b -i "DropAllDatabases.sql" -d "Properties" -S "eso-devdb-01.database.windows.net" -U "build_master" -P "Password#1"
powershell -NoProfile -ExecutionPolicy Bypass -Command "& .\SimpleBuild.ps1 -verbose"
cd Properties
sqlcmd -b -i "Deploy.sql" -d "Properties" -S "eso-devdb-01.database.windows.net" -U "build_master" -P "Password#1"
cd ..