//
//  MovieCosmosView.swift
//  MovieSwiftUI
//
//  Created by Work on 21/06/2023.
//

import SwiftUI
import Cosmos

struct MovieCosmosView: UIViewRepresentable {
    var rating: Double
    var starSize: Double = 13
    
    func makeUIView(context: Context) -> CosmosView {
        CosmosView()
    }
    
    func updateUIView(_ uiView: CosmosView, context: Context) {
        uiView.rating = rating / 2
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        uiView.settings.starSize = starSize
        uiView.settings.filledImage = UIImage(named: "filledstar")
        uiView.settings.emptyImage = UIImage(named: "emptystar")
    }
}

extension MovieCosmosView {
    public func starSize(_ starSize: Double) -> MovieCosmosView {
        var result = self
        result.starSize = starSize
        return result
    }
}

struct MovieCosmosView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(0...5, id: \.self) { item in
            MovieCosmosView(rating: Double(item))
        }
        .previewLayout(.sizeThatFits)
    }
}
