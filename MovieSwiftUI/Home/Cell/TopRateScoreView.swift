//
//  TopRateScoreView.swift
//  MovieSwiftUI
//
//  Created by sun on 31/08/2022.
//

import SwiftUI

struct TopRateScoreView: View {
    var body: some View {
        
        ZStack {
            Circle()
                .fill(.blue)
            .frame(width: 100, height: 100)
            Text("8.7")
                .frame(maxWidth: ., minHeight: <#T##CGFloat?#>, idealHeight: <#T##CGFloat?#>, maxHeight: <#T##CGFloat?#>, alignment: <#T##Alignment#>)
        }
    }
}

struct TopRateScoreView_Previews: PreviewProvider {
    static var previews: some View {
        TopRateScoreView()
    }
}
