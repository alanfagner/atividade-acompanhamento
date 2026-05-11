import Combine
import Foundation

@MainActor
final class CartViewModel: ObservableObject {
    @Published private(set) var items: [CartItem]
    @Published private(set) var summary: PriceSummary

    private let cartStore: CartStore
    private var cancellables: Set<AnyCancellable> = []

    init(cartStore: CartStore) {
        self.cartStore = cartStore
        self.items = cartStore.items
        self.summary = cartStore.summary

        cartStore.$items
            .receive(on: RunLoop.main)
            .sink { [weak self, weak cartStore] items in
                self?.items = items
                self?.summary = cartStore?.summary ?? .empty
            }
            .store(in: &cancellables)
    }

    func add(_ product: Product) {
        cartStore.add(product: product)
    }

    func decrement(_ product: Product) {
        cartStore.decrement(product: product)
    }

    func remove(_ product: Product) {
        cartStore.remove(product: product)
    }
}