@MainActor
protocol CartManaging: AnyObject {
    var items: [CartItem] { get }
    var summary: PriceSummary { get }

    func add(product: Product)
    func decrement(product: Product)
    func remove(product: Product)
    func quantity(for product: Product) -> Int
}