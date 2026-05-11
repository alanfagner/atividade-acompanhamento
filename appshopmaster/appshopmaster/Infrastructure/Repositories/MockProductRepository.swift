struct MockProductRepository: ProductRepository {
    func fetchSections() -> [ShopSection] {
        [rodsSection, reelsSection, luresSection]
    }
}

private extension MockProductRepository {
    var rodsSection: ShopSection {
        ShopSection(
            id: .rods,
            title: "Varas",
            subtitle: "Arremesso equilibrado para água doce e costeira.",
            heroTitle: "Precisão e resposta rápida em cada fisgada.",
            heroDescription: "Seleção técnica para pincho, corrico leve e arremessos longos com acabamento premium.",
            iconName: "figure.fishing",
            products: [
                Product(
                    id: "shoreline-carbon-66",
                    sectionID: .rods,
                    name: "Shoreline Carbon 6'6\"",
                    subtitle: "Carbono IM8 • 12-25 lb",
                    details: "Ação rápida com excelente sensibilidade para tucunaré, robalo e meia-água.",
                    priceInCents: 89990,
                    badge: "Mais vendida",
                    iconName: "figure.fishing"
                ),
                Product(
                    id: "tucuna-pro-17",
                    sectionID: .rods,
                    name: "Tucuna Pro 17 lb",
                    subtitle: "One piece • 5'8\"",
                    details: "Backbone firme para estruturas fechadas, mantendo leveza na mão o dia todo.",
                    priceInCents: 74990,
                    badge: "Controle fino",
                    iconName: "bolt.fill"
                ),
                Product(
                    id: "estuary-fly-90",
                    sectionID: .rods,
                    name: "Estuary Fly 9'0\"",
                    subtitle: "#7/8 • Salt ready",
                    details: "Blank responsivo com passadores preparados para salinidade e vento lateral.",
                    priceInCents: 119990,
                    badge: "Premium",
                    iconName: "wind"
                ),
                Product(
                    id: "storm-jig-70",
                    sectionID: .rods,
                    name: "Storm Jig Hunter 7'0\"",
                    subtitle: "Jigging médio • 20-40 lb",
                    details: "Ideal para toques verticais e trabalho contínuo com conforto no grip.",
                    priceInCents: 104990,
                    badge: "Água salgada",
                    iconName: "water.waves"
                )
            ]
        )
    }

    var reelsSection: ShopSection {
        ShopSection(
            id: .reels,
            title: "Carretilhas",
            subtitle: "Tração estável e ergonomia para longas jornadas.",
            heroTitle: "Freio consistente quando o peixe muda de direção.",
            heroDescription: "Modelos com drag confiável, recolhimento suave e relação pensada para performance real.",
            iconName: "dial.high.fill",
            products: [
                Product(
                    id: "tide-control-150",
                    sectionID: .reels,
                    name: "Tide Control 150",
                    subtitle: "7.3:1 • 9 rolamentos",
                    details: "Recolhimento rápido com manivela firme e freio magnético fácil de ajustar.",
                    priceInCents: 134990,
                    badge: "Performance",
                    iconName: "gauge.with.dots.needle.67percent"
                ),
                Product(
                    id: "brute-drag-200",
                    sectionID: .reels,
                    name: "Brute Drag 200",
                    subtitle: "6.6:1 • Drag 8 kg",
                    details: "Construção robusta para hélices, jigs e brigas em estruturas pesadas.",
                    priceInCents: 159990,
                    badge: "Força máxima",
                    iconName: "shield.lefthalf.filled"
                ),
                Product(
                    id: "lagoon-bfs-70",
                    sectionID: .reels,
                    name: "Lagoon BFS 70",
                    subtitle: "8.1:1 • Super leve",
                    details: "Carretel raso para iscas leves com saída limpa e excelente controle fino.",
                    priceInCents: 172490,
                    badge: "BFS",
                    iconName: "leaf.fill"
                ),
                Product(
                    id: "offshore-round-300",
                    sectionID: .reels,
                    name: "Offshore Round 300",
                    subtitle: "5.4:1 • Perfil redondo",
                    details: "Capacidade de linha elevada e torque confortável para costeiras e corrico.",
                    priceInCents: 189990,
                    badge: "Capacidade alta",
                    iconName: "circle.hexagongrid.fill"
                )
            ]
        )
    }

    var luresSection: ShopSection {
        ShopSection(
            id: .lures,
            title: "Iscas & Acessórios",
            subtitle: "Curadoria para superfície, meia-água e acabamento de conjunto.",
            heroTitle: "Ajuste fino do ataque visual ao trabalho de água.",
            heroDescription: "Iscas e acessórios para montar um setup equilibrado, pronto para mudar de cenário rápido.",
            iconName: "fish.fill",
            products: [
                Product(
                    id: "flash-minnow-110",
                    sectionID: .lures,
                    name: "Flash Minnow 110",
                    subtitle: "Meia-água • Floating",
                    details: "Nado lateral agressivo e transferência de peso para arremessos longos.",
                    priceInCents: 8990,
                    badge: "Ataque visual",
                    iconName: "fish.fill"
                ),
                Product(
                    id: "storm-pencil-95",
                    sectionID: .lures,
                    name: "Storm Pencil 95",
                    subtitle: "Superfície • Stick bait",
                    details: "Trabalho em zara com ruído seco e excelente resposta em água mais lisa.",
                    priceInCents: 7590,
                    badge: "Superfície",
                    iconName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill"
                ),
                Product(
                    id: "fluoro-leader-040",
                    sectionID: .lures,
                    name: "Fluoro Leader 0,40 mm",
                    subtitle: "50 m • Alta abrasão",
                    details: "Transparência consistente e resistência para pedras, galhadas e costeira.",
                    priceInCents: 5490,
                    badge: "Essencial",
                    iconName: "point.topleft.down.curvedto.point.bottomright.up"
                ),
                Product(
                    id: "braid-ocean-30",
                    sectionID: .lures,
                    name: "Ocean Braid 30 lb",
                    subtitle: "8 fios • 150 m",
                    details: "Perfil arredondado para melhor saída e leitura limpa da isca na água.",
                    priceInCents: 12990,
                    badge: "Montagem completa",
                    iconName: "line.3.crossed.swirl.circle.fill"
                )
            ]
        )
    }
}