//
//  TopRateScoreView.swift
//  MovieSwiftUI
//
//  Created by sun on 31/08/2022.
//

import SwiftUI

struct TopRateScoreView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("PosterImage")
                .resizable()
            VStack(alignment: .leading) {
                Text("2006")
                    .foregroundColor(Color.white)
                Text("Sonic the hedgehog")
                    .foregroundColor(Color.white)
            }
            .frame(width: .infinity)
        }
        .frame(width: 140, height: 238, alignment: .center)
        .background(Color.red)
    }
}

struct TopRateScoreView_Previews: PreviewProvider {
    static var previews: some View {
        TopRateScoreView()
    }
}
