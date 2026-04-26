import Foundation

struct AnswerFeedback: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}