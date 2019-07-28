//
//  AlbumListViewAdapter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

protocol AlbumListViewAdapter: CollectionViewAdapter {
    var didSelectAlbum: ((Album) -> Void)? { get set }
    
    func configure(with items: [Album])
}
