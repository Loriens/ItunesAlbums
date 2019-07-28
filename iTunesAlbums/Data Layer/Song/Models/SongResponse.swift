//
//  SongResponse.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct SongResponse: Codable {
    var artistId: Int?
    var collectionId: Int?
    var trackId: Int?
    var trackName: String?
    var artworkUrl30: String?
    
    public func defaultMapping() -> Song {
        return Song(artistId: self.artistId ?? -1,
                    collectionId: self.collectionId ?? -1,
                    trackId: self.trackId ?? -1,
                    trackName: self.trackName ?? "",
                    artworkUrl30: self.artworkUrl30 ?? "")
    }
}
