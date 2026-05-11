import Foundation

enum ShopSectionID: String, CaseIterable, Identifiable, Sendable {
    case rods
    case reels
    case lures

    var id: String { rawValue }
}

struct ShopSection: Identifiable, Hashable, Sendable {
    let id: ShopSectionID
    let title: String
    let subtitle: String
    let heroTitle: String
    let heroDescription: String
    let iconName: String
    let products: [Product]
}