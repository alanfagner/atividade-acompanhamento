import SwiftUI

struct QuizBackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.06, green: 0.10, blue: 0.18),
                    Color(red: 0.05, green: 0.35, blue: 0.48),
                    Color(red: 0.91, green: 0.55, blue: 0.25)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Circle()
                .fill(Color.white.opacity(0.12))
                .frame(width: 240, height: 240)
                .blur(radius: 8)
                .offset(x: 140, y: -240)

            Circle()
                .fill(Color.black.opacity(0.18))
                .frame(width: 220, height: 220)
                .blur(radius: 24)
                .offset(x: -150, y: 280)
        }
    }
}