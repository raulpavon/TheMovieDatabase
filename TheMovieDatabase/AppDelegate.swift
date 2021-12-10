//
//  AppDelegate.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 06/12/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var movieCoordinator: MovieCoordinator?
    let navController = UINavigationController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeWindow()
        return true
    }
    
    func initializeWindow() {
        movieCoordinator = MovieCoordinator(navigationController: navController)
        movieCoordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

