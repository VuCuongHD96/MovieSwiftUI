//
//  TitleModifier.swift
//  MovieSwiftUI
//
//  Created by Work on 31/07/2023.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .font(
                .custom("Helvetica-Neue", size: 20)
                .weight(.medium)
            )
            .foregroundColor(Color.white)
    }
}

private struct TitleModifierTest: View {
    
    var body: some View {
        MovieNavigationHeaderView {
            Text("abc")
                .modifier(TitleModifier())
        }
    }
}

struct TitleModifierTest_Previews: PreviewProvider {
    
    static var previews: some View {
        TitleModifierTest()
    }
}
