import SwiftUI

struct ShopBackground: View {
    var body: some View {
        ZStack {
            ShopTheme.backgroundGradient
                .ignoresSafeArea()

            ShopTheme.backgroundScrim
                .ignoresSafeArea()

            Circle()
                .fill(ShopTheme.foam.opacity(0.20))
                .frame(width: 260, height: 260)
                .blur(radius: 18)
                .offset(x: -140, y: -220)

            Circle()
                .fill(ShopTheme.accent.opacity(0.22))
                .frame(width: 220, height: 220)
                .blur(radius: 30)
                .offset(x: 160, y: -140)

            RoundedRectangle(cornerRadius: 44, style: .continuous)
                .fill(.white.opacity(0.08))
                .frame(height: 360)
                .rotationEffect(.degrees(-12))
                .offset(y: 300)
                .blur(radius: 2)

            Rectangle()
                .fill(.black.opacity(0.06))
                .ignoresSafeArea()
        }
    }
}