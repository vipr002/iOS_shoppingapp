//
//  ItemDetails.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 28/09/2024.
//


import SwiftUI

struct ItemDetails: View {
    
    @Binding var item: Item
    @ObservedObject var viewModel: ItemViewModel
    
    var body: some View {
        
        ZStack {
            Color(UIColor(hex: "FFE9D2"))
                .ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                
                ZStack(alignment: .topTrailing) {
                    
                    // ---- Item image ----
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .clipped()
                }

                ZStack {
                    
                    Color(UIColor(hex: "BB8971"))
                    
                    VStack(spacing: 5) {
                        
                        HStack {
                            Text("\(item.name) \(item.price),-")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding(.trailing, 170)
                            
                            // ---- Favorite button ----
                            Button(action: {
                                viewModel.toggleFavorite(for: item)
                                print("tapped favorite in details sheet")
                            }) {
                                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Button(action: {
                            print("Buy button tapped")
                        }) {
                            Text("Kjøp")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .regular))
                                .padding(.vertical, 8)
                                .frame(maxWidth: 130)
                        }
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .padding()
                        .padding(.trailing, 225)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 150)
            }
        }
    }
}
