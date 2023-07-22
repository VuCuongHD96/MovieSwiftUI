//
//  GenreView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI

struct GenreView: View {
    
    @EnvironmentObject private var input: GenreViewModel.Input
    @EnvironmentObject private var output: GenreViewModel.Output
    
    init() {
        print("----- debug ------ GenreView init")
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
                ForEach(output.genreArray, id: \.id) { item in
                    GenreCellView(categoryName: item.name)
                        .onTapGesture {
                            input.genreItemTapped.send()
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
        let input = GenreViewModel.Input()
        let output = GenreViewModel.Output()
        GenreView()
            .environmentObject(input)
            .environmentObject(output)
            .onAppear {
                input.loadTrigger.send()
            }
    }
}
