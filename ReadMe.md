
--Build the database deployment scripts
.\build.ps1 -target 'db' 

--Deploy (local)|Esosuite
.\build.ps1 -target 'deploydb' @{ server = 'local'; database = 'ESOSuite'; environment = 'local' }

--Deploy the scripts to devdb6|ESOSuite_AdamH
.\build.ps1 -target 'deploydb' @{ server = 'devdb6'; database = 'ESOSUITE_AdamH'; environment = 'dev' }
