//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by sun on 30/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var homeViewModelInput: HomeViewModel.Input
    @ObservedObject private var homeViewModelOutput: HomeViewModel.Output
    var cancelBag = CancelBag()
    
    init(homeViewModel: HomeViewModel) {
        let homeViewModelInput = HomeViewModel.Input(loadTrigger: .just(Void()))
        homeViewModelOutput = homeViewModel.transform(homeViewModelInput, cancelBag: cancelBag)
        self.homeViewModelInput = homeViewModelInput
    }
    
    var body: some View {
        MovieNavigationView {
            HStack {
                Text("HOME")
                    .modifier(TitleModifier())
                    .padding(8)
                Spacer()
                Image("SearchWhite")
                    .padding(.trailing, 8)
                    .onTapGesture {
                        homeViewModelInput.searchAction.send()
                    }
            }
        } bodyContent: {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    HomeNowArrayView(firstMovieArray: homeViewModelOutput.firstMovieArray,
                                     movieSelectedTrigger: $homeViewModelInput.movieSelectedTrigger)
                    Text("Top Rated")
                        .foregroundColor(.gray)
                        .font(.title3)
                    HomeTopRateGridView(secondMovieArray: homeViewModelOutput.secondMovieArray,
                                        movieSelectedTrigger: $homeViewModelInput.movieSelectedTrigger)
                }
                .padding([.top, .leading, .trailing], 16)
            }
        }
        .background(Color.gray.opacity(0.1))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = HomeNavigator(navigationController: navigationController)
        let useCase = HomeUseCase()
        let homeViewModel = HomeViewModel(navigator: navigator, useCase: useCase)
        return HomeView(homeViewModel: homeViewModel)
    }
}
