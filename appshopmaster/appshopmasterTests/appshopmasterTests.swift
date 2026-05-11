//
//  appshopmasterTests.swift
//  appshopmasterTests
//
//  Created by Alan Fagner Goncalves on 11/05/26.
//

import Testing
@testable import appshopmaster

struct appshopmasterTests {

    @Test func mockRepositoryProvidesAtLeastThreeSections() async throws {
        let sections = MockProductRepository().fetchSections()

        #expect(sections.count >= 3)
        #expect(Set(sections.map(\.id)) == Set(ShopSectionID.allCases))
        #expect(sections.allSatisfy { !$0.products.isEmpty })
    }

    @Test @MainActor func cartAggregatesQuantityAndTotal() async throws {
        let store = CartStore()
        let product = MockProductRepository().fetchSections()[0].products[0]

        store.add(product: product)
        store.add(product: product)

        #expect(store.items.count == 1)
        #expect(store.summary.itemCount == 2)
        #expect(store.summary.uniqueItems == 1)
        #expect(store.summary.totalInCents == product.priceInCents * 2)
    }

    @Test @MainActor func decrementRemovesItemWhenQuantityReachesZero() async throws {
        let store = CartStore()
        let product = MockProductRepository().fetchSections()[1].products[0]

        store.add(product: product)
        store.decrement(product: product)

        #expect(store.items.isEmpty)
        #expect(store.summary == .empty)
    }

    @Test @MainActor func removeEliminatesOnlyTargetProduct() async throws {
        let store = CartStore()
        let sections = MockProductRepository().fetchSections()
        let firstProduct = sections[0].products[0]
        let secondProduct = sections[2].products[0]

        store.add(product: firstProduct)
        store.add(product: firstProduct)
        store.add(product: secondProduct)
        store.remove(product: firstProduct)

        #expect(store.items.count == 1)
        #expect(store.items.first?.product.id == secondProduct.id)
        #expect(store.summary.itemCount == 1)
        #expect(store.summary.totalInCents == secondProduct.priceInCents)
    }
}
