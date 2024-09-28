//
//  FavoriteView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var viewModel: ItemViewModel

    var body: some View {
        
        List {
            // Filtrerer favoritt-elementer
            ForEach(viewModel.items.indices.filter { viewModel.items[$0].isFavorite }, id: \.self) { index in
                ItemCell(item: $viewModel.items[index], viewModel: viewModel)
            }
        }
        .navigationTitle("Favoritter")
    }
}
