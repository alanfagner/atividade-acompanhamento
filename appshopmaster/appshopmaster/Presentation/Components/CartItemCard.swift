import SwiftUI

struct CartItemCard: View {
    let item: CartItem
    let onIncrease: () -> Void
    let onDecrease: () -> Void
    let onRemove: () -> Void

    var body: some View {
        let style = item.product.sectionID.style

        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .top, spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(style.accent.opacity(0.12))
                        .frame(width: 88, height: 88)

                    Image(systemName: item.product.iconName)
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(style.accent)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(item.product.name)
                        .font(.headline.weight(.bold))
                        .foregroundStyle(ShopTheme.ink)

                    Text(item.product.subtitle)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(style.accent)

                    Text(PriceFormatter.string(from: item.product.priceInCents))
                        .font(.footnote.weight(.medium))
                        .foregroundStyle(ShopTheme.mutedInk)
                }

                Spacer(minLength: 0)

                Text(PriceFormatter.string(from: item.subtotalInCents))
                    .font(.headline.weight(.bold))
                    .foregroundStyle(ShopTheme.ink)
                    .accessibilityIdentifier("cartSubtotal.\(item.product.id)")
            }

            HStack(spacing: 12) {
                Button(action: onDecrease) {
                    Image(systemName: "minus")
                        .font(.headline.weight(.bold))
                        .frame(width: 38, height: 38)
                        .background(style.accent.opacity(0.12), in: Circle())
                        .foregroundStyle(style.accent)
                }
                .buttonStyle(.plain)
                .accessibilityIdentifier("decrementCart.\(item.product.id)")

                Text("\(item.quantity)")
                    .font(.headline.weight(.bold))
                    .foregroundStyle(ShopTheme.ink)
                    .frame(minWidth: 24)
                    .accessibilityIdentifier("cartQuantity.\(item.product.id)")

                Button(action: onIncrease) {
                    Image(systemName: "plus")
                        .font(.headline.weight(.bold))
                        .frame(width: 38, height: 38)
                        .background(style.accent.opacity(0.12), in: Circle())
                        .foregroundStyle(style.accent)
                }
                .buttonStyle(.plain)
                .accessibilityIdentifier("incrementCart.\(item.product.id)")

                Spacer(minLength: 0)

                Button(role: .destructive, action: onRemove) {
                    Label("Remover", systemImage: "trash")
                        .font(.subheadline.weight(.semibold))
                }
                .accessibilityIdentifier("removeFromCart.\(item.product.id)")
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(ShopTheme.elevatedCard)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(style.gradient, lineWidth: 1)
                .opacity(0.45)
        )
        .shadow(color: style.accent.opacity(0.14), radius: 18, x: 0, y: 8)
    }
}