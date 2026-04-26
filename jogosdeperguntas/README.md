# Jogos de Perguntas

Aplicativo iOS em SwiftUI para um jogo de perguntas e respostas por tema.

O jogador informa seu nome, escolhe um tema e responde cinco perguntas com quatro alternativas cada. Ao final, o app mostra a quantidade de acertos e erros e volta para a selecao de temas para uma nova rodada.

## Funcionalidades

- Selecao de tema antes do inicio da partida.
- Banco com mais de cinco perguntas por tema.
- Sorteio aleatorio de cinco perguntas por rodada.
- Feedback imediato para resposta correta ou incorreta.
- Exibicao da resposta correta quando o jogador erra.
- Resumo final com nome do jogador, tema, acertos e erros.
- Reinicio rapido do jogo com nova selecao de tema.

## Temas atuais

- Historia
- Fisica
- Geografia
- Matematica

## Arquitetura do projeto

O projeto foi organizado em uma estrutura feature-first, alinhada ao fluxo recomendado para apps SwiftUI pequenos e medios: ponto de entrada do app separado, feature encapsulada por responsabilidade e componentes compartilhados isolados.

```text
jogosdeperguntas/
  App/
    JogosDePerguntasApp.swift
  Assets.xcassets/
  Features/
    Quiz/
      Data/
        QuizThemeProvider.swift
      Models/
        AnswerFeedback.swift
        GameSummary.swift
        QuizQuestion.swift
        QuizTheme.swift
      ViewModels/
        QuizGameStore.swift
      Views/
        QuizGameView.swift
  Shared/
    Components/
      AnswerOptionButton.swift
      QuizBackgroundView.swift
      QuizThemeCard.swift
      ScoreChip.swift
jogosdeperguntasTests/
jogosdeperguntasUITests/
```

### Responsabilidades

- `App`: inicializacao do app e definicao da janela principal.
- `Features/Quiz/Models`: estruturas de dominio da feature de quiz.
- `Features/Quiz/Data`: dados estaticos e fonte inicial de perguntas.
- `Features/Quiz/ViewModels`: estado e regras da partida.
- `Features/Quiz/Views`: composicao da tela principal do jogo.
- `Shared/Components`: componentes reutilizaveis de interface.

## Como executar

### Pelo Xcode

1. Abra `jogosdeperguntas.xcodeproj`.
2. Selecione o scheme `jogosdeperguntas`.
3. Escolha um simulador iOS.
4. Execute com `Run`.

### Pela linha de comando

```bash
xcodebuild -scheme jogosdeperguntas -project jogosdeperguntas.xcodeproj -destination 'generic/platform=iOS Simulator' build CODE_SIGNING_ALLOWED=NO
```

## Personalizacao de perguntas

Para alterar temas, perguntas e respostas, edite o arquivo:

- `jogosdeperguntas/Features/Quiz/Data/QuizThemeProvider.swift`

Cada tema contem uma lista de perguntas, e cada pergunta define:

- enunciado
- quatro opcoes de resposta
- indice da resposta correta

## Testes

O projeto contem dois targets de teste:

- `jogosdeperguntasTests`
- `jogosdeperguntasUITests`

## Melhorias futuras

- ranking local por jogador
- niveis de dificuldade
- opcao de pular pergunta
- persistencia de historico de partidas
- ampliacao do banco de perguntas por tema