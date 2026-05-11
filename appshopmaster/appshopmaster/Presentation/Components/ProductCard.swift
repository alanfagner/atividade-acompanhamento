import SwiftUI

struct ProductCard: View {
    let product: Product
    let accent: Color
    let cartQuantity: Int
    let action: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.badge.uppercased())
                    .font(.caption2.weight(.bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 7)
                    .background(accent.opacity(0.12), in: Capsule())
                    .foregroundStyle(accent)

                Spacer(minLength: 0)

                if cartQuantity > 0 {
                    Label("\(cartQuantity)", systemImage: "cart.fill")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(ShopTheme.ink)
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(accent.opacity(0.12))
                    .frame(height: 126)

                Image(systemName: product.iconName)
                    .font(.system(size: 42, weight: .semibold))
                    .foregroundStyle(accent)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(ShopTheme.ink)
                    .fixedSize(horizontal: false, vertical: true)

                Text(product.subtitle)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(accent)

                Text(product.details)
                    .font(.footnote)
                    .foregroundStyle(ShopTheme.mutedInk)
                    .fixedSize(horizontal: false, vertical: true)
            }

            HStack(alignment: .lastTextBaseline) {
                Text(PriceFormatter.string(from: product.priceInCents))
                    .font(.title3.weight(.bold))
                    .foregroundStyle(ShopTheme.ink)

                Spacer(minLength: 0)

                Text(cartQuantity > 0 ? "No carrinho" : "Pronto para levar")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(ShopTheme.mutedInk)
            }

            Button(action: action) {
                Label(cartQuantity > 0 ? "Adicionar mais" : "Adicionar ao carrinho", systemImage: "plus.circle.fill")
                    .font(.headline.weight(.semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(accent, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .foregroundStyle(.white)
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("addToCart.\(product.id)")
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(ShopTheme.elevatedCard)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(.white.opacity(0.5), lineWidth: 1)
        )
        .shadow(color: accent.opacity(0.16), radius: 22, x: 0, y: 12)
    }
}