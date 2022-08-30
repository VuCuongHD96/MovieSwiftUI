//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by sun on 30/08/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1...5, id: \.self) { _ in
                    HomeNowView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
