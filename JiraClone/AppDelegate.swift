//
//  AppDelegate.swift
//  JiraClone
//
//  Created by user1 on 14/04/23.
//

import UIKit
//import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//            FirebaseApp.configure()
            window = UIWindow()
            let vc = MainController()
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
            return true
        }
    

}

