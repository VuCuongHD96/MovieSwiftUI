//
//  WalkThoughOverlayView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughOverlayView: View {
    
    let walkthroughArrayCount: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack {
            Spacer()
            WalkThoughListDotView(walkthroughArrayCount: walkthroughArrayCount,
                                  selectedIndex: selectedIndex)
            .padding(.bottom, 56)
            if walkthroughArrayCount - 1 == selectedIndex {
                NavigationLink(destination: Text("Home Screen")) {
                    WalkThoughtNextGetStartedView()
                        .padding(.bottom, 100)
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
        Group {
            WalkThoughOverlayView(walkthroughArrayCount: 3, selectedIndex: Binding<Int>.constant(0))
            WalkThoughOverlayView(walkthroughArrayCount: 3, selectedIndex: Binding<Int>.constant(1))
            WalkThoughOverlayView(walkthroughArrayCount: 3, selectedIndex: Binding<Int>.constant(2))
        }
        .preferredColorScheme(.dark)
    }
}
