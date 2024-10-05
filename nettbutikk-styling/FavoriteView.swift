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
            ForEach(viewModel.items.filter { $0.isFavorite }) { item in
                ItemCell(item: .constant(item), viewModel: viewModel)
            }
        }
        .navigationTitle("Favoritter")
    }
}
