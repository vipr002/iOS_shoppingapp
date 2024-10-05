//
//  ClothingView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct ClothingView: View {
    
    @ObservedObject var viewModel: ItemViewModel
    @State private var selectedItem: Item?
    
    var body: some View {
        
        ZStack {
            Color(UIColor(hex: "FFE9D2"))
            
            ScrollView(.vertical) {
                
                VStack {
                    
                    // ---- Kategorier øverst ----
                    HStack {
                        Spacer()
                        NavigationLink(destination: ClothingView(viewModel: viewModel)) {
                            Text("Klær")
                        }
                        Spacer()
                        Text("Sko")
                            .onTapGesture {
                                print("Sko tapped")
                            }
                        Spacer()
                        Text("Tilbehør")
                            .onTapGesture {
                                print("Tilbehør tapped")
                            }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    
                    // ---- Horisontale Items ----
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach($viewModel.items, id: \.id) { $item in
                                ItemCell(item: $item, viewModel: viewModel)
                                    .onTapGesture {
                                        selectedItem = item
                                    }
                            }
                        }
                    }
                    .padding(.horizontal, 0.5)
                    
                    // --- Seksjon for høsttrender ---
                    ZStack {
                        Color(UIColor(hex: "914920"))
                            .frame(height: 400)
                        
                        VStack {
                            Text("Høstens store trender")
                                .foregroundColor(.white)
                                .aspectRatio(contentMode: .fit)
                                .font(.title)
                                .padding(.top, 1)
                            
                            Image("blazer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Button(action: {
                                print("Nyhet button tapped")
                            }) {
                                Text("Nyheter")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .bold))
                                    .padding()
                                    .frame(maxWidth: 130)
                            }
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .padding(.top, 8)
                            .padding(.trailing, 225)
                        }
                    }
                }
                Spacer()
            }
        }
        // Sheet for å vise item-detaljer
        .sheet(item: $selectedItem) { item in
            if let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
                ItemDetails(item: $viewModel.items[index], viewModel: viewModel)
                    .presentationDetents([.fraction(0.7), .large])
            }
        }
    }
}
