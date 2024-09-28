//
//  HomeView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                // ---- Kategorier ----
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
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        ZStack {
                            
                            Color(UIColor(hex: "BD738E"))
                                .frame(height: 450)
                            
                            Image("woman")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, -30)
                                .padding(.bottom, 50)
                            
                            Text("Øreringer 999,-")
                                .foregroundColor(.white)
                                .padding(.bottom, 260)
                                .padding(.trailing, 250)
                            
                            Button(action: {
                                print("Nyhet button tapped")
                            }) {
                                Text("Nyheter")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .padding(.top, 370)
                            .padding(.leading, 20)
                            .padding(.trailing, 200)
                        }
                        
                        
                        ZStack {
                            Color(UIColor(hex: "BB8971"))
                                .frame(height: 400)
                            
                            HStack {
                                Image("man")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, -100)
                                
                                Image("jewelry")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, -100)
                            }
                            .padding(.horizontal)
                            
                            VStack {
            
                                Text("Høstens fineste smykker!")
                                    .foregroundColor(.white)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, 260)
                                    .font(.title)
                                
                                Button(action: {
                                    print("Se mer button tapped")
                                }) {
                                    Text("Se mer her >")
                                        .foregroundColor(.white)
                                        .padding(.top, 3)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    HomeView()
}
