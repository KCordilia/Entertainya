//
//  HomePresenter.swift
//  Entertainya
//
//  Created by Karim Cordilia on 31/01/2021.
//  Copyright (c) 2021 Karim Cordilia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

protocol HomePresenterProtocol {
    func set(viewController: HomeViewControllerProtocol?)

    // add the functions that are called from interactor
    func handle(error: Error)
}

class HomePresenter: HomePresenterProtocol {

    // MARK: DI
    weak var viewController: HomeViewControllerProtocol?

    func set(viewController: HomeViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: Methods
extension  HomePresenter {

    func handle(error: Error) {
        viewController?.display(error: error)
    }
}
