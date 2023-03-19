//
//  TabbarView.swift
//  MovieSwiftUI
//
//  Created by Work on 09/03/2023.
//

import SwiftUI

struct TabbarView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            Text("Apples 🍏🍏")
                .tabItem {
                    Image(selection == 0 ? "MovieSelected" : "Movie")
                    Text("MOVIE")
                }
                .tag(0)
            CategoryView()
                .tabItem {
                    Image(selection == 1 ? "CategorySelected" : "Category")
                    Text("CATEGORY")
                }
                .tag(1)
            Text("Peaches 🍑🍑")
                .tabItem {
                    Image(selection == 2 ? "FavoriteSelected" : "Favorite")
                    Text("FAVORITE")
                }
                .tag(2)
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
