import SwiftUI

struct QuizGameView: View {
    @StateObject private var store = QuizGameStore()

    var body: some View {
        ZStack {
            QuizBackgroundView()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    headerView

                    if store.isGameActive,
                       let theme = store.selectedTheme,
                       let question = store.currentQuestion {
                        quizView(theme: theme, question: question)
                    } else {
                        themeSelectionView
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 28)
            }
        }
        .alert(item: $store.answerFeedback) { feedback in
            Alert(
                title: Text(feedback.title),
                message: Text(feedback.message),
                dismissButton: .default(Text("Continuar")) {
                    store.continueAfterFeedback()
                }
            )
        }
    }

    private var headerView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Jogo de Perguntas")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            Text(store.isGameActive ? "Responda cinco perguntas e veja sua pontuacao." : "Escolha um tema, responda cinco perguntas e reinicie quando quiser.")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.82))
        }
    }

    private var themeSelectionView: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Nome do jogador")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white.opacity(0.9))

                TextField("Digite seu nome (opcional)", text: $store.playerName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled()
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .background(cardBackground)
                    .foregroundStyle(.white)
            }
            .padding(20)
            .background(cardBackground)

            if let summary = store.lastSummary {
                summaryView(summary)
            }

            VStack(alignment: .leading, spacing: 14) {
                Text("Selecione um tema")
                    .font(.title3.weight(.bold))
                    .foregroundStyle(.white)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(store.themes) { theme in
                        QuizThemeCard(theme: theme) {
                            store.startGame(with: theme)
                        }
                    }
                }
            }
        }
    }

    private func summaryView(_ summary: GameSummary) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Resultado final")
                .font(.title3.weight(.bold))
                .foregroundStyle(.white)

            Text("\(summary.playerName), voce concluiu o tema \"\(summary.themeName)\".")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))

            HStack(spacing: 12) {
                ScoreChip(title: "Acertos", value: summary.correctAnswers, color: Color(red: 0.30, green: 0.78, blue: 0.47))
                ScoreChip(title: "Erros", value: summary.incorrectAnswers, color: Color(red: 0.93, green: 0.34, blue: 0.33))
            }

            Text("Escolha outro tema para reiniciar o jogo.")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.76))
        }
        .padding(20)
        .background(cardBackground)
    }

    private func quizView(theme: QuizTheme, question: QuizQuestion) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(theme.name)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(.white)

                Text("Pergunta \(store.currentQuestionIndex + 1) de \(store.currentQuestions.count)")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white.opacity(0.82))

                ProgressView(value: Double(store.currentQuestionIndex + 1), total: Double(max(store.currentQuestions.count, 1)))
                    .tint(Color(red: 0.98, green: 0.80, blue: 0.29))
            }
            .padding(20)
            .background(cardBackground)

            VStack(alignment: .leading, spacing: 18) {
                Text(question.prompt)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)

                ForEach(question.options.indices, id: \.self) { optionIndex in
                    AnswerOptionButton(title: question.options[optionIndex]) {
                        store.submitAnswer(optionIndex)
                    }
                    .disabled(store.answerFeedback != nil)
                }
            }
            .padding(20)
            .background(cardBackground)

            HStack(spacing: 12) {
                ScoreChip(title: "Acertos", value: store.correctAnswers, color: Color(red: 0.30, green: 0.78, blue: 0.47))
                ScoreChip(title: "Erros", value: store.incorrectAnswers, color: Color(red: 0.93, green: 0.34, blue: 0.33))
            }
        }
    }

    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 24, style: .continuous)
            .fill(Color.white.opacity(0.12))
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(Color.white.opacity(0.12), lineWidth: 1)
            )
    }
}

#Preview {
    QuizGameView()
}