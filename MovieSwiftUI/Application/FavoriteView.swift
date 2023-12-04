//
//  FavoriteView.swift
//  MovieSwiftUI
//
//  Created by Work on 18/07/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    private let gridRows = [
        GridItem(spacing: 20),
        GridItem()
    ]
    
    @ObservedObject private var input: FavoriteViewModel.Input
    @ObservedObject private var output: FavoriteViewModel.Output
    private var cancelBag = CancelBag()
    
    init(viewModel: FavoriteViewModel) {
        let input = FavoriteViewModel.Input()
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        MovieNavigationView {
            FavoriteHeaderView(isEditing: $input.isEditing,
                               searchAction: $input.searchAction)
        } bodyContent: {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridRows, spacing: 30) {
                    ForEach(output.movieFavoriteList, id: \.movieID) { movie in
                        FavoriteCell(editing: $input.isEditing,
                                     removeAction: $input.removeAction,
                                     movie: movie)
                        .frame(height: 250)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            input.loadTrigger.send()
        }
        .confirmationDialog("Do you want remove this movie",
                            isPresented: $output.showDialogConfirm,
                            titleVisibility: .visible) {
            Button("DELETE", role: .destructive) {
                input.confirmRemoveMovieAction.send()
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = FavoriteNavigator(navigationController: navigationController)
        let viewModel = FavoriteViewModel(navigator: navigator)
        FavoriteView(viewModel: viewModel)
    }
}
