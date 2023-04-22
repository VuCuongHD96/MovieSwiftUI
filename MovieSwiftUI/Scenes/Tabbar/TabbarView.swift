//
//  TabbarView.swift
//  MovieSwiftUI
//
//  Created by Work on 09/03/2023.
//

import SwiftUI

struct TabbarView: View {
    
   private enum TabItemTag: String {
        case MOVIE
        case CATEGORY
        case FAVORITE
    }
    
    @State private var selection = TabItemTag.MOVIE

    var body: some View {
        TabView(selection: $selection) {
            LazyNavigationView(HomeView())
                .tabItem {
                    Image(selection == .MOVIE ? "MovieSelected" : "Movie")
                    Text("MOVIE")
                }
                .tag(TabItemTag.MOVIE)
            LazyNavigationView(CategoryView())
                .tabItem {
                    Image(selection == .CATEGORY ? "CategorySelected" : "Category")
                    Text("CATEGORY")
                }
                .tag(TabItemTag.CATEGORY)
            Text("Peaches 🍑🍑")
                .tabItem {
                    Image(selection == .FAVORITE ? "FavoriteSelected" : "Favorite")
                    Text("FAVORITE")
                }
                .tag(TabItemTag.FAVORITE)
        }
        .accentColor(Color.pink)
        .navigationBarBackButtonHidden()
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TabbarView()
        }
    }
}
