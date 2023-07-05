//
//  TabbarView.swift
//  MovieSwiftUI
//
//  Created by Work on 05/07/2023.
//

import SwiftUI

struct TabbarView: View {
    
    enum TabType: String {
        case movie = "MOVIE"
        case genre = "GENRE"
    }
    
    let navigator: TabbarNavigator
    @State var tabSelected = TabType.movie
    
    var body: some View {
        NavigationView {
            TabView(selection: $tabSelected) {
                HomeView(homeViewModel: navigator.createHomeViewModel())
                    .tabItem {
                        Image(tabSelected == .movie ? "MovieSelected" : "Movie")
                        Text(TabType.movie.rawValue)
                    }
                    .tag(TabType.movie)
                GenreView(categoryViewModel: navigator.createGenreViewModel())
                    .tabItem {
                        Image(tabSelected == .genre ? "GenreSelected" : "Genre")
                        Text(TabType.genre.rawValue)
                    }
                    .tag(TabType.genre)
            }
            .tint(Color.pink)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = TabbarNavigator(navigationController: navigationController)
        TabbarView(navigator: navigator)
    }
}
