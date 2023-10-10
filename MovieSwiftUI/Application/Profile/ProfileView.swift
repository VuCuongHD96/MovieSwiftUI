//
//  ProfileView.swift
//  MovieSwiftUI
//
//  Created by Work on 30/06/2023.
//

import SwiftUI

struct ProfileView: View {
    
    private let columns = Array(repeating: GridItem(), count: 4)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                headerView
                    .background(Color.red)
                Text("After being struck by lightning, Barry Allen wakes up from his coma to discover he's been given the power of super speed, becoming the Flash, fighting crime in Central City.")
                    .padding()
                movieArrayView
                    .padding()
            }
        }
        .ignoresSafeArea()
    }
    
    private var statusBarView: some View {
        HStack(alignment: .center) {
            Button {
            } label: {
                Image("back")
            }
            Spacer()
            Text("PROFILE")
                .modifier(TitleModifier())
                .padding(8)
            Spacer()
            Image("SearchWhite")
                .padding(8)
        }
    }
    
    private var headerView: some View {
        ZStack(alignment: .top) {
            Image("Profile")
                .resizable()
                .scaledToFit()
            VStack {
                statusBarView
                    .padding(.horizontal, 8)
                Spacer()
                Image("PosterImage")
                    .frame(width: 110, height: 150)
                    .clipped()
                    .cornerRadius(20)
                
                Spacer()
                Text("Adeline Henderson")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.title2)
            }
            .padding(.vertical)
        }
    }
    
    private var movieArrayView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(Array(repeating: Movie.defaultValue, count: 10), id: \.id) { movie in
                    HomeTopRateView(movie: movie)
                        .frame(width: 100, height: 140)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
