//
//  AlbumListViewState.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AlbumListViewState {
    case data(albums: [Album])
    case loading
    case error(error: Error)
}
