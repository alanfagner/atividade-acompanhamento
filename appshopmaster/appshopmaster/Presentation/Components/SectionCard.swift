import SwiftUI

struct SectionCard: View {
    let section: ShopSection

    var body: some View {
        let style = section.id.style

        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .top, spacing: 14) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(section.title)
                        .font(.system(size: 28, weight: .bold, design: .serif))
                        .foregroundStyle(ShopTheme.ink)

                    Text(section.subtitle)
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(ShopTheme.mutedInk)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer(minLength: 0)

                ZStack {
                    Circle()
                        .fill(style.gradient)
                        .frame(width: 52, height: 52)

                    Image(systemName: section.iconName)
                        .font(.title2.weight(.bold))
                        .foregroundStyle(.white)
                }
            }

            HStack(spacing: 10) {
                Label("\(section.products.count) produtos", systemImage: "shippingbox.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(style.accent)

                Spacer(minLength: 0)

                Text("Explorar")
                    .font(.footnote.weight(.bold))
                    .foregroundStyle(ShopTheme.ink)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(ShopTheme.card)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(style.gradient, lineWidth: 1.1)
                .opacity(0.75)
        )
        .shadow(color: style.accent.opacity(0.14), radius: 24, x: 0, y: 10)
    }
}