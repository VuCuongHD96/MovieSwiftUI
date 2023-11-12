//
//  ProfileView.swift
//  MovieSwiftUI
//
//  Created by Work on 30/06/2023.
//

import SwiftUI

struct ProfileView: View {
    
    private let columns = Array(repeating: GridItem(), count: 3)
    let viewModel: ProfileViewModel
    var input: ProfileViewModel.Input
    @ObservedObject var output: ProfileViewModel.Output
    let cancelBag = CancelBag()
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        let input = ProfileViewModel.Input()
        self.output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                headerView
                    .background(Color.red)
                MovieExpandText(
                    message: output.profile.biography,
                    moreText: {
                        Text("More")
                            .fontWeight(.medium)
                            .background(Color.white)
                            .foregroundColor(.red)
                            .allowsHitTesting(false)
                    }, lessText: {
                        Text("Less")
                            .fontWeight(.medium)
                            .background(Color.white)
                            .foregroundColor(.gray)
                            .allowsHitTesting(false)
                    })
                .lineLimit(2)
                .padding()
                .background(Color.blue)
                movieGridView
                    .padding()
                    .background(Color.red)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            input.loadTrigger.send()
        }
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
                AsyncImage(url: output.profile.profilePathURL) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                        .tint(Color.white)
                }
                .frame(width: 110, height: 150)
                .cornerRadius(20)
                Spacer()
                Text(output.profile.name)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.title2)
            }
            .padding(.vertical)
        }
    }
    
    private var movieGridView: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(output.movieList, id: \.id) { movie in
                HomeTopRateView(movie: movie)
                    .frame(width: 100, height: 140)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let profileUseCase = ProfileUseCase()
        let viewModel = ProfileViewModel(profileUseCase: profileUseCase, profileID: 1136406)
        ProfileView(viewModel: viewModel)
    }
}
