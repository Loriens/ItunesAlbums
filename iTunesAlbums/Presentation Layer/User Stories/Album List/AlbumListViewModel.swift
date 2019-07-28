//
//  AlbumListViewModel.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

class AlbumListViewModel: ViperViewModel {
    var albums: [Album]
    var requestLimit: Int
    var requestCount: Int
    
    override init() {
        albums = []
        requestLimit = 10
        requestCount = 0
    }
}
