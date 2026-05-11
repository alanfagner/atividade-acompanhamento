import Foundation

struct PriceSummary: Hashable, Sendable {
    let uniqueItems: Int
    let itemCount: Int
    let totalInCents: Int

    static let empty = PriceSummary(uniqueItems: 0, itemCount: 0, totalInCents: 0)
}