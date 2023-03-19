//
//  WalkThoughListDotView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughListDotView: View {
    
    let walkthroughArrayCount: Int
    var selectedIndex: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<walkthroughArrayCount, id: \.self) { index in
                if selectedIndex == index {
                    Image("Mask_fill")
                } else {
                    Image("Mask")
                }
            }
        }
    }
}

struct ListDotWalkThoughView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WalkThoughListDotView(walkthroughArrayCount: 3, selectedIndex: 0)
            WalkThoughListDotView(walkthroughArrayCount: 3, selectedIndex: 1)
            WalkThoughListDotView(walkthroughArrayCount: 3, selectedIndex: 2)
        }
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
