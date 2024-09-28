//
//  FavoritesDatabase.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 28/09/2024.
//

import Foundation

final class FavoritesDatabase {
    
    private let FAV_KEY = "favoriteItems"

    // Lagrer favorittelementer som UUID-er
    func save(favoriteItems: Set<UUID>) {
        let array = Array(favoriteItems.map { $0.uuidString })
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }

    // Henter lagrede favorittelementer som UUID-er
    func load() -> Set<UUID> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [String] ?? []
        return Set(array.compactMap { UUID(uuidString: $0) })
    }
}
