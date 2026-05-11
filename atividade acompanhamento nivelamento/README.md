# Atividade Acompanhamento Nivelamento

Este projeto é um exercício de Swift em linha de comando focado em lógica básica, validação de entrada e organização de fluxo. A aplicação funciona como um pequeno sistema de contatos rodando no terminal.

## O que o programa faz

O sistema oferece um menu com cinco opções:

1. cadastrar contato
2. listar contatos
3. alterar contato
4. remover contato
5. finalizar o programa

Cada contato possui:

- identificador numérico
- nome
- idade
- telefone
- e-mail

## Regras implementadas

Além do CRUD básico, o projeto já trata algumas validações que normalmente aparecem em exercícios desse tipo:

- nome obrigatório
- idade obrigatória e maior que zero
- telefone com validação de quantidade de dígitos
- telefone com formatação automática
- e-mail com validação por expressão regular
- prevenção de nomes duplicados
- alteração e remoção por identificador

## Estrutura

O projeto é simples e está concentrado em um único arquivo:

```text
atividade acompanhamento nivelamento/
  atividade acompanhamento nivelamento/
    main.swift
```

Essa escolha faz sentido aqui porque o foco é praticar fundamentos de linguagem, leitura de entrada, condicionais, arrays e funções.

## Como executar

### Pelo Xcode

1. Abra `atividade acompanhamento nivelamento.xcodeproj`.
2. Selecione o scheme do projeto.
3. Rode normalmente.

### Pelo terminal

Você também pode executar direto com o interpretador Swift:

```bash
swift "atividade acompanhamento nivelamento/atividade acompanhamento nivelamento/main.swift"
```

Se preferir compilar antes:

```bash
swiftc "atividade acompanhamento nivelamento/atividade acompanhamento nivelamento/main.swift" -o contatos
./contatos
```

## O que este projeto pratica bem

- structs
- arrays mutáveis
- leitura de entrada no terminal
- separação de responsabilidades em funções
- validação incremental de dados
- fluxo de menu em loop

## Melhorias futuras possíveis

Se a ideia for evoluir este exercício, alguns caminhos interessantes seriam:

1. persistir os contatos em arquivo JSON
2. permitir busca por nome
3. separar o código em múltiplos arquivos
4. criar testes unitários para validação de e-mail e telefone

## Resumo honesto

É um projeto simples, mas bom para nivelamento porque cobre o básico sem esconder a lógica atrás de frameworks.