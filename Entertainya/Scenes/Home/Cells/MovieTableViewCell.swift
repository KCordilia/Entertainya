//
//  MovieTableViewCell.swift
//  Entertainya
//
//  Created by Karim Cordilia on 02/02/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    func configure(movie: Movie) {
        movieImage.kf.setImage(with: movie.posterURL)
        movieTitle.text = movie.title
    }
}
