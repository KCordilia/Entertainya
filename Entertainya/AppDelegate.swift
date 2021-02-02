//
//  AppDelegate.swift
//  Entertainya
//
//  Created by Karim Cordilia on 30/01/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var app = EntertainyaApp()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        app.prepare()
        return true
    }
}

