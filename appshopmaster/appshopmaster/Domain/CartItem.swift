import Foundation

struct CartItem: Identifiable, Hashable, Sendable {
    let product: Product
    private(set) var quantity: Int

    var id: String { product.id }
    var subtotalInCents: Int { product.priceInCents * quantity }

    init(product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = max(1, quantity)
    }

    mutating func increment() {
        quantity += 1
    }

    @discardableResult
    mutating func decrement() -> Bool {
        quantity -= 1
        return quantity > 0
    }
}