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
    var cancelBag = CancelBag()
    @State var tabSelected = TabType.movie
    @ObservedObject private var homeInput: HomeViewModel.Input
    @ObservedObject private var homeOutput: HomeViewModel.Output
    @ObservedObject private var genreInput: GenreViewModel.Input
    @ObservedObject private var genreOutput: GenreViewModel.Output
    
    init(navigator: TabbarNavigator) {
        self.navigator = navigator
        let homeViewModel = navigator.createHomeViewModel()
        let homeInput = HomeViewModel.Input()
        homeOutput = homeViewModel.transform(homeInput, cancelBag: cancelBag)
        self.homeInput = homeInput
        let genreViewModel = navigator.createGenreViewModel()
        let genreInput = GenreViewModel.Input()
        genreOutput = genreViewModel.transform(genreInput, cancelBag: cancelBag)
        self.genreInput = genreInput
    }
    
    var body: some View {
        TabView(selection: $tabSelected) {
            LazyView(HomeView())
                .tabItem {
                    Image(tabSelected == .movie ? "MovieSelected" : "Movie")
                    Text(TabType.movie.rawValue)
                }
                .tag(TabType.movie)
                .environmentObject(homeInput)
                .environmentObject(homeOutput)
            LazyView(GenreView())
                .tabItem {
                    Image(tabSelected == .genre ? "GenreSelected" : "Genre")
                    Text(TabType.genre.rawValue)
                }
                .tag(TabType.genre)
                .environmentObject(genreInput)
                .environmentObject(genreOutput)
        }
        .tint(Color.pink)
        .onAppear {
            tabSelected = .genre
            homeInput.loadTrigger.send()
            genreInput.loadTrigger.send()
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
