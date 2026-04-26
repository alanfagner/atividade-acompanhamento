import Foundation

struct QuizQuestion: Identifiable {
    let id = UUID()
    let prompt: String
    let options: [String]
    let correctIndex: Int

    var correctAnswer: String {
        options[correctIndex]
    }
}