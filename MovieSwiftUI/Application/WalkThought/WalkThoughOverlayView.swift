//
//  WalkThoughOverlayView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughOverlayView: View {

    let walkThoughArray: [WalkThough]
    @Binding var selectedIndex: Int
    @Binding var getStatedButtonDidTap: Void?
    
    var body: some View {
        VStack {
            Spacer()
            WalkThoughListDotView(walkthroughArray: walkThoughArray,
                                  selectedIndex: $selectedIndex)
                .padding(.bottom, 56)
            if walkThoughArray.count - 1 == selectedIndex {
                WalkThoughtGetStartedView()
                    .padding(.bottom, 100)
                    .onTapGesture {
                        getStatedButtonDidTap = Void()
                    }
            } else {
                WalkThoughtNextButtonView(selectedIndex: $selectedIndex)
                    .padding(.bottom, 100)
            }
        }
    }
}

struct WalkThoughOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        WalkThoughOverlayView(walkThoughArray: WalkThough.walkThoughArray,
                              selectedIndex: .constant(0),
                              getStatedButtonDidTap: .constant(Void()))
    }
}
