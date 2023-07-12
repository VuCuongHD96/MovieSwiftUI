//
//  MovieNavigationView.swift
//  MovieSwiftUI
//
//  Created by Work on 20/05/2023.
//

import SwiftUI

struct MovieNavigationView<HeaderContent: View, BodyContent: View>: View {
    
    // MARK: - Define
    typealias HeaderContentHandler = () -> HeaderContent
    typealias BodyContentHandler = () -> BodyContent
    
    // MARK: - Property
    let headerContent: HeaderContent
    let bodyContent: BodyContent
    
    // MARK: - Init
    init(@ViewBuilder headerContent: HeaderContentHandler, @ViewBuilder bodyContent: BodyContentHandler) {
        self.headerContent = headerContent()
        self.bodyContent = bodyContent()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            MovieNavigationHeaderView {
                headerContent
            }
            bodyContent
            Spacer()
        }
    }
}

struct MovieNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MovieNavigationView(headerContent: {
            HStack {
                Text("HOME")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color.white)
                    .padding(8)
                Spacer()
                Image("SearchWhite")
                    .padding(.trailing, 8)
            }
        }, bodyContent: {
            Text("This is body")
                .background(Color.gray)
        })
    }
}
