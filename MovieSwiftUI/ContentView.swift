//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by sun on 30/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            WalkThoughtListView()
            TabbarView()
                .ignoresSafeArea()
                .background(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
