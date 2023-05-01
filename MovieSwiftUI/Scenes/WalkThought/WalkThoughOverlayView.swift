//
//  WalkThoughOverlayView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughOverlayView: View {
    
    @EnvironmentObject private var input: WalkThoughtListViewModel.Input
    @EnvironmentObject private var output: WalkThoughtListViewModel.Output
    
    var body: some View {
        VStack {
            Spacer()
            WalkThoughListDotView()
                .padding(.bottom, 56)
            if $output.walkthroughArray.count - 1 == input.selectedIndex {
                WalkThoughtGetStartedView()
                    .padding(.bottom, 100)
                    .onTapGesture {
                        input.getStatedButtonDidTap.send()
                    }
            } else {
                WalkThoughtNextButtonView()
                    .padding(.bottom, 100)
            }
        }
        .environmentObject(input)
        .environmentObject(output)
    }
}

struct WalkThoughOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        WalkThoughOverlayView()
    }
}
