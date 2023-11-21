//
//  MovieInforView.swift
//  MovieSwiftUI
//
//  Created by Work on 02/07/2023.
//

import SwiftUI

struct MovieInforView: View {
    
    @State var titleSize = CGSize.zero
    let movie: MovieItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(movie.title)
                .font(.title3)
                .readSize { size in
                    titleSize = size
                }
            RoundedRectangle(cornerRadius: 0)
                .fill(.gray)
                .frame(width: titleSize.width, height: 1)
            Text(movie.overview)
                .foregroundColor(Color.gray)
        }
    }
}

struct MovieInforView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInforView(movie: .defaultValue)
            .previewLayout(.sizeThatFits)
    }
}
