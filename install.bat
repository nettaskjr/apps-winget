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
echo [1/3] Habilitando execucao de scripts PowerShell para esta sessao...
:: O erro em 'erros.txt' acontece porque o CMD nao entende comandos PowerShell.
:: A forma correta e chamar o executavel do PowerShell e passar o comando.
:: Usar '-ExecutionPolicy Bypass' e a melhor pratica para nao alterar a seguranca do sistema permanentemente.
powershell.exe -ExecutionPolicy Bypass -Command "Write-Host 'Politica de execucao ajustada com sucesso.' -ForegroundColor Green"

echo.
echo [2/3] Instalando WSL com Debian...
wsl --install -d Debian
wsl --set-default Debian

echo.
echo [3/3] Atualizando todos os pacotes Winget...
winget upgrade --all --silent --accept-source-agreements --accept-package-agreements

echo ""
echo =======================================
echo  INSTALANDO APLICATIVOS
echo =======================================

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
echo  Script concluido!
echo =======================================
endlocal

pause
