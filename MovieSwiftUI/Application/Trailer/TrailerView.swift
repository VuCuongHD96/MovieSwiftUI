//
//  TrailerView.swift
//  MovieSwiftUI
//
//  Created by Work on 30/06/2023.
//

import SwiftUI

struct TrailerView: View {
    
    var input: TrailerViewModel.Input
    @ObservedObject var output: TrailerViewModel.Output
    let cancelBag = CancelBag()
    
    init(viewModel: TrailerViewModel) {
        let input = TrailerViewModel.Input()
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            trailerListView
                .padding(.vertical, 10)
            closeButton
        }
        .frame(width: Screen.width * 0.8,
               height: Screen.height * 0.7)
        .background(Color.black)
        .cornerRadius(5)
        .onAppear {
            input.loadTrigger.send()
        }
        .alert(isPresented: $output.alertMessage.isShowing) {
            Alert(title: Text(output.alertMessage.title),
                  message: Text(output.alertMessage.message))
        }
    }
    
    private var trailerListView: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(output.trailerList, id: \.id) { trailer in
                    TrailerCell(trailer: trailer)
                        .cornerRadius(5)
                        .onTapGesture {
                            input.openTrailerAction.send(trailer)
                        }
                }
            }
        }
    }
    
    private var closeButton: some View {
        Button {
            input.dismissAction.send()
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
        let navigationController = UINavigationController()
        let trailerUseCase = TrailerUseCase()
        let trailerNavigator = TrailerNavigator(navigationController: navigationController)
        let viewModel = TrailerViewModel(trailerUseCase: trailerUseCase, trailerNavigator: trailerNavigator, movie: .defaultValue)
        TrailerView(viewModel: viewModel)
    }
}
