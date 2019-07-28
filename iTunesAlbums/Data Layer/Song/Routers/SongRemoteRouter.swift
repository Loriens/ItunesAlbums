//
//  SongRemoteRouter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKNetwork

enum SongRemoteRouter {
    case list(albumId: Int)
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "\(AppConfiguration.serverURL)/lookup"
        }
    }
    
    var params: [String: Any] {
        switch self {
        case let .list(albumId):
            return [
                "id": albumId,
                "entity": "song"
            ]
        }
    }
    
    var request: URLRequest? {
        switch self {
        case .list:
            return URLRequestFactory.create(path: self.path, parameters: self.params, headers: nil, method: self.method)
        }
    }
}
