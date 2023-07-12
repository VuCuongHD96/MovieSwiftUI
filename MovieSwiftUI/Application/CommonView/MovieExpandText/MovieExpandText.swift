//
//  MovieExpandText.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import SwiftUI

struct MovieExpandText<MoreText: View, LessText: View>: View {
    
    // MARK: - Define
    typealias MoreTextHandler = () -> MoreText
    typealias LessTextHandler = () -> LessText
    
    // MARK: - Property
    let moreText: MoreText
    let lessText: LessText
    var lineLimit: Int = 0
    var animation = Animation.default
    var message: String
    @State var realSize = CGSize.zero
    @State var isTruncated = true
    
    // MARK: - Init
    init(message: String, @ViewBuilder moreText: MoreTextHandler, @ViewBuilder lessText: LessTextHandler) {
        self.message = message
        self.moreText = moreText()
        self.lessText = lessText()
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(message)
                .lineLimit(isTruncated ? lineLimit : nil)
                .onTapGesture {
                    isTruncated.toggle()
                }
                .animation(animation, value: isTruncated)
                .readSize { currentSize in
                    isTruncated = currentSize.height != realSize.height
                }
                .background {
                    Text(message)
                        .hidden()
                        .fixedSize(horizontal: false, vertical: true)
                        .readSize { realSize in
                            self.realSize = realSize
                        }
                }
            if isTruncated {
                moreText
            } else {
                lessText
            }
        }
    }
}

struct MyExpandText_Previews: PreviewProvider {
    static var previews: some View {
        MovieExpandText(
            message: "Hello, WorldHellorldHellHello, WorldHellorldHellHello, WorldHellorldHellHello, WorldHellorldHellHello, WorldHellorldHell",
            moreText: {
                Text("More")
                    .fontWeight(.medium)
                    .background(Color.white)
                    .foregroundColor(.red)
            }, lessText: {
                Text("Less")
                    .fontWeight(.medium)
                    .background(Color.white)
                    .foregroundColor(.gray)
            })
        .lineLimit(2)
        .animation(.easeIn)
    }
}
