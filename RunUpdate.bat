powershell -NoProfile -ExecutionPolicy Bypass -Command "& .\SimpleBuild.ps1 -verbose"
cd Properties
sqlcmd -b -i deploy.sql -d PropertiesAndInspectionsV1 -S .
cd ..