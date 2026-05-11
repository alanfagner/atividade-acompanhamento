import Foundation

struct Product: Identifiable, Hashable, Sendable {
    let id: String
    let sectionID: ShopSectionID
    let name: String
    let subtitle: String
    let details: String
    let priceInCents: Int
    let badge: String
    let iconName: String
}