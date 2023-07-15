//
//  TrailerCell.swift
//  MovieSwiftUI
//
//  Created by Work on 15/07/2023.
//

import SwiftUI

struct TrailerCell: View {
    
    @State private var isImageAppear = false
    private let imageurl = "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"
    
    var body: some View {
        HStack(spacing: 19) {
            ZStack {
                trailerImage
                    .frame(width: 140, height: 90)
                    .cornerRadius(5)
                if isImageAppear {
                    Image("play_trailer")
                }
            }
            inforView
        }
        .padding(8)
    }
    
    private var trailerImage: some View {
        AsyncImage(url: URL(string: imageurl)) { image in
            image
                .resizable()
                .scaledToFit()
                .onAppear {
                    isImageAppear.toggle()
                }
        } placeholder: {
            ProgressView()
                .tint(Color.white)
        }
    }
    
    private var inforView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("House of Gucci")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 16))
            Text("Official Teaser Trailer")
                .foregroundColor(.white)
                .font(.system(size: 14))
            Text("September 5, 2022")
                .foregroundColor(.gray)
                .fontWeight(.medium)
                .font(.system(size: 12))
        }
    }
}

struct TrailerCell_Previews: PreviewProvider {
    static var previews: some View {
        TrailerCell()
            .background(Color.black)
    }
}
