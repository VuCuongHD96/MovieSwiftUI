//
//  HomeNowView.swift
//  MovieSwiftUI
//
//  Created by sun on 30/08/2022.
//

import SwiftUI

struct HomeNowView: View {
    var body: some View {
        VStack {
            Image("PosterImage")
                .resizable()
            Text("Sonic the hedgehog")
                .font(Font.body.bold())
        }
        .frame(width: 130, height: 238, alignment: .center)
    }
}

struct HomeNowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNowView()
    }
}
