//
//  TestView.swift
//  MovieSwiftUI
//
//  Created by Work on 14/07/2023.
//

import SwiftUI

struct MovieAsyncImage2<I: View, P: View>: View {
    
    // MARK: - Define
    typealias ImageContent = (Image) -> I
    typealias PlaceHolderContent = () -> P
    
    // MARK: - Property
    @ObservedObject var imageLoader = ImageLoader()
    let url: URL?
    @ViewBuilder let imageContent: ImageContent
    @ViewBuilder let placeHolderContent: PlaceHolderContent
    
    var body: some View {
        VStack {
            if let image = imageLoader.image {
                imageContent(Image(uiImage: image))
            } else {
                placeHolderContent()
            }
        }
        .onAppear {
            imageLoader.loadImage(from: url)
        }
    }
}

struct MovieAsyncImage2_Previews: PreviewProvider {
    static var previews: some View {
        MovieAsyncImage2(url: URL(string: "https://mekoong.com/wp-content/uploads/2022/12/Hinh-anh-xe-dua-mau-do-cuc-boc.png")) { image in
            image.resizable()
                .scaledToFit()
        } placeHolderContent: {
            ProgressView()
        }
    }
}
