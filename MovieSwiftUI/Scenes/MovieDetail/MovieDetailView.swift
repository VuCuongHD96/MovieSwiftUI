//
//  MovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 24/05/2023.
//

import SwiftUI
import ExpandableText

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
                    ExpandableText(text: "After being struck by lightning, Barry Allen wakes up from his coma to discover he's been given the power of super speed, becoming the Flash, fighting crime in Central City.")
                        .lineLimit(3)
                        .expandButton(TextSet(text: "more", font: .body, color: .red))
                        .collapseButton(TextSet(text: "less", font: .body, color: .blue))
                        .expandAnimation(.easeOut)
                        .padding(20)
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
