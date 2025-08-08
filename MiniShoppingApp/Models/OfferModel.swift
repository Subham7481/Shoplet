//
//  OfferModel.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 08/08/25.
//

import Foundation
struct Offer: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
}
