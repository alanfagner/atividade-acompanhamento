import SwiftUI

struct QuizThemeCard: View {
    let theme: QuizTheme
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 12) {
                Text(theme.name)
                    .font(.headline.weight(.bold))
                    .foregroundStyle(.white)

                Text(theme.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.76))

                Spacer(minLength: 0)

                Text("\(theme.questions.count) perguntas")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color(red: 0.98, green: 0.80, blue: 0.29))
            }
            .frame(maxWidth: .infinity, minHeight: 150, alignment: .leading)
            .padding(18)
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(Color.white.opacity(0.14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(Color.white.opacity(0.10), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(.plain)
    }
}