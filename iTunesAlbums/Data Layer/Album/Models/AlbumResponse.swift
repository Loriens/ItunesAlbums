//
//  AlbumResponse.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct AlbumResponse: Codable {
    var artistId: Int?
    var collectionId: Int?
    var artistName: String?
    var collectionName: String?
    var artworkUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case artistId = "artistId"
        case collectionId = "collectionId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case artworkUrl = "artworkUrl60"
    }
    
    public func defaultMapping() -> Album {
        return Album(artistId: self.artistId ?? -1,
                     collectionId: self.collectionId ?? -1,
                     artistName: self.artistName ?? "",
                     collectionName: self.collectionName ?? "",
                     artworkUrl: self.artworkUrl ?? "")
    }
}
