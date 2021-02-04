//
//  SectionTitleView.swift
//  Entertainya
//
//  Created by Karim Cordilia on 04/02/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit

class SectionTitleView: UICollectionReusableView {
    @IBOutlet weak var sectionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(title: String) {
        sectionTitle.text = title
    }
}
