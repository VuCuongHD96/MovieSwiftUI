//
//  LazyView.swift
//  MovieSwiftUI
//
//  Created by Work on 22/07/2023.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let content: () -> Content
    init(_ content: @autoclosure @escaping () -> Content) {
        self.content = content
    }
    
    var body: Content {
        content()
    }
}

struct LazyView_Previews: PreviewProvider {
    static var previews: some View {
        LazyView(
            Text("This is lazy view")
        )
    }
}
