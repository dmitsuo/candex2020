@echo off

set PASTA_PAI_CANDEX=%USERPROFILE%

set PASTA_CANDEX=%PASTA_PAI_CANDEX%\.candex

if not exist %PASTA_CANDEX%\ GOTO :PASTA_CANDEX_NAO_EXISTE

for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~6,2%-%ldt:~4,2%-%ldt:~0,4%-%ldt:~8,2%h-%ldt:~10,2%m-%ldt:~12,2%s

set PASTA_CANDEX_BACKUP=.candex_%ldt%
rename "%PASTA_CANDEX%" "%PASTA_CANDEX_BACKUP%"
echo.
echo.
echo  Pasta do CANDEX renomeada de "%PASTA_CANDEX%" para "%PASTA_PAI_CANDEX%\%PASTA_CANDEX_BACKUP%"

GOTO :END

:PASTA_CANDEX_NAO_EXISTE
echo.
echo.
echo          Pasta de dados do CANDEX (%PASTA_CANDEX%) nao encontrada!


:END
echo.

pause

