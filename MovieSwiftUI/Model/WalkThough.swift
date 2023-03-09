//
//  WalkThough.swift
//  MovieSwiftUI
//
//  Created by Work on 06/03/2023.
//

import Foundation

struct WalkThough {
    var imageName = ""
    var title = ""
    
    static let walkThoughOne = WalkThough(imageName: "Walkthrough_first", title: "Get the first\nMovie &TV information")
    static let walkThoughTwo = WalkThough(imageName: "Walkthrough_second", title: "Know the movie\nis not worth Watching")
    static let walkThoughThree = WalkThough(imageName: "Walkthrough_third", title: "Real-time\nupdates movie Trailer")
    
    static var walkThoughArray: [WalkThough] {
        return [walkThoughOne, walkThoughTwo, walkThoughThree]
    }
}
