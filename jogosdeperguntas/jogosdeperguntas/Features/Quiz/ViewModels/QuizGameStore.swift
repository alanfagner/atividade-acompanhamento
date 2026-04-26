import Combine
import Foundation

final class QuizGameStore: ObservableObject {
    let themes: [QuizTheme]

    @Published var playerName = ""
    @Published var answerFeedback: AnswerFeedback?
    @Published private(set) var selectedTheme: QuizTheme?
    @Published private(set) var currentQuestions: [QuizQuestion] = []
    @Published private(set) var currentQuestionIndex = 0
    @Published private(set) var correctAnswers = 0
    @Published private(set) var incorrectAnswers = 0
    @Published private(set) var lastSummary: GameSummary?
    @Published private(set) var isGameActive = false

    init(themes: [QuizTheme] = QuizThemeProvider.themes) {
        self.themes = themes
    }

    var currentQuestion: QuizQuestion? {
        guard currentQuestionIndex < currentQuestions.count else {
            return nil
        }

        return currentQuestions[currentQuestionIndex]
    }

    var playerDisplayName: String {
        let trimmedName = playerName.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedName.isEmpty ? "Jogador" : trimmedName
    }

    func startGame(with theme: QuizTheme) {
        selectedTheme = theme
        currentQuestions = Array(theme.questions.shuffled().prefix(5))
        currentQuestionIndex = 0
        correctAnswers = 0
        incorrectAnswers = 0
        answerFeedback = nil
        lastSummary = nil
        isGameActive = true
    }

    func submitAnswer(_ selectedIndex: Int) {
        guard let question = currentQuestion else {
            return
        }

        if selectedIndex == question.correctIndex {
            correctAnswers += 1
            answerFeedback = AnswerFeedback(
                title: "Resposta correta",
                message: "Boa! Voce marcou a alternativa certa."
            )
        } else {
            incorrectAnswers += 1
            answerFeedback = AnswerFeedback(
                title: "Resposta incorreta",
                message: "A resposta correta era: \(question.correctAnswer)."
            )
        }
    }

    func continueAfterFeedback() {
        answerFeedback = nil
        moveToNextStep()
    }

    private func moveToNextStep() {
        let nextIndex = currentQuestionIndex + 1

        if nextIndex < currentQuestions.count {
            currentQuestionIndex = nextIndex
            return
        }

        finishGame()
    }

    private func finishGame() {
        lastSummary = GameSummary(
            playerName: playerDisplayName,
            themeName: selectedTheme?.name ?? "Tema desconhecido",
            correctAnswers: correctAnswers,
            incorrectAnswers: incorrectAnswers
        )
        isGameActive = false
        selectedTheme = nil
        currentQuestions = []
        currentQuestionIndex = 0
    }
}