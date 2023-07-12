//
//  SearchHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 28/05/2023.
//

import SwiftUI

struct SearchHeaderView: View {

    @EnvironmentObject private var searchViewModelInput: SearchViewModel.Input
    @EnvironmentObject private var searchViewModelOutput: SearchViewModel.Output

    var body: some View {
        HStack(alignment: .center) {
            Button {
                searchViewModelInput.backTrigger.send()
            } label: {
                Image("back")
            }
            TextField("Search movie name", text: $searchViewModelOutput.searchData)
                .onChange(of: searchViewModelOutput.searchData, perform: { newValue in
                    searchViewModelInput.searchTrigger.send(newValue)
                })
                .accentColor(.white)
                .frame(height: 40)
                .padding(.leading, 8)
                .background(
                    Color
                        .yellow
                        .opacity(0.5)
                        .cornerRadius(8)
                )
                .foregroundColor(.white)
            Button {
                searchViewModelInput.cancelTrigger.send()
            } label: {
                Text("Cancel")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.medium)
                    .underline()
            }
        }
    }
}

struct SearchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModelInput = SearchViewModel.Input()
        let searchViewModelOutput = SearchViewModel.Output()
        SearchHeaderView()
            .environmentObject(searchViewModelInput)
            .environmentObject(searchViewModelOutput)
    }
}
