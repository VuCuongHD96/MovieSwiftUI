//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by sun on 30/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var input: HomeViewModel.Input
    @EnvironmentObject private var output: HomeViewModel.Output
    
    public init() {
        print("----- debug ------ HomeView init")
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
                    .onTapGesture {
                        input.searchAction.send()
                    }
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
        .environmentObject(input)
        .background(Color.gray.opacity(0.1))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = HomeNavigator(navigationController: navigationController)
        let useCase = HomeUseCase()
        let homeViewModel = HomeViewModel(navigator: navigator, useCase: useCase)
        let input = HomeViewModel.Input()
        let output = homeViewModel.transform(input, cancelBag: CancelBag())
        HomeView()
            .environmentObject(input)
            .environmentObject(output)
            .onAppear {
                input.loadTrigger.send()
            }
    }
}
