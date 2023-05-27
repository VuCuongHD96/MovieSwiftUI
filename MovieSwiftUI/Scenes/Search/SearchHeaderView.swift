//
//  SearchHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 28/05/2023.
//

import SwiftUI

struct SearchHeaderView: View {

    @EnvironmentObject private var input: SearchViewModel.Input
    @State private var searchData = ""

    var body: some View {
        HStack(alignment: .center) {
            Button {
                input.backTrigger.send()
            } label: {
                Image("back")
            }
            TextField("Search movie name", text: $searchData)
                .onChange(of: searchData, perform: { newValue in
                    input.searchTrigger.send(newValue)
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
                print("button cancel click")
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
        SearchHeaderView()
            .environmentObject(searchViewModelInput)
    }
}
