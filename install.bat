@echo off
cls
:: Habilita a expansão de variável atrasada para uso em loops
setlocal enabledelayedexpansion

:: Como o script deve ser executado como admin, alteramos o diretório de trabalho para a pasta do script
cd /d "%~dp0"

:: Define a página de código para UTF-8 para evitar problemas com caracteres especiais
chcp 65001

echo ""
echo =======================================
echo  CONFIGURACOES INICIAIS
echo =======================================

echo.
echo [1/3] Ativando o Windows Sandbox...
Dism.exe /online /Enable-Feature /FeatureName:Containers-DisposableClientVM /all /NoRestart

echo.
echo [2/3] Instalando WSL...
wsl --install

echo.
echo [3/3] Atualizando todos os pacotes Winget...
winget upgrade --all --silent --accept-source-agreements --accept-package-agreements

echo =======================================
echo  INSTALANDO APLICATIVOS
echo =======================================

set "baixar_apps=1"
if exist "apps.csv" (
    echo.
    set /p "resposta=O arquivo apps.csv ja existe. Deseja atualizar com a versao mais recente? (S/N): "
    if /I "!resposta!"=="S" (
        set "baixar_apps=1"
    ) else (
        set "baixar_apps=0"
    )
)

if "!baixar_apps!"=="1" (
    echo Baixando o arquivo de aplicativos...
    :: Usamos -Command para garantir que o comando seja executado pelo PowerShell e não interpretado pelo CMD.
    powershell.exe -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/nettaskjr/apps-winget/main/apps.csv' -OutFile 'apps.csv'"
) else (
    echo Mantendo o arquivo existente em: %~dp0apps.csv
)

:: Lendo e executando o arquivo de aplicativos, descartando a primeira linha (cabeçalho)
:: As configuracoes importantes foram movidas diretamente para este script.
for /f "skip=1 tokens=1,2 delims=," %%A in (apps.csv) do (
    set "coluna1=%%A"
    set "coluna2=%%B"
    echo.
    echo ---------------------------------------
    echo Instalando: !coluna1!
    winget install --id=!coluna2! -h --accept-source-agreements --accept-package-agreements
)

echo.
echo =======================================
echo  Script concluído!
echo =======================================
endlocal

pause


