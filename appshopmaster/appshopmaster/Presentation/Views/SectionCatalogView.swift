import SwiftUI

struct SectionCatalogView: View {
    @StateObject private var viewModel: SectionCatalogViewModel
    @ObservedObject private var cartStore: CartStore

    init(section: ShopSection, cartStore: CartStore) {
        self._viewModel = StateObject(wrappedValue: SectionCatalogViewModel(section: section, cartManager: cartStore))
        self._cartStore = ObservedObject(wrappedValue: cartStore)
    }

    var body: some View {
        let section = viewModel.section
        let style = section.id.style

        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 22) {
                VStack(alignment: .leading, spacing: 16) {
                    Text(section.title)
                        .font(.system(size: 36, weight: .bold, design: .serif))
                        .foregroundStyle(.white)

                    Text(section.heroTitle)
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(.white.opacity(0.92))

                    Text(section.heroDescription)
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(.white.opacity(0.84))
                        .fixedSize(horizontal: false, vertical: true)

                    HStack(spacing: 12) {
                        statChip(value: "\(section.products.count)", label: "produtos")
                        statChip(value: "\(cartStore.totalQuantity)", label: "no carrinho")
                    }
                }
                .padding(22)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 34, style: .continuous)
                            .fill(style.gradient)

                        RoundedRectangle(cornerRadius: 34, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.black.opacity(0.10),
                                        Color.black.opacity(0.24)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 34, style: .continuous)
                        .stroke(ShopTheme.panelStroke, lineWidth: 1)
                )
                .shadow(color: style.accent.opacity(0.18), radius: 22, x: 0, y: 12)

                ForEach(section.products) { product in
                    ProductCard(
                        product: product,
                        accent: style.accent,
                        cartQuantity: cartStore.quantity(for: product)
                    ) {
                        viewModel.addToCart(product)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .padding(.bottom, 30)
        }
        .background(ShopBackground())
        .navigationTitle(section.title)
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityIdentifier("sectionScreen.\(section.id.rawValue)")
    }

    private func statChip(value: String, label: String) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(value)
                .font(.headline.weight(.bold))

            Text(label)
                .font(.caption.weight(.medium))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(.white.opacity(0.14), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}