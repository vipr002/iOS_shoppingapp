//
//  SearchView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var textfieldText: String = ""
    
    var body: some View {
        
        ZStack {
            // Bakgrunnsfargen for hele skjermen
            Color(UIColor(hex: "F6E4DC"))
             //   .edgesIgnoringSafeArea(.all)  Sørger for at fargen dekker hele skjermen
            
            VStack {

                TextField("Søk", text: $textfieldText)
                    .padding()
                    .background(Color.white) 
                    .cornerRadius(10)
                    .padding()
                    .background(Color(UIColor(hex: "F6E4DC"))) // Bakgrunnsfarge under søkefeltet
                
                Spacer() // Skyver innholdet nedover slik at bakgrunnen fyller resten av siden
            }
            .padding(.top, 10) // Valgfritt: Avstand fra toppen
        }
    }
}

    #Preview {
        SearchView()
    }
