//
//  FavoriteView.swift
//  MovieSwiftUI
//
//  Created by Work on 18/07/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    private let gridRows = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible())
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
            FavoriteHeaderView()
        } bodyContent: {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridRows, spacing: 20) {
                    ForEach(output.movieFavoriteList, id: \.movieID) { movie in
                        FavoriteCell(movie: movie)
                            .frame(height: 250)
                    }
                }
            }
            .padding()
        }
        .confirmationDialog("Do you want remove this movie", 
                            isPresented: $output.showDialogConfirm,
                            titleVisibility: .visible) {
            Button("DELETE", role: .destructive) {
                input.confirmRemoveMovieAction.send()
            }
        }
        .environmentObject(input)
        .onAppear {
            input.loadTrigger.send()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FavoriteViewModel()
        FavoriteView(viewModel: viewModel)
    }
}
