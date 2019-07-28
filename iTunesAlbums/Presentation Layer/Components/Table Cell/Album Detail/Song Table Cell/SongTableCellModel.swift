//
//  SongTableCellModel.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

class SongTableCellModel: TableCellModel {
    
    public override var cellIdentifier: String {
        return SongTableViewCell.identifier
    }
    
    var song: Song
    
    init(song: Song) {
        self.song = song
    }
    
}
