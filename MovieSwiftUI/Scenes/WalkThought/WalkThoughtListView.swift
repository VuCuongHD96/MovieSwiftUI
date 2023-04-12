//
//  WalkThoughtListView.swift
//  MovieSwiftUI
//
//  Created by Work on 05/03/2023.
//

import SwiftUI

struct WalkThoughtListView: View {
    
    @State private var selectedIndex = 0
    let walkthroughArray = WalkThough.walkThoughArray
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<walkthroughArray.count, id: \.self) { index in
                let item = walkthroughArray[index]
                WalkThoughtView(walkThough: item)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .overlay {
            WalkThoughOverlayView(walkthroughArrayCount: walkthroughArray.count,
                                  selectedIndex: $selectedIndex)
        }
    }
}

struct WalkThoughtListView_Previews: PreviewProvider {
    static var previews: some View {
        WalkThoughtListView()
            .previewLayout(.sizeThatFits)
            .background(Color.blue)
    }
}
