﻿Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine


Publish-NAVApp -ServerInstance "DynamicsNAV110" -Path "C:\Temp\RIVERINE TECHNOLOGY SERVICES_DentalWarehouse Integrations_11.0.21441.0.app" -SkipVerification

Publish-NAVApp -ServerInstance "DynamicsNAV110" -Path "C:\...\RIVERINE TECHNOLOGY SERVICES_DentalWarehouse Integrations_11.0.21441.0.app" -SkipVerification



 Unpublish-NAVApp -ServerInstance BC -Path '.\Proseware SmartApp.app'