//
//  ItemCell.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 28/09/2024.
//

import SwiftUI

struct ItemCell: View {
    
    @Binding var item: Item
    @ObservedObject var viewModel: ItemViewModel

    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            VStack {
                
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 163, height: 242)
                    .clipped()

                ZStack {
                    
                    Color(UIColor(hex: "BB8971"))
                    HStack {
                        Text("\(item.name) \(item.price),-")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .padding(.leading)
                        Spacer()
                    }
                }
                .frame(width: 163, height: 40)
                .padding(.top, -10)
            }

            // ---- Favorittikon ----
            Button(action: {
                viewModel.toggleFavorite(for: item)
                print("Favoritt status togglet for \(item.name)")
            }) {
                Image(systemName: viewModel.isFavorite(item) ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .padding()
    }
}
