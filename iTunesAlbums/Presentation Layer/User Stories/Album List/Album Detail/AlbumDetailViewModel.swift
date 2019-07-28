//
//  AlbumDetailViewModel.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

class AlbumDetailViewModel: ViperViewModel {
    var album: Album
    var songs: [Song]
    
    override init() {
        album = Album(artistId: -1,
                      collectionId: -1,
                      artistName: "",
                      collectionName: "",
                      artworkUrl: "")
        songs = []
    }
}
