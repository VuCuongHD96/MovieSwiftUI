//
//  WalkThoughListDotView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughListDotView: View {
    
    @EnvironmentObject private var input: WalkThoughtListViewModel.Input
    @EnvironmentObject private var output: WalkThoughtListViewModel.Output
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<output.walkthroughArray.count, id: \.self) { index in
                if input.selectedIndex == index {
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
        WalkThoughListDotView()
    }
}
