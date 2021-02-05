//
//  MovieService.swift
//  Entertainya
//
//  Created by Karim Cordilia on 30/01/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import Foundation
import Moya

enum MovieService {
    case getNowPlayingMovies(region: String)
    case getUpcomingMovies(region: String)
    case getPopularMovies
    case getTopRatedMovies(region: String)
    case getSingleMovie(id: Int)
}

extension MovieService: TargetType {
    var baseURL: URL {
        return BaseURL.url
    }

    var path: String {
        switch self{
        case .getNowPlayingMovies:
            return "/movie/now_playing"
        case .getUpcomingMovies:
            return "/movie/upcoming"
        case .getPopularMovies:
            return "/movie/popular"
        case .getTopRatedMovies:
            return "/movie/top_rated"
        case .getSingleMovie(let id):
            return "movie/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getNowPlayingMovies,
             .getUpcomingMovies,
             .getPopularMovies,
             .getTopRatedMovies,
             .getSingleMovie:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getNowPlayingMovies(let region):
            return .requestParameters(
                parameters: [
                    "api_key": "b5cf63a4366b7eeb96503ea6c78879ab",
                    "region": region
                ],
                encoding: URLEncoding.default
            )
        case .getUpcomingMovies(let region):
            return .requestParameters(
                parameters: [
                    "api_key": "b5cf63a4366b7eeb96503ea6c78879ab",
                    "region": region
                ],
                encoding: URLEncoding.default
            )
        case .getPopularMovies:
            return .requestParameters(
                parameters: [
                    "api_key": "b5cf63a4366b7eeb96503ea6c78879ab"
                ],
                encoding: URLEncoding.default
            )
        case .getTopRatedMovies(let region):
            return .requestParameters(
                parameters: [
                    "api_key": "b5cf63a4366b7eeb96503ea6c78879ab",
                    "region": region
                ],
                encoding: URLEncoding.default
            )
        case .getSingleMovie:
            return .requestParameters(
                parameters: [
                    "api_key": "b5cf63a4366b7eeb96503ea6c78879ab"
                ],
                encoding: URLEncoding.default
            )
        }
    }

    var headers: [String : String]? {
        return nil
    }

}

