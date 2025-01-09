//
//  Store.swift
//  HP Trivia
//
//  Created by Bhavin Bhadani on 09/01/25.
//

import Foundation
import StoreKit

enum BookStatus {
    case active
    case inactive
    case locked
}

@MainActor
class Store: ObservableObject {
    @Published var books: [BookStatus] = [.active, .active, .inactive, .locked, .locked, .locked, .locked]
    @Published var products: [Product] = []
    
    private var productIDs = ["hp4", "hp5", "hp6", "hp7"]
    
    func loadPoducts() async {
        do {
            products = try await Product.products(for: productIDs)
        } catch {
            print("Couldn't fetch products: \(error.localizedDescription)")
        }
    }
}
