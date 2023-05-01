//
//  LazyView.swift
//  MovieSwiftUI
//
//  Created by Work on 26/03/2023.
//

import SwiftUI

struct LazyNavigationView<Content: View>: View {
    var content: () -> Content
    init(_ content: @autoclosure @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        NavigationView {        
            content()
        }
    }
}
