import SwiftUI

struct AppRootView: View {
    let productRepository: any ProductRepository
    @ObservedObject private var cartStore: CartStore

    init(productRepository: any ProductRepository, cartStore: CartStore) {
        self.productRepository = productRepository
        self._cartStore = ObservedObject(wrappedValue: cartStore)
    }

    var body: some View {
        TabView {
            HomeView(productRepository: productRepository, cartStore: cartStore)
                .tabItem {
                    Label("Início", systemImage: "sailboat.fill")
                }

            CategoriesView(productRepository: productRepository, cartStore: cartStore)
                .tabItem {
                    Label("Categorias", systemImage: "square.grid.2x2.fill")
                }

            CartView(cartStore: cartStore)
                .tabItem {
                    Label("Carrinho", systemImage: "cart.fill")
                }
        }
        .tint(ShopTheme.accent)
    }
}