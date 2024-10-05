//
//  ItemViewModel.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 28/09/2024.
//

import Foundation
import Combine

class ItemViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    let defaults = UserDefaults.standard

    struct Keys {
        static let favoritesKeyPrefix = "favorites_"
    }

    init() {
        loadItems()
    }

    func loadItems() {
        items = mockItems.map { item in
            var updatedItem = item
            let isFavorite = defaults.bool(forKey: "\(Keys.favoritesKeyPrefix)\(item.id.uuidString)")
            updatedItem.isFavorite = isFavorite
            return updatedItem
        }
    }

    func toggleFavorite(for item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isFavorite.toggle()
            
            defaults.set(items[index].isFavorite, forKey: "\(Keys.favoritesKeyPrefix)\(items[index].id.uuidString)")
            print("Favorittstatus for \(item.name) er nå lagret som \(items[index].isFavorite)")

            objectWillChange.send()  // Trigger UI-oppdatering
        }
    }
}
