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
    case getPopularMovies
    case getNowPlayingMovies(region: String)
    case getTopRatedMovies(region: String)
    case getUpcomingMovies(region: String)
    case getSingleMovie(id: Int)
}

extension MovieService: TargetType {
    var baseURL: URL {
        return BaseURL.url
    }

    var path: String {
        switch self{
        case .getPopularMovies:
            return "/movie/popular"
        case .getNowPlayingMovies:
            return "/movie/now_playing"
        case .getTopRatedMovies:
            return "/movie/top_rated"
        case .getUpcomingMovies:
            return "/movie/upcoming"
        case .getSingleMovie(let id):
            return "movie/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getPopularMovies,
             .getNowPlayingMovies,
             .getTopRatedMovies,
             .getUpcomingMovies,
             .getSingleMovie:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getPopularMovies:
            return .requestParameters(
                parameters: [
                    "api_key": "b5cf63a4366b7eeb96503ea6c78879ab"
                ],
                encoding: URLEncoding.default
            )
        case .getNowPlayingMovies(let region):
            return .requestParameters(
                parameters: [
                    "api_key": "b5cf63a4366b7eeb96503ea6c78879ab",
                    "region": region
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
        case .getUpcomingMovies(let region):
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

