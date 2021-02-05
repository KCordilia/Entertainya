//
//  MovieCollectionViewCell.swift
//  Entertainya
//
//  Created by Karim Cordilia on 03/02/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
    
    func configure(movie: Movie, isPoster: Bool) {
        movieImage.kf.setImage(with: isPoster ? movie.posterURL : movie.backdropURL)
//        movieTitle.isHidden = isPoster
//        movieTitle.text = movie.title
    }

    

}
