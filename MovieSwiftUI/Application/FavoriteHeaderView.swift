//
//  FavoriteHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 31/07/2023.
//

import SwiftUI

struct FavoriteHeaderView: View {
    
    @Binding var click: Bool

    var body: some View {
        HStack {
            Text("FAVORITE")
                .modifier(TitleModifier())
                .padding(8)
            Spacer()
            HStack(spacing: 10) {
                Text(click ? "Done" : "Edit")
                    .underline()
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 3)
                    )
                    .cornerRadius(10)
                    .onTapGesture {
                        click.toggle()
                    }
                Image("SearchWhite")
                    .padding(.trailing, 8)
            }
            .offset(x: click ? 35 : 0)
            .animation(.easeInOut, value: click)
        }
    }
}

struct FavoriteHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieNavigationHeaderView {
            FavoriteHeaderView(click: .constant(true))
        }
    }
}
