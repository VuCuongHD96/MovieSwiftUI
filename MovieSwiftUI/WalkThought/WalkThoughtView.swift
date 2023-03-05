//
//  WalkThoughtView.swift
//  MovieSwiftUI
//
//  Created by Work on 05/03/2023.
//

import SwiftUI

struct WalkThoughtView: View {
    
    var walkThough: WalkThough
    
    var body: some View {
        ZStack(alignment: .center) {
            Image(walkThough.imageName)
                .resizable()
            VStack {
                Spacer()
                Text(walkThough.title)
                    .fontWeight(.regular)
                    .font(.custom("Helvetical", fixedSize: 36))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.bottom, 258)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
}

struct WalkThoughtView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WalkThoughtView(walkThough: .walkThoughOne)
            WalkThoughtView(walkThough: .walkThoughTwo)
            WalkThoughtView(walkThough: .walkThoughThree)
        }
    }
}
