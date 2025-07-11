@echo off
cls
:: autoriza execução de variveis no laço
setlocal enabledelayedexpansion

:: como deve ser executado como admin, iremos alterar a pasta de trabalho para a pasta atual
cd /d "%~dp0"

:: definindo a página de codigo para UTF-8
chcp 65001

:: lendo e executando o arquivo de configurações
echo ""
echo Configs -------------------------------
for /f "tokens=1,2 delims=;" %%A in (configs.csv) do (
    set "coluna1=%%A"
    set "coluna2=%%B"
    echo ---------------------------------------
    echo !coluna1!
    !coluna2!
)

:: lendo e executando o arquivo de aplicativos
echo ""
echo Programas -----------------------------
for /f "tokens=1,2 delims=;" %%A in (apps.csv) do (
    set "coluna1=%%A"
    set "coluna2=%%B"
    echo ---------------------------------------
    echo !coluna1!
    winget install --id=!coluna2! -h
)

endlocal

pause