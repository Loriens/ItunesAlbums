//
//  AlbumListCollectionViewAdapter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class AlbumListCollectionViewAdapter: NSObject, AlbumListViewAdapter {
    var didSelectAlbum: ((Album) -> Void)?
    
    func configure(with items: [Album]) { }
    
    func set(view: CollectionDisplayable) { }
}
