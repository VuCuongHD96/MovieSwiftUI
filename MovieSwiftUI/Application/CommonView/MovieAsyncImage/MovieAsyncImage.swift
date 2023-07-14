//
//  MovieAsyncImage.swift
//  MovieSwiftUI
//
//  Created by Work on 14/07/2023.
//

import SwiftUI

struct MovieAsyncImage<I: View, P: View>: View {
    
    // MARK: - Define
    typealias ImageContent = (Image) -> I
    typealias PlaceHolderContent = () -> P
    
    // MARK: - Property
    @StateObject var imageLoader = ImageLoader()
    let url: URL?
    let imageContent: ImageContent
    let placeHolder: P
    
    init(url: URL?,
         @ViewBuilder imageContent: @escaping ImageContent,
         @ViewBuilder placeHolderContent: PlaceHolderContent) {
        self.url = url
        self.imageContent = imageContent
        self.placeHolder = placeHolderContent()
    }
    
    var body: some View {
        VStack {
            if let image = imageLoader.image {
                imageContent(Image(uiImage: image))
            } else {
                placeHolder
            }
        }
        .onAppear {
            imageLoader.loadImage(from: url)
        }
    }
}

struct MovieAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        MovieAsyncImage(url: URL(string: "https://mekoong.com/wp-content/uploads/2022/12/Hinh-anh-xe-dua-mau-do-cuc-boc.png")) { image in
            image.resizable()
                .scaledToFit()
        } placeHolderContent: {
            ProgressView()
        }
    }
}
