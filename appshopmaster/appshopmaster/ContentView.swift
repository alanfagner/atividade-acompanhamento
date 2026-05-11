//
//  ContentView.swift
//  appshopmaster
//
//  Created by Alan Fagner Goncalves on 11/05/26.
//

import SwiftUI

struct ContentView: View {
    let productRepository: any ProductRepository
    @ObservedObject private var cartStore: CartStore

    init(productRepository: any ProductRepository, cartStore: CartStore) {
        self.productRepository = productRepository
        self._cartStore = ObservedObject(wrappedValue: cartStore)
    }

    var body: some View {
        AppRootView(productRepository: productRepository, cartStore: cartStore)
    }
}

#Preview {
    ContentView(productRepository: MockProductRepository(), cartStore: CartStore())
}
