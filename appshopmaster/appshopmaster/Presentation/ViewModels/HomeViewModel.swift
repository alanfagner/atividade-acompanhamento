import Combine
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var sections: [ShopSection]

    private let cartManager: any CartManaging

    init(productRepository: any ProductRepository, cartManager: any CartManaging) {
        self.sections = productRepository.fetchSections()
        self.cartManager = cartManager
    }

    var featuredProducts: [Product] {
        sections.compactMap(\.products.first)
    }

    var totalProducts: Int {
        sections.reduce(0) { $0 + $1.products.count }
    }

    func addToCart(_ product: Product) {
        cartManager.add(product: product)
    }
}