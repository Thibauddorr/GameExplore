//
//  ContentView.swift
//  GameExplore
//
//  Created by Thibaud DORR on 13/09/2023.
//

import SwiftUI

struct GameExploreTabView: View {
    var body: some View{
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            LibraryView()
                .tabItem{
                    Image(systemName: "building.columns.circle")
                    Text("Library")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameExploreTabView()
    }
}
