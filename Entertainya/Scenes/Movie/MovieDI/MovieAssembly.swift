//
//  MovieAssembly.swift
//  Entertainya
//
//  Created by Karim Cordilia on 02/02/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class MovieAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(MovieRouterProtocol.self) { resolver in
            return MovieRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self)
            )
        }
        
        container.autoregister(MovieInteractorProtocol.self, initializer: MovieInteractor.init)
        
        container.autoregister(MoviePresenterProtocol.self, initializer: MoviePresenter.init)
        
        container.storyboardInitCompleted(MovieViewController.self) { resolver, vc in
            
            let presenter = resolver ~> (MoviePresenterProtocol.self)
            let router = resolver ~> (MovieRouterProtocol.self)
            
            router.set(viewController: vc)
            presenter.set(viewController: vc)
            vc.set(router: router)
            vc.set(interactor: resolver ~> (MovieInteractorProtocol.self))
        }
    }
}

