//
//  WalkThoughtNextButtonView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughtNextButtonView: View {
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button {
            withAnimation {
                selectedIndex += 1
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
        WalkThoughtNextButtonView(selectedIndex: .constant(0))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
