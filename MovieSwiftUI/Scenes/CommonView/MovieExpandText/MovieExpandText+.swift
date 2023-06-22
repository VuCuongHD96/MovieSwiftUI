//
//  MovieExpandText+.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import SwiftUI

extension MovieExpandText {
    
    func lineLimit(_ lineLimit: Int) -> Self {
        var copy = self
        copy.lineLimit = lineLimit
        return copy
    }
    
    func animation(_ animation: Animation) -> Self {
        var copy = self
        copy.animation = animation
        return copy
    }
}
