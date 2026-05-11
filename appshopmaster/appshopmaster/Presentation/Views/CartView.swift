import SwiftUI

struct CartView: View {
    @StateObject private var viewModel: CartViewModel

    init(cartStore: CartStore) {
        self._viewModel = StateObject(wrappedValue: CartViewModel(cartStore: cartStore))
    }

    var body: some View {
        NavigationStack {
            ZStack {
                ShopBackground()

                if viewModel.items.isEmpty {
                    emptyState
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 20) {
                            summaryCard

                            ForEach(viewModel.items) { item in
                                CartItemCard(
                                    item: item,
                                    onIncrease: { viewModel.add(item.product) },
                                    onDecrease: { viewModel.decrement(item.product) },
                                    onRemove: { viewModel.remove(item.product) }
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 18)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationTitle("Carrinho")
        }
    }

    private var emptyState: some View {
        VStack(spacing: 18) {
            ZStack {
                Circle()
                    .fill(.white.opacity(0.20))
                    .frame(width: 104, height: 104)

                Image(systemName: "cart")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
            }

            Text("Seu carrinho ainda está vazio")
                .font(.system(size: 30, weight: .bold, design: .serif))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)

            Text("Adicione produtos das seções para acompanhar quantidades e o valor total da compra em tempo real.")
                .font(.subheadline.weight(.medium))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white.opacity(0.86))
                .padding(.horizontal, 28)
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.black.opacity(0.38),
                            ShopTheme.sea.opacity(0.46)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .stroke(ShopTheme.panelStroke, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.20), radius: 24, x: 0, y: 12)
        .padding(.horizontal, 20)
    }

    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Resumo da compra")
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundStyle(ShopTheme.ink)

            HStack {
                infoBlock(title: "Itens", value: "\(viewModel.summary.itemCount)")
                infoBlock(title: "Produtos", value: "\(viewModel.summary.uniqueItems)")
                infoBlock(
                    title: "Total",
                    value: PriceFormatter.string(from: viewModel.summary.totalInCents),
                    valueAccessibilityIdentifier: "cartTotalValue"
                )
            }
        }
        .padding(22)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(ShopTheme.elevatedCard)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .stroke(ShopTheme.stroke, lineWidth: 1)
        )
        .shadow(color: ShopTheme.sea.opacity(0.14), radius: 20, x: 0, y: 10)
    }

    private func infoBlock(title: String, value: String, valueAccessibilityIdentifier: String? = nil) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(ShopTheme.mutedInk)

            Text(value)
                .font(.headline.weight(.bold))
                .foregroundStyle(ShopTheme.ink)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .accessibilityIdentifier(valueAccessibilityIdentifier ?? "")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}