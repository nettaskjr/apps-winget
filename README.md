# Apps-Winget: Automatizador de Instalação para Windows

Este projeto contém um script de automação (`.bat`) para configurar um ambiente de desenvolvimento em uma nova instalação do Windows. Ele utiliza o **Gerenciador de Pacotes do Windows (`winget`)** para instalar seus aplicativos favoritos, habilita o **Windows Sandbox** e configura o **Subsistema do Windows para Linux (WSL)**.

O objetivo é simplificar e acelerar o processo de setup de uma nova máquina, garantindo que todas as ferramentas essenciais sejam instaladas de forma consistente e automática.

## ✨ Funcionalidades

- ✅ **Configuração Inicial:** Instala o Sandbox e wsl, atualiza todos os pacotes existentes.
- 🐧 **WSL:** Instala automaticamente o WSL distribui;áo padrão do Linux.
- 📦 **Instalação em Lote:** Lê uma lista de aplicativos de um arquivo `apps.csv` e faz a instalação.
- 🔧 **Fácil de Personalizar:** Basta editar o arquivo `apps.csv` para adicionar ou remover os aplicativos que você deseja instalar.

## 🚀 Como Usar

1.  **Execute o comando abaixo para instalar o script:**
    ```sh
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nettaskjr/apps-winget/main/install.bat" -OutFile "install.bat"; Start-Process -FilePath ".\install.bat" -Verb RunAs
    ```
2. **Lista de apps a serem instalados**
    A lista de apps sugeridos é baixada automaticamente quando o arquivo `apps.csv` não existe. Se o arquivo já estiver presente na máquina, o script perguntará se você deseja atualizar com a versão mais recente. Se responder "N", o arquivo local será mantido e não será substituído. Esta lista pode ser editada por você, alterando o arquivo `apps.csv`. Veja abaixo no modo Personalizado, como se deve proceder para editar a lista.

## ⚙️ Personalização

O script foi projetado para ser executado de duas maneiras:

### Modo Rápido (Padrão)
Use o comando acima para uma instalação rápida com a lista de aplicativos padrão do repositório. É ideal para setups rápidos sem necessidade de customização.

### Modo Personalizado
Se você deseja escolher quais aplicativos instalar, siga estes passos:

1.  **Edição da lista de apps**
    Abra em um editor compatível, o arquivo `apps.csv`. Caso o arquivo nao exista, execute `.\install.bat` para baixá-lo do servidor..
2.  **Personalize sua Lista de Aplicativos**
    Abra e edite o arquivo `apps.csv` com seus aplicativos preferidos.
3.  **Execute o Script como Administrador**
    Clique com o botão direito no arquivo `install.bat` e selecione **"Executar como administrador"**.

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