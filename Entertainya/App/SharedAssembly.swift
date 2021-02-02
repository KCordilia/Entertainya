//
//  SharedAssembly.swift
//  Entertainya
//
//  Created by Karim Cordilia on 31/01/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import Moya

class SharedAssembly: Assembly {
    let sharedContainer = Container()

    func assemble(container: Container) {
        container.register(UIApplicationProtocol.self) { _ in UIApplication.shared }

        // Top View Controller Provider
        container.autoregister(TopViewControllerProviderProtocol.self, initializer: TopViewControllerProvider.init)

        // Root
        container.register(RootNavigatorProtocol.self) { resolver in
            return RootNavigator(
                application: resolver ~> UIApplicationProtocol.self,
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name)
            )
        }
        
        // MARK: Services
        container.register(MoyaProvider<MovieService>.self) { _ in MoyaProvider<MovieService>() }
        
        // MARK: Storyboards
        
        // Home
        container.register(Storyboard.self, name: R.storyboard.home.name) { _ in
            return HomeStoryboard(sharedContainer: self.sharedContainer, assembly: HomeAssembly())
        }
    }
}
