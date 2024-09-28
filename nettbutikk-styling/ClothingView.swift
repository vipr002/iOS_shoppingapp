//
//  ClothingView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct ClothingView: View {
    
    var body: some View {
        
        ZStack {
            // Bakgrunnsfargen for hele skjermen
            Color(UIColor(hex: "FFE9D2"))
            //   .edgesIgnoringSafeArea(.all)  Sørger for at fargen dekker hele skjermen
            
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
                
                HStack {
                    Image("pants")
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                    Image("shirt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ClothingView()
}
