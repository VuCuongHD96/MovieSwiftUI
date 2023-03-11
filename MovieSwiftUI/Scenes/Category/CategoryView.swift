//
//  CategoryView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI
import Combine

struct CategoryView: View {
    
    private var categoryViewModel = CategoryViewModel()
    @ObservedObject private var output: CategoryViewModel.Output
    var cancelBag = CancelBag()
    
    init() {
        let input = CategoryViewModel.Input(loadTrigger: Driver.just(Void()))
        output = categoryViewModel.transform(input, cancelBag: cancelBag)
    }
    
    var body: some View {
        VStack {
            MovieNavigationView {
                Text("CATEGORY")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color.white)
                    .padding(8)
                Spacer()
                Image("SearchWhite")
                    .padding(.trailing, 8)
            }
            .opacity(output.isLoading ? 0 : 1)
            ScrollView {
                ForEach(output.genreArray, id: \.id) { item in
                    CategoryCellView(categoryName: item.name)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
        .ignoresSafeArea()
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
        CategoryView()
    }
}
