//
//  GenreView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI

struct GenreView: View {
    
    private var input = GenreViewModel.Input(loadTrigger: Driver.just(Void()))
    @ObservedObject private var output: GenreViewModel.Output
    var cancelBag = CancelBag()
    
    init(categoryViewModel: GenreViewModel) {
        output = categoryViewModel.transform(input, cancelBag: cancelBag)
    }
    
    var body: some View {
        MovieNavigationView {
            HStack {
                Text("CATEGORY")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color.white)
                    .padding(8)
                Spacer()
                Image("SearchWhite")
                    .padding(.trailing, 8)
                    .onTapGesture {
                        input.searchButtonTapped.send()
                    }
            }
            .opacity(output.isLoading ? 0 : 1)
        } bodyContent: {
            ScrollView {
                ForEach(output.genreArray, id: \.id) { genre in
                    GenreCellView(genre: genre)
                        .onTapGesture {
                            input.genreItemTapped.send(genre)
                        }
                }
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
        }
        .alert(isPresented: .constant(output.alertMessage.isShowing)) {
            let alert = Alert(
                title: Text(output.alertMessage.title),
                message: Text(output.alertMessage.message)
            )
            return alert
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = GenreNavigator(navigationController: navigationController)
        let useCase = GenreUseCase()
        let categoryViewModel = GenreViewModel(navigator: navigator, useCase: useCase)
        let output = GenreViewModel.Output()
        output.genreArray = [.action, .adventure, .animation, .comedy, .crime]
        return GenreView(categoryViewModel: categoryViewModel)
            .environmentObject(output)
    }
}
