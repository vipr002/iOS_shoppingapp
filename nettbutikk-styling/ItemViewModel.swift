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
    
    // Nøkkel for lagring av favorittelementer i UserDefaults
    private let favoritesKey = "favoriteItems"

    init() {
        loadItems() // Laster inn items når ViewModel initialiseres
    }

    func loadItems() {
        // Last mock data og sjekk om de er favoritter
        items = mockItems.map { item in
            var updatedItem = item
            if isFavorite(item) {
                updatedItem.isFavorite = true
                print("Loaded favorite status for \(item.name): true")
            } else {
                updatedItem.isFavorite = false
                print("Loaded favorite status for \(item.name): false")
            }
            return updatedItem
        }
    }

    func isFavorite(_ item: Item) -> Bool {
        // Sjekk om elementet er lagret som favoritt i UserDefaults
        let savedFavorites = UserDefaults.standard.array(forKey: favoritesKey) as? [String] ?? []
        return savedFavorites.contains(item.id.uuidString)
    }

    func toggleFavorite(for item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isFavorite.toggle()

            var savedFavorites = UserDefaults.standard.array(forKey: favoritesKey) as? [String] ?? []
            if items[index].isFavorite {
                savedFavorites.append(item.id.uuidString)
            } else {
                savedFavorites.removeAll { $0 == item.id.uuidString }
            }
            UserDefaults.standard.set(savedFavorites, forKey: favoritesKey)
            print("Favoritt status togglet for \(item.name), lagret i UserDefaults.")
        }
    }
}
