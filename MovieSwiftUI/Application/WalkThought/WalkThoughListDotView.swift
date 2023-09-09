//
//  WalkThoughListDotView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughListDotView: View {

    let walkthroughArray: [WalkThough]
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<walkthroughArray.count, id: \.self) { index in
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
        WalkThoughListDotView(walkthroughArray: WalkThough.walkThoughArray, selectedIndex: .constant(0))
    }
}
