//
//  appshopmasterApp.swift
//  appshopmaster
//
//  Created by Alan Fagner Goncalves on 11/05/26.
//

import SwiftUI

@main
struct appshopmasterApp: App {
    @StateObject private var cartStore = CartStore()
    private let productRepository: any ProductRepository = MockProductRepository()

    var body: some Scene {
        WindowGroup {
            ContentView(productRepository: productRepository, cartStore: cartStore)
        }
    }
}
