//
//  TrailerView.swift
//  MovieSwiftUI
//
//  Created by Work on 30/06/2023.
//

import SwiftUI

struct TrailerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            listItemView
                .padding(.vertical, 10)
            closeButton
        }
        .frame(width: Screen.width * 0.8,
               height: Screen.height * 0.7)
        .background(Color.black)
        .cornerRadius(5)
    }
    
    private var listItemView: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(1..<30) { item in
                    TrailerCell()
                        .cornerRadius(5)
                }
            }
        }
    }
    
    private var closeButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Close")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .underline()
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "F99F00"), Color(hex: "DB3069")]),
                    startPoint: .leading,
                    endPoint: .trailing))
                .cornerRadius(5)
        }
    }
}

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView()
    }
}
