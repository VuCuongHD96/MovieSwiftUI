//
//  TrailerNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 23/09/2023.
//

import UIKit
import EVPlayer
import YouTubeKit

protocol TrailerNavigatorType {
    
    func toVideoScreen(stream: YTStream)
    func dismiss()
}

struct TrailerNavigator: TrailerNavigatorType {
    
    let navigationController: UINavigationController
    
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
    
    func toVideoScreen(stream: YTStream) {
        let media = EVMedia(videoURL: stream.url)
        var config = EVConfiguration(media: media)
        config.shouldAutoPlay = true
        config.videoGravity = .resizeAspect
        config.fullScreenModeVideoGravity = .resize
        let playerController = EVPlayerController(configuration: config)
        playerController.modalPresentationStyle = .fullScreen
        navigationController.dismiss(animated: true) {
            navigationController.present(playerController, animated: true)
        }
    }
}
