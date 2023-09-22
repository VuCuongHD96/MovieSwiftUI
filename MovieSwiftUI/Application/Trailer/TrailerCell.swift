//
//  TrailerCell.swift
//  MovieSwiftUI
//
//  Created by Work on 15/07/2023.
//

import SwiftUI

struct TrailerCell: View {
    
    @State private var isImageAppear = false
    let trailer: Trailer
    
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
        AsyncImage(url: trailer.imageURL) { image in
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
            Text(trailer.name)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 15))
                .lineLimit(2)
            Text(trailer.type.rawValue)
                .foregroundColor(.white)
                .font(.system(size: 14))
            Text(trailer.publishedAt)
                .foregroundColor(.gray)
                .fontWeight(.medium)
                .font(.system(size: 12))
                .lineLimit(1)
        }
    }
}

struct TrailerCell_Previews: PreviewProvider {
    static var previews: some View {
        TrailerCell(trailer: .defaultValue)
            .background(Color.black)
    }
}
