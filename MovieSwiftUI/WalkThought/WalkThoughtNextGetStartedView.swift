//
//  WalkThoughtNextGetStartedView.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import SwiftUI

struct WalkThoughtNextGetStartedView: View {
    
    struct Constant {
        static let cornerRadius: CGFloat = 27
    }
    
    var body: some View {
        Text("Get Started")
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .frame(width: 192, height: 54)
            .background(createLinearGradient())
            .overlay(
                RoundedRectangle(cornerRadius: Constant.cornerRadius)
                    .stroke(.white, lineWidth: 2)
            )
    }
    
    private func createLinearGradient() -> some View {
        let gradient = Gradient(colors: [Color(hex: "F99F00"), Color(hex: "DB3069")])
        return LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            .cornerRadius(Constant.cornerRadius)
    }
}

struct WalkThoughtNextGetStatedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WalkThoughtNextGetStartedView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
