//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by sun on 30/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var input: HomeViewModel.Input
    @ObservedObject private var output: HomeViewModel.Output
    var cancelBag = CancelBag()
    @State private var isViewLoaded = false

    
    init(homeViewModel: HomeViewModel) {
        let input = HomeViewModel.Input()
        output = homeViewModel.transform(input, cancelBag: cancelBag)
        self.input = input
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
        .onAppear {
            input.loadTrigger.send()
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
        NavigationView {
            HomeView(homeViewModel: homeViewModel)
        }
    }
}

struct LazyView<Content: View>: View {
    let content: () -> Content
    init(_ content: @autoclosure @escaping () -> Content) {
        self.content = content
    }
    
    var body: Content {
        content()
    }
}
