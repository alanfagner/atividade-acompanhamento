import Foundation

struct QuizTheme: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let questions: [QuizQuestion]
}