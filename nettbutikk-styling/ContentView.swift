//
//  ContentView.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
            
            TabView {
                
                HomeView()
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                
                SearchView()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
                
                FavoriteView()
                    .tabItem {
                        Label("", systemImage: "heart")
                    }
                
                BasketView()
                    .tabItem {
                        Label("", systemImage: "basket")
                    }

                ProfileView()
                    .tabItem {
                        Label("", systemImage: "person")
                    }
            }
    }
}

#Preview {
    ContentView()
}
