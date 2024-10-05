//
//  FavoriteView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var viewModel: ItemViewModel
    @State private var selectedItem: Item?

    var body: some View {
        
        ScrollView(.vertical) {
            
            VStack {
                
                ForEach(viewModel.items.filter { $0.isFavorite }) { item in
                    ItemCell(item: .constant(item), viewModel: viewModel)
                        .onTapGesture {
                            selectedItem = item
                            print("Tapped: \(item.name)")
                        }
                }
            }
            .navigationTitle("Favoritter")
        }
        
        // ---- showing item details ----
        .sheet(item: $selectedItem) { item in
            if let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
                ItemDetails(item: $viewModel.items[index], viewModel: viewModel)
                    .presentationDetents([.fraction(0.7), .large])
            }
        }
    }
}
