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

            Color(UIColor(hex: "F6E4DC"))
            
            VStack {

                TextField("Søk", text: $textfieldText)
                    .padding()
                    .background(Color.white) 
                    .cornerRadius(10)
                    .padding()
                    .background(Color(UIColor(hex: "F6E4DC")))
                
                Spacer()
            }
            .padding(.top, 10) 
        }
    }
}

    #Preview {
        SearchView()
    }
