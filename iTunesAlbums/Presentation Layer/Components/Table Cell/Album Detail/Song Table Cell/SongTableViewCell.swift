//
//  SongTableViewCell.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class SongTableViewCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var songNameLabel: UILabel!
    @IBOutlet private weak var songImageView: UIImageView!
    
    // MARK: - Setup functions
    override func setupView() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.songNameLabel.apply(.songNameStyle())
    }
    
    override func updateViews() {
        guard let model = self.model as? SongTableCellModel else { return }
        
        self.songNameLabel.text = model.song.trackName
        
        guard let url = URL(string: model.song.artworkUrl30) else { return }
        self.songImageView.kf.setImage(with: url) { _ in
            self.songImageView.setNeedsLayout()
        }
    }
    
}
