//
//  ImageLoader.swift
//  MovieSwiftUI
//
//  Created by Work on 14/07/2023.
//

import Combine
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: URL?) {
        guard let url = url else { return }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
}
