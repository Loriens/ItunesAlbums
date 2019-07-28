//
//  AlbumCollectionCellModel.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import UIKit

class AlbumCollectionCellModel: CollectionCellModel {
    
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    public override var cellIdentifier: String {
        return AlbumCollectionViewCell.identifier
    }
    
    public override var cellHeight: CGFloat {
        return 100
    }
}
