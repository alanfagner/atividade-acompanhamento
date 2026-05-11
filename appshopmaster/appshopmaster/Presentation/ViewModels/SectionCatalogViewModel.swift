import Combine
import Foundation

@MainActor
final class SectionCatalogViewModel: ObservableObject {
    let section: ShopSection

    private let cartManager: any CartManaging

    init(section: ShopSection, cartManager: any CartManaging) {
        self.section = section
        self.cartManager = cartManager
    }

    func addToCart(_ product: Product) {
        cartManager.add(product: product)
    }
}