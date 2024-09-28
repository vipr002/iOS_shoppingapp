//
//  ClothingView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct ClothingView: View {
    
    @State private var items = mockItems
    
    var body: some View {
        
        ZStack {

            Color(UIColor(hex: "FFE9D2"))
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    NavigationLink(destination: ClothingView()) {
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
                .background(Color.white) // Bakgrunnsfarge for kategoriene
                
                VStack {
                    
                    ScrollView(.horizontal) {
                        
                        HStack {
                            
                            ForEach($items) { $item in
                                ItemCell(item: $item)
                            }
                        }
                    }
                    .padding(.horizontal, 0.5)
                    
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
    }
}

#Preview {
    ClothingView()
}
