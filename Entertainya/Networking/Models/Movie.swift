//
//  Movie.swift
//  Entertainya
//
//  Created by Karim Cordilia on 30/01/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import Foundation

struct Movies: Codable {
    let results: [Movie]
}

 struct Movie: Codable {
     let id: Int
     let title: String
     let backdropPath: String?
     let posterPath: String?
     let overview: String
     let releaseDate: String
     var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
}
