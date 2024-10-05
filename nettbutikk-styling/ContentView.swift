//
//  ContentView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ItemViewModel()
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchView(viewModel: viewModel)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            FavoriteView(viewModel: viewModel) 
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            BasketView()
                .tabItem {
                    Label("Basket", systemImage: "basket")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .onAppear {
            viewModel.loadItems() // Laster inn elementene med favorittstatus
        }
    }
}
