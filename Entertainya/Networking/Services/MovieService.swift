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
}

extension MovieService: TargetType {
    var baseURL: URL {
        return BaseURL.url
    }

    var path: String {
        switch self{
        case .getPopularMovies:
            return "/movie/popular"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getPopularMovies:
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
        }
    }

    var headers: [String : String]? {
        return nil
    }

}

