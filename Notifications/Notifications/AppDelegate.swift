//
//  AppDelegate.swift
//  Notifications
//
//  Created by Gabriel on 18/09/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.alert,.badge]) { (response, error) in
            if error != nil {
                print(error)
            }
        }
        
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.rootViewController = mainVC!
        return true
    }


}

