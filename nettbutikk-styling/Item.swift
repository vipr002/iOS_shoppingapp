//
//  Item.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 28/09/2024.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let imageName: String
    var isFavorite: Bool = false
}
