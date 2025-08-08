//
//  ProductsModel.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 08/08/25.
//

import Foundation
struct ProductsModel: Identifiable{
    let id = UUID()
    let image: String
    let name: String
    let rating: String
    let price: String
}
