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
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]?
    let genres: [Genre]?
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    var posterURL: URL {
        return URL(string: "\(BaseURL.imgURL)\(posterPath)")!
    }
    
    var backdropURL: URL {
        return URL(string: "\(BaseURL.imgURL)\(backdropPath ?? posterPath)")!
    }
    
    var genresText: String {
        genres?.first?.name ?? "N/A"
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case genres
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case runtime
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}
