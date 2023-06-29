//
//  CastView.swift
//  MovieSwiftUI
//
//  Created by Work on 20/06/2023.
//

import SwiftUI

struct CastView: View {
    
    let person: Person

    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: person.profilePathURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 102)
            Text(person.name)
                .font(.footnote)
                .lineLimit(2)
                .frame(width: 70)
            Spacer()
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct CastCell_Previews: PreviewProvider {
    static var previews: some View {
        CastView(person: .defaultValue)
    }
}
