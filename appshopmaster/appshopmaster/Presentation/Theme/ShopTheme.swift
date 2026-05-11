import SwiftUI

enum ShopTheme {
    static let ink = Color(red: 0.07, green: 0.11, blue: 0.15)
    static let mutedInk = Color(red: 0.34, green: 0.40, blue: 0.45)
    static let card = Color.white.opacity(0.88)
    static let elevatedCard = Color.white.opacity(0.96)
    static let stroke = Color.white.opacity(0.35)
    static let panelStroke = Color.white.opacity(0.52)
    static let accent = Color(red: 0.88, green: 0.57, blue: 0.18)
    static let sea = Color(red: 0.13, green: 0.43, blue: 0.47)
    static let foam = Color(red: 0.95, green: 0.93, blue: 0.87)
    static let readableSurface = Color.white.opacity(0.78)
    static let readableDarkSurface = Color.black.opacity(0.30)

    static let backgroundGradient = LinearGradient(
        colors: [
            Color(red: 0.98, green: 0.95, blue: 0.89),
            Color(red: 0.90, green: 0.94, blue: 0.90),
            Color(red: 0.80, green: 0.88, blue: 0.85)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let backgroundScrim = LinearGradient(
        colors: [
            Color.white.opacity(0.10),
            Color.white.opacity(0.03),
            Color.black.opacity(0.05)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
}

struct SectionStyle {
    let accent: Color
    let tint: Color
    let glow: Color

    var gradient: LinearGradient {
        LinearGradient(colors: [accent, tint], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

extension ShopSectionID {
    var style: SectionStyle {
        switch self {
        case .rods:
            SectionStyle(
                accent: Color(red: 0.06, green: 0.30, blue: 0.47),
                tint: Color(red: 0.20, green: 0.66, blue: 0.77),
                glow: Color(red: 0.77, green: 0.92, blue: 0.95)
            )
        case .reels:
            SectionStyle(
                accent: Color(red: 0.20, green: 0.19, blue: 0.35),
                tint: Color(red: 0.53, green: 0.39, blue: 0.74),
                glow: Color(red: 0.86, green: 0.83, blue: 0.95)
            )
        case .lures:
            SectionStyle(
                accent: Color(red: 0.63, green: 0.32, blue: 0.10),
                tint: Color(red: 0.90, green: 0.62, blue: 0.21),
                glow: Color(red: 0.98, green: 0.91, blue: 0.76)
            )
        }
    }
}

enum PriceFormatter {
    private static let locale = Locale(identifier: "pt_BR")

    static func string(from cents: Int) -> String {
        let amount = Double(cents) / 100
        return amount.formatted(.currency(code: "BRL").locale(locale))
    }
}