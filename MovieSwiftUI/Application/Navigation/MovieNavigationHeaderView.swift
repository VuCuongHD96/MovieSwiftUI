//
//  MovieNavigationHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI

struct MovieNavigationHeaderView<Content: View>: View {
    
    // MARK: - Define
    typealias ContentHandler = () -> Content
    
    // MARK: - Property
    let content: Content
    
    // MARK: - Init
    init(@ViewBuilder content: ContentHandler) {
        self.content = content()
    }
    
    // MARK: - View
    var body: some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 0)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "F99F00"), Color(hex: "DB3069")]),
                        startPoint: .leading,
                        endPoint: .trailing))
                    .ignoresSafeArea(edges: .top)
            )
    }
}

struct MovieNavigationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieNavigationHeaderView {
            HStack {
                Text("Left button")
                Spacer()
                Text("Right button")
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
