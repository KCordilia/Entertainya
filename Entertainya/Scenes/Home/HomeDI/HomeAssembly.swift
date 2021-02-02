//
//  HomeAssembly.swift
//  Entertainya
//
//  Created by Karim Cordilia on 31/01/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: Home
        container.register(HomeRouterProtocol.self) { resolver in
            return HomeRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self)
            )
        }
        
        container.autoregister(HomeInteractorProtocol.self, initializer: HomeInteractor.init)
        
        container.autoregister(HomePresenterProtocol.self, initializer: HomePresenter.init)
        
        container.storyboardInitCompleted(HomeViewController.self) { resolver, vc in
            
            let presenter = resolver ~> (HomePresenterProtocol.self)
            let router = resolver ~> (HomeRouterProtocol.self)
            
            router.set(viewController: vc)
            presenter.set(viewController: vc)
            vc.set(router: router)
            vc.set(interactor: resolver ~> (HomeInteractorProtocol.self))
        }
    }
}
