//
//  MovieLinearGradient.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI

struct MovieLinearGradient: View {
    
    let gradient = Gradient(colors: [Color(hex: "F99F00"), Color(hex: "DB3069")])
    var body: some View {
        LinearGradient(gradient: gradient,
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct MovieLinearGradient_Previews: PreviewProvider {
    static var previews: some View {
        MovieLinearGradient()
    }
}
