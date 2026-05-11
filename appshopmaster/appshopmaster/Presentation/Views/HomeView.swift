import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @ObservedObject private var cartStore: CartStore

    init(productRepository: any ProductRepository, cartStore: CartStore) {
        self._viewModel = StateObject(wrappedValue: HomeViewModel(productRepository: productRepository, cartManager: cartStore))
        self._cartStore = ObservedObject(wrappedValue: cartStore)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                ShopBackground()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        heroCard

                        sectionHeader(title: "Seleção da maré", subtitle: "Produtos em destaque para montar um setup técnico e pronto para a próxima saída.")

                        ForEach(viewModel.featuredProducts) { product in
                            ProductCard(
                                product: product,
                                accent: product.sectionID.style.accent,
                                cartQuantity: cartStore.quantity(for: product)
                            ) {
                                viewModel.addToCart(product)
                            }
                        }

                        sectionHeader(title: "Explorar coleções", subtitle: "Três frentes de compra organizadas por contexto de uso.")

                        ForEach(viewModel.sections) { section in
                            NavigationLink {
                                SectionCatalogView(section: section, cartStore: cartStore)
                            } label: {
                                SectionCard(section: section)
                            }
                            .buttonStyle(.plain)
                            .accessibilityIdentifier("sectionCard.\(section.id.rawValue)")
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 18)
                    .padding(.bottom, 26)
                }
            }
            .navigationTitle("Maré Mestre")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    cartStatus
                }
            }
        }
    }

    private var heroCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Loja de pesca.")
                .font(.system(size: 34, weight: .bold, design: .serif))
                .foregroundStyle(.white)

            Text("Navegue por varas, carretilhas e iscas para montar seu conjunto com desempenho consistente em rios, represas e costeira.")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.white.opacity(0.88))
                .fixedSize(horizontal: false, vertical: true)

            HStack(spacing: 12) {
                metricCard(value: "\(viewModel.sections.count)", label: "seções")
                metricCard(value: "\(viewModel.totalProducts)", label: "itens")
                metricCard(value: "\(cartStore.totalQuantity)", label: "no carrinho")
            }
        }
        .padding(22)
        .background(
            RoundedRectangle(cornerRadius: 34, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [ShopTheme.sea, Color(red: 0.09, green: 0.20, blue: 0.34)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 34, style: .continuous)
                .stroke(ShopTheme.stroke, lineWidth: 1)
        )
        .shadow(color: ShopTheme.sea.opacity(0.28), radius: 28, x: 0, y: 16)
    }

    private var cartStatus: some View {
        HStack(spacing: 8) {
            Image(systemName: "cart.fill")
            Text("\(cartStore.totalQuantity)")
                .fontWeight(.bold)
        }
        .font(.subheadline)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(ShopTheme.readableDarkSurface, in: Capsule())
        .overlay(
            Capsule()
                .stroke(ShopTheme.panelStroke, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.18), radius: 12, x: 0, y: 6)
        .foregroundStyle(.white)
    }

    private func metricCard(value: String, label: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(value)
                .font(.title3.weight(.bold))
            Text(label)
                .font(.caption.weight(.medium))
                .foregroundStyle(.white.opacity(0.82))
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.10), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .foregroundStyle(.white)
    }

    private func sectionHeader(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundStyle(ShopTheme.ink)

            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(ShopTheme.mutedInk)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(ShopTheme.readableSurface)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .stroke(ShopTheme.panelStroke, lineWidth: 1)
        )
        .shadow(color: ShopTheme.sea.opacity(0.10), radius: 16, x: 0, y: 8)
    }
}