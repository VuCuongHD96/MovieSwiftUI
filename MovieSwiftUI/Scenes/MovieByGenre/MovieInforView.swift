//
//  MovieInforView.swift
//  MovieSwiftUI
//
//  Created by Work on 02/07/2023.
//

import SwiftUI

struct MovieInforView: View {
    
    @State var titleSize = CGSize.zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Sonic the Headgehog")
                .font(.title3)
                .readSize { size in
                    titleSize = size
                }
            RoundedRectangle(cornerRadius: 0)
                .fill(.gray)
                .frame(width: titleSize.width, height: 1)
            Text("Based on the global blockbuster videogame franchise from Sega, Sonic the Hedgehog tells the story of the world's speediest hedgehog as he embraces his new home on Earth. In this ١٠٠٠ blockbuster videogame franchise from Sega, Sonic the Hedgehog tells the story of the world's speediest hedgehog as he embraces his new home on Earth. In th")
                .foregroundColor(Color.gray)
        }
    }
}

struct MovieInforView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInforView()
            .previewLayout(.sizeThatFits)
    }
}
