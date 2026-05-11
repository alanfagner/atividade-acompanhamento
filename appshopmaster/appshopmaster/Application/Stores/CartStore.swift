import Combine
import Foundation

@MainActor
final class CartStore: ObservableObject, CartManaging {
    @Published private(set) var items: [CartItem] = []

    var summary: PriceSummary {
        PriceSummary(
            uniqueItems: items.count,
            itemCount: items.reduce(0) { $0 + $1.quantity },
            totalInCents: items.reduce(0) { $0 + $1.subtotalInCents }
        )
    }

    var totalQuantity: Int { summary.itemCount }

    func add(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increment()
            return
        }

        items.append(CartItem(product: product))
    }

    func decrement(product: Product) {
        guard let index = items.firstIndex(where: { $0.product.id == product.id }) else {
            return
        }

        if items[index].decrement() {
            return
        }

        items.remove(at: index)
    }

    func remove(product: Product) {
        items.removeAll { $0.product.id == product.id }
    }

    func quantity(for product: Product) -> Int {
        items.first(where: { $0.product.id == product.id })?.quantity ?? 0
    }
}