//
//  WalkThoughtListView.swift
//  MovieSwiftUI
//
//  Created by Work on 05/03/2023.
//

import SwiftUI

struct WalkThoughtListView: View {
    
    @ObservedObject private var input: WalkThoughtListViewModel.Input
    @ObservedObject private var output: WalkThoughtListViewModel.Output
    private let cancelBag = CancelBag()
    
    init(viewModel: WalkThoughtListViewModel) {
        let input = WalkThoughtListViewModel.Input(loadTrigger: .just(Void()))
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        TabView(selection: $input.selectedIndex) {
            ForEach(0..<output.walkThoughArray.count, id: \.self) { index in
                let item = output.walkThoughArray[index]
                WalkThoughtView(walkThough: item)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .overlay {
            WalkThoughOverlayView(walkThoughArray: output.walkThoughArray,
                                  selectedIndex: $input.selectedIndex,
                                  getStatedButtonDidTap: $input.getStatedButtonDidTap)
        }
        .ignoresSafeArea()
        .background(Color.white)
    }
}

struct ListWalkThoughtView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = WalkThoughtListNavigator(navigationController: navigationController)
        let viewModel = WalkThoughtListViewModel(navigator: navigator)
        return WalkThoughtListView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
            .background(Color.blue)
    }
}
