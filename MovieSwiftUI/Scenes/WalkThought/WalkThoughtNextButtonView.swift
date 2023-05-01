//
//  WalkThoughtNextButtonView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughtNextButtonView: View {
    
    @EnvironmentObject private var input: WalkThoughtListViewModel.Input
    
    var body: some View {
        Button {
            withAnimation {
                input.selectedIndex += 1
            }
        } label: {
            HStack {
                Text("Next")
                Image("WalkThoughArrow")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .foregroundColor(.white)
        .frame(width: 192, height: 54)
        .overlay(
            RoundedRectangle(cornerRadius: 27)
                .stroke(.white, lineWidth: 2)
        )
    }
}

struct WalkThoughtNextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WalkThoughtNextButtonView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
