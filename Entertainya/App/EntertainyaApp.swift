//
//  EntertainyaApp.swift
//  Entertainya
//
//  Created by Karim Cordilia on 31/01/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

protocol EntertainyaAppProtocol {
    func prepare()
}

class EntertainyaApp: EntertainyaAppProtocol {

    private let sharedContainer: Container
    private let sharedAssembly: Assembly
    private let rootNavigator: RootNavigatorProtocol

    init(
        sharedAssembly: Assembly,
        sharedContainer: Container
    ) {
        self.sharedAssembly = sharedAssembly
        self.sharedContainer = sharedContainer
        sharedAssembly.assemble(container: self.sharedContainer)
        rootNavigator = sharedContainer ~> RootNavigatorProtocol.self
    }

    convenience init() {
        let sharedAssembly = SharedAssembly()
        let sharedContainer = sharedAssembly.sharedContainer

        self.init(
            sharedAssembly: sharedAssembly,
            sharedContainer: sharedContainer
        )
    }

    func prepare() {
        rootNavigator.setRootViewController()
    }
}

