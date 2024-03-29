//
//  AppDelegate.swift
//  MovieSwiftUI
//
//  Created by Work on 15/04/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    let coreDataBaseRepository = CoreDataBaseRepository(coreDataManager: .shared)
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        toMainView()
        return true
    }
    
    private func toMainView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigator = AppNavigator(window: window)
        let appViewModel = AppViewModel(navigator: navigator)
        appViewModel.toMainView()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        saveData()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        saveData()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        saveData()
    }
    
    private func saveData() {
        _ = coreDataBaseRepository
            .save()
    }
}
