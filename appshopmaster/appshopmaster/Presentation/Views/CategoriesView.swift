import SwiftUI

struct CategoriesView: View {
    @StateObject private var viewModel: CategoriesViewModel
    @ObservedObject private var cartStore: CartStore

    init(productRepository: any ProductRepository, cartStore: CartStore) {
        self._viewModel = StateObject(wrappedValue: CategoriesViewModel(productRepository: productRepository))
        self._cartStore = ObservedObject(wrappedValue: cartStore)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                ShopBackground()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Categorias")
                                .font(.system(size: 34, weight: .bold, design: .serif))
                                .foregroundStyle(.white)

                            Text("Entre por contexto de compra e avance para uma seleção enxuta, técnica e pronta para adicionar ao carrinho.")
                                .font(.subheadline.weight(.medium))
                                .foregroundStyle(.white.opacity(0.88))
                        }
                        .padding(22)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 32, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.black.opacity(0.38),
                                            Color.black.opacity(0.24)
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
                        .shadow(color: Color.black.opacity(0.18), radius: 20, x: 0, y: 10)

                        ForEach(viewModel.sections) { section in
                            NavigationLink {
                                SectionCatalogView(section: section, cartStore: cartStore)
                            } label: {
                                VStack(alignment: .leading, spacing: 16) {
                                    SectionCard(section: section)

                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 12) {
                                            ForEach(section.products.prefix(2)) { product in
                                                previewPill(for: product, accent: section.id.style.accent)
                                            }
                                        }
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                            .accessibilityIdentifier("sectionCard.\(section.id.rawValue)")
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 18)
                    .padding(.bottom, 30)
                }
            }
            .navigationTitle("Coleções")
        }
    }

    private func previewPill(for product: Product, accent: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: product.iconName)
                .foregroundStyle(accent)
            VStack(alignment: .leading, spacing: 2) {
                Text(product.name)
                    .font(.footnote.weight(.bold))
                    .foregroundStyle(ShopTheme.ink)
                    .lineLimit(1)

                Text(PriceFormatter.string(from: product.priceInCents))
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(ShopTheme.mutedInk)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(.white.opacity(0.72), in: Capsule())
    }
}