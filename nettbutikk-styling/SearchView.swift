//
//  SearchView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var textfieldText: String = ""
    @ObservedObject var viewModel: ItemViewModel
    
    var body: some View {
        
        ZStack {
            Color(UIColor(hex: "F6E4DC") ?? UIColor.white)
            
            VStack {

                TextField("Søk etter produkter", text: $textfieldText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .background(Color(UIColor(hex: "F6E4DC") ?? UIColor.white))

                // dersom søketekst ikke er tom, vis filtrerte elementer
                if !textfieldText.isEmpty {
                    ScrollView {
                        VStack {
                            
                            ForEach(viewModel.items.filter { item in
                                // filtrering basert på søketekst
                                item.name.localizedCaseInsensitiveContains(textfieldText)
                            }) { item in
                                ItemCell(item: .constant(item), viewModel: viewModel)
                            }
                        }
                    }
                } else {
                    Text("Ingen resultater å vise")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                Spacer()
            }
            .padding(.top, 10)
        }
    }
}
