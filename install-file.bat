@echo off
if exist plugins.bat call plugins.bat
if not "%plugins%" == "" goto ok
echo ERROR: plugins.bat file must exists and set variable 'plugins'
exit
:ok

rem %1 = file
rem %2 = artifactId
rem %3 = version
rem %4 = sources
call mvn.bat install:install-file ^
 -DlocalRepositoryPath=repository ^
 -DcreateChecksum=true ^
 -Dpackaging=jar ^
 -DupdateReleaseInfo=true ^
 -DgroupId=org.eclipse ^
 -Dfile=%plugins%\%1 ^
 -DartifactId=%2 ^
 -Dversion=%3 ^
 -Dsources=%plugins%\%4
del repository\org\eclipse\%2\maven-metadata.*
ren repository\org\eclipse\%2\maven-metadata-local.* maven-metadata.*
goto :eof
