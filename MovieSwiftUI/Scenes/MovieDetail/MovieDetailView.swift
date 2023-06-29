//
//  MovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 24/05/2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    var body: some View {
        MovieNavigationView {
            HeaderMovieDetailView()
        } bodyContent: {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        BackGroundMovieDetailView()
                            .frame(width: Screen.width, height: 280)
                        PosterMovieDetailView()
                            .padding(.top, 205)
                            .padding([.leading, .trailing], 20)
                    }
                   Text("Full Cast & Crew")
                        .padding(.vertical)
                        .padding(.leading, 20)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.2))
                    ListCastMovieDetailView()
                        .padding(10)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
