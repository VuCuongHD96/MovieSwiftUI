//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by sun on 30/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    private var input = HomeViewModel.Input(loadTrigger: Driver.just(Void()))
    @ObservedObject private var output: HomeViewModel.Output
    var cancelBag = CancelBag()
    
    init(homeViewModel: HomeViewModel) {
        output = homeViewModel.transform(input, cancelBag: cancelBag)
    }
    
    var body: some View {
        MovieNavigationView {
            HStack {
                Text("HOME")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color.white)
                    .padding(8)
                Spacer()
                Image("SearchWhite")
                    .padding(.trailing, 8)
            }
        } bodyContent: {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    HomeNowArrayView()
                    Text("Top Rated")
                        .foregroundColor(.gray)
                        .font(.title3)
                    HomeTopRateGridView()
                }
                .padding([.top, .leading, .trailing], 16)
            }
        }
        .environmentObject(output)
        .background(Color.gray.opacity(0.1))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = HomeNavigator(navigationController: navigationController)
        let useCase = HomeUseCase()
        let categoryViewModel = HomeViewModel(navigator: navigator, useCase: useCase)
        NavigationView {
            HomeView(homeViewModel: categoryViewModel)
        }
    }
}
