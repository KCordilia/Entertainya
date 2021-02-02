//
//  RootNavigator.swift
//  Entertainya
//
//  Created by Karim Cordilia on 31/01/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import Foundation

protocol RootNavigatorProtocol {
    func setRootViewController()
}

class RootNavigator: RootNavigatorProtocol {
    private var application: UIApplicationProtocol
    private let homeStoryboard: Storyboard

    init(
        application: UIApplicationProtocol,
        homeStoryboard: Storyboard
    ) {
        self.application = application
        self.homeStoryboard = homeStoryboard
    }

    func setRootViewController() {
        application.rootViewController = homeStoryboard.initial()
    }
}
