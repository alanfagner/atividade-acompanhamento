import SwiftUI

struct AnswerOptionButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.body.weight(.semibold))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)

                Spacer()

                Image(systemName: "chevron.right.circle.fill")
                    .foregroundStyle(Color(red: 0.98, green: 0.80, blue: 0.29))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.black.opacity(0.18))
            )
        }
        .buttonStyle(.plain)
    }
}