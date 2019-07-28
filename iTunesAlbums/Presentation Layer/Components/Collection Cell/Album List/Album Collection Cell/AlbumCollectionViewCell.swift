//
//  AlbumCollectionViewCell.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumCollectionViewCell: CollectionCell {
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var albumImage: UIImageView!
    
    // MARK: - Identifier
    override class public var identifier: String {
        return String.className(self)
    }
    
    override func setupView() {
        self.title.apply(.cellAlbumNameStyle())
    }
    
    override func updateViews() {
        guard let model = self.model as? AlbumCollectionCellModel else { return }
        self.title.text = model.album.collectionName
        
        guard let url = URL(string: model.album.artworkUrl) else { return }
        self.albumImage.kf.setImage(with: url) { _ in
            self.albumImage.setNeedsLayout()
        }
    }
}
