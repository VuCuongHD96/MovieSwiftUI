//
//  HomeTopRateView.swift
//  MovieSwiftUI
//
//  Created by sun on 31/08/2022.
//

import SwiftUI

struct HomeTopRateView: View {
    var body: some View {
        ZStack {
            Image("PosterImage")
                .resizable()
            
            
            
            VStack {
                Rectangle()
                    .size(CGSize(width: 50, height: 50))
                    .foregroundColor(.red)
//                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                Spacer()
                VStack(alignment: .leading) {
                    Text("2019")
                        .foregroundColor(Color.white)
                    Text("Sonic")
                        .foregroundColor(Color.white)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .padding([.leading, .trailing], 5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 140, height: 238, alignment: .bottom)
    }
}

struct HomeTopRateView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopRateView()
    }
}
