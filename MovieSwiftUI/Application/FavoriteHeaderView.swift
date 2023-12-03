//
//  FavoriteHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 31/07/2023.
//

import SwiftUI

struct FavoriteHeaderView: View {
    
    @EnvironmentObject private var input: FavoriteViewModel.Input

    var body: some View {
        HStack {
            Text("FAVORITE")
                .modifier(TitleModifier())
                .padding(8)
            Spacer()
            HStack(spacing: 10) {
                Text(input.editing ? "Done" : "Edit")
                    .underline()
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 5)
                    )
                    .cornerRadius(10)
                    .onTapGesture {
                        input.editing.toggle()
                    }
                Image("SearchWhite")
                    .padding(.trailing, 8)
            }
            .offset(x: input.editing ? 35 : 0)
            .animation(.easeInOut, value: input.editing)
        }
    }
}

struct FavoriteHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let input = FavoriteViewModel.Input()
        MovieNavigationHeaderView {
            FavoriteHeaderView()
        }
        .environmentObject(input)
    }
}
