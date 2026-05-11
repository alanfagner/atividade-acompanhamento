# appshopmaster

O `appshopmaster` é um aplicativo iOS feito em SwiftUI que simula uma loja de artigos de pesca. A proposta do projeto foi sair do template inicial do Xcode e transformar a base em um app com navegação, catálogo organizado por seções, carrinho e uma arquitetura que já permita crescer sem virar bagunça.

## Ideia do projeto

O usuário navega por três áreas principais:

- `Início`, com destaque para a loja e alguns produtos em evidência.
- `Categorias`, com as seções do catálogo.
- `Carrinho`, com itens adicionados, quantidades, subtotal e valor total.

O catálogo atual está organizado em três seções:

- Varas
- Carretilhas
- Iscas & Acessórios

## O que já está implementado

- navegação por abas com `TabView`
- fluxo de navegação com `NavigationStack`
- catálogo mockado localmente, pronto para troca por API depois
- carrinho com adição, incremento, decremento, remoção e total da compra
- formatação de preço em real
- interface visual com direção mais clean e inspirada em praia / náutica
- testes unitários para regras do carrinho
- smoke test de UI para adicionar e remover item

## Organização do código

O projeto foi dividido em camadas leves, seguindo a ideia de MVVM com responsabilidades bem separadas:

```text
appshopmaster/
  appshopmaster/
    Application/
      Protocols/
      Stores/
    Domain/
    Infrastructure/
      Repositories/
    Presentation/
      Components/
      Root/
      Theme/
      ViewModels/
      Views/
  appshopmasterTests/
  appshopmasterUITests/
```

### Leitura rápida da estrutura

- `Domain`: modelos centrais do app, como produto, seção e item do carrinho.
- `Application`: contratos e store compartilhado do carrinho.
- `Infrastructure`: fonte de dados mock do catálogo.
- `Presentation`: telas, componentes visuais, tema e view models.

## Como executar

### Pelo Xcode

1. Abra `appshopmaster.xcodeproj`.
2. Selecione o scheme `appshopmaster`.
3. Escolha um simulador iOS.
4. Rode com `Run`.

### Pela linha de comando

Para compilar:

```bash
xcodebuild build-for-testing -scheme appshopmaster -project appshopmaster.xcodeproj -destination 'generic/platform=iOS Simulator'
```

Para rodar os testes, ajuste o nome do simulador disponível na sua máquina:

```bash
xcodebuild test -scheme appshopmaster -project appshopmaster.xcodeproj -destination 'platform=iOS Simulator,name=iPhone 17 Pro'
```

## Testes

Hoje o projeto cobre dois tipos de validação:

- `appshopmasterTests`: regras do carrinho e consistência do repositório mock.
- `appshopmasterUITests`: fluxo básico de adicionar produto ao carrinho e remover depois.