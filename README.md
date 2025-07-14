# Apps-Winget: Automatizador de Instalação para Windows

Este projeto contém um script de automação (`.bat`) para configurar um ambiente de desenvolvimento em uma nova instalação do Windows. Ele utiliza o **Gerenciador de Pacotes do Windows (`winget`)** para instalar seus aplicativos favoritos e também configura o **Subsistema do Windows para Linux (WSL)** com a distribuição Debian.

O objetivo é simplificar e acelerar o processo de setup de uma nova máquina, garantindo que todas as ferramentas essenciais sejam instaladas de forma consistente e automática.

## ✨ Funcionalidades

- ✅ **Configuração Inicial:** Habilita a execução de scripts PowerShell para a sessão atual e atualiza todos os pacotes `winget` existentes.
- 🐧 **WSL com Debian:** Instala automaticamente o WSL e a distribuição Debian, definindo-a como padrão.
- 📦 **Instalação em Lote:** Lê uma lista de aplicativos de um arquivo `apps.csv` e os instala de forma silenciosa.
- 🔧 **Fácil de Personalizar:** Basta editar o arquivo `apps.csv` para adicionar ou remover os aplicativos que você deseja instalar.

## 🚀 Como Usar

1.  **Clone o Repositório**
    Clone este repositório para a sua máquina local ou simplesmente baixe o arquivo ZIP.
    ```sh
    git clone https://github.com/seu-usuario/apps-winget.git
    cd apps-winget
    ```

2.  **Personalize sua Lista de Aplicativos**
    Abra e edite o arquivo `apps.csv` com os seus aplicativos preferidos. Você pode encontrar o ID de um pacote `winget` usando o comando:
    ```sh
    winget search "nome do app"
    ```

3.  **Execute o Script como Administrador**
    Clique com o botão direito no arquivo `install.bat` e selecione **"Executar como administrador"**.

    O script cuidará de todo o processo, desde a instalação do WSL até a instalação de cada aplicativo listado no `apps.csv`.

## ⚙️ Personalização (`apps.csv`)

O arquivo `apps.csv` controla quais aplicativos são instalados. O formato é simples: a primeira coluna é um nome amigável (usado para exibição no console) e a segunda é o **ID exato** do pacote `winget`.

**A primeira linha (cabeçalho) é ignorada pelo script.**

### Exemplo de `apps.csv`:

```csv
Nome,WingetId
Google Chrome,Google.Chrome
Visual Studio Code,Microsoft.VisualStudioCode
7-Zip,7zip.7zip
Docker Desktop,Docker.DockerDesktop
PowerToys,Microsoft.PowerToys
```

## 📋 Pré-requisitos

- Windows 10 (versão 2004 ou superior) ou Windows 11.
- Acesso de **Administrador** para executar o script.
- Gerenciador de Pacotes do Windows (winget) instalado (geralmente já vem com as versões mais recentes do Windows).

---

*Este projeto é ideal para desenvolvedores, profissionais de TI ou qualquer pessoa que precise configurar múltiplos computadores Windows com um conjunto padronizado de softwares.*