//
//  SearchHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 28/05/2023.
//

import SwiftUI

struct SearchHeaderView: View {

    @Binding var backTrigger: Void?
    @Binding var searchData: String
    @Binding var cancelAction: Void?

    var body: some View {
        HStack(alignment: .center) {
            Button {
                backTrigger = Void()
            } label: {
                Image("back")
            }
            TextField("Search movie name", text: $searchData)
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
                cancelAction = Void()
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
        SearchHeaderView(backTrigger: .constant(Void()),
                         searchData: .constant("A"),
                         cancelAction: .constant(Void()))
    }
}
