//
//  FavoriteHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 31/07/2023.
//

import SwiftUI

struct FavoriteHeaderView: View {
    
    @Binding var isEditing: Bool
    @Binding var searchAction: Bool
    
    var body: some View {
        HStack {
            Text("FAVORITE")
                .modifier(TitleModifier())
                .padding(8)
            Spacer()
            HStack(spacing: 20) {
                Text(isEditing ? "Done" : "Edit")
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
                        isEditing.toggle()
                    }
                Image("SearchWhite")
                    .padding(.trailing, 8)
                    .onTapGesture {
                        searchAction.toggle()
                    }
            }
            .offset(x: isEditing ? 35 : 0)
            .animation(.easeInOut, value: isEditing)
        }
    }
}

struct FavoriteHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieNavigationHeaderView {
            FavoriteHeaderView(isEditing: .constant(false),
                               searchAction: .constant(true))
        }
    }
}
