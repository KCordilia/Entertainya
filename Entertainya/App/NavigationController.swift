//
//  NavigationController.swift
//  Entertainya
//
//  Created by Karim Cordilia on 03/02/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }
    
    func prepare() {
        navigationBar.tintColor = .black
        navigationBar.barTintColor = R.color.red()
        navigationBar.isTranslucent = false
        navigationItem.backBarButtonItem?.image = UIImage(systemName: "chevron.left")
    }
}
