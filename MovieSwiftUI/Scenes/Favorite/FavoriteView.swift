//
//  FavoriteView.swift
//  MovieSwiftUI
//
//  Created by Work on 05/07/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var input: FavoriteViewModel.Input
    @ObservedObject var output: FavoriteViewModel.Output
    var cancelBag = CancelBag()

    
    init(viewModel: FavoriteViewModel) {
        let input = FavoriteViewModel.Input()
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        ZStack {
            Color.blue
            Button {
                input.searchAction.send()
            } label: {
                Text("Favorite")
                    .foregroundColor(.white)
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = FavoriteNavigator(navigationController: navigationController)
        let viewModel = FavoriteViewModel(navigator: navigator)
        return FavoriteView(viewModel: viewModel)
    }
}
