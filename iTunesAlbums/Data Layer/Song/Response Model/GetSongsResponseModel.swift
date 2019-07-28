//
//  GetSongsResponseModel.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct GetSongsResponseModel: Codable {
    var resultCount: Int?
    var results: [SongResponse]?
}
