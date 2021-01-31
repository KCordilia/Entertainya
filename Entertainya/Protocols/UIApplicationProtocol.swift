//
//  UIApplicationProtocol.swift
//  Entertainya
//
//  Created by Karim Cordilia on 31/01/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit

protocol UIApplicationProtocol {
    var keyWindow: UIWindow? { get }
    var rootViewController: UIViewController? { get set }

    func topViewController(controller: UIViewController?) -> UIViewController?
}

extension UIApplication: UIApplicationProtocol {

    var rootViewController: UIViewController? {
        get { return windows.first?.rootViewController }
        set { windows.first?.rootViewController = newValue }
    }

    func topViewController(controller: UIViewController?) -> UIViewController? {
        var base: UIViewController?

        if controller == nil {
            base = rootViewController
        } else { base = controller }

        if let navigationController = base as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let presented = base?.presentedViewController {
            return topViewController(controller: presented)
        }
        return base
    }
}

