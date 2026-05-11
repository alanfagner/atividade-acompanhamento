import Combine
import Foundation

@MainActor
final class CategoriesViewModel: ObservableObject {
    @Published private(set) var sections: [ShopSection]

    init(productRepository: any ProductRepository) {
        self.sections = productRepository.fetchSections()
    }
}