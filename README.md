# Atividade Acompanhamento

Este repositório reúne projetos em Swift feitos como prática de fundamentos, interface com SwiftUI e organização de código em contextos diferentes. Em vez de concentrar tudo em um único app, a ideia aqui foi manter exercícios separados, cada um com um objetivo bem claro.

## O que tem aqui

| Projeto | Tipo | Resumo | README |
| --- | --- | --- | --- |
| `appshopmaster` | iOS / SwiftUI | Loja de artigos de pesca com navegação por abas, catálogo por seções e carrinho. | [appshopmaster/README.md](appshopmaster/README.md) |
| `jogosdeperguntas` | iOS / SwiftUI | Jogo de perguntas por tema, com sorteio de questões e resumo final da rodada. | [jogosdeperguntas/README.md](jogosdeperguntas/README.md) |
| `atividade acompanhamento nivelamento` | CLI / Swift | Sistema de contatos no terminal com cadastro, listagem, alteração e remoção. | [atividade acompanhamento nivelamento/README.md](atividade%20acompanhamento%20nivelamento/README.md) |

## Como usar este repositório

Se a intenção for abrir os projetos iOS, o caminho mais simples é pelo Xcode:

1. Abra o projeto desejado (`.xcodeproj`).
2. Escolha o scheme correspondente.
3. Rode em um simulador iOS.

Se a intenção for praticar Swift no terminal, o projeto de nivelamento pode ser executado diretamente pela linha de comando.

## Organização geral

- `appshopmaster/`: projeto mais recente do repositório, focado em SwiftUI, MVVM e estado compartilhado.
- `jogosdeperguntas/`: app de quiz com estrutura por feature e tema visual próprio.
- `atividade acompanhamento nivelamento/`: exercício mais simples, orientado a lógica, validação e fluxo de menu no console.

## Observações

- O repositório agora tem `.gitignore` na raiz para evitar arquivos temporários do macOS e dados locais do Xcode.
- `jogosdeperguntas` já tinha um README próprio; os outros projetos receberam documentação para deixar a navegação do repositório mais clara.

## Sugestão de leitura

Se você estiver chegando agora no repositório, eu começaria nesta ordem:

1. `atividade acompanhamento nivelamento`, para entender a base de lógica e validação.
2. `jogosdeperguntas`, para ver um app SwiftUI pequeno com fluxo fechado.
3. `appshopmaster`, que já traz uma estrutura mais próxima de um projeto de app real.