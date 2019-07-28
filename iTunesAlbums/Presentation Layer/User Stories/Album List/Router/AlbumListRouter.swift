//
//  AlbumListRouter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

class AlbumListRouter: AlbumListRouterInput {
    
    // MARK: - Properties
    
    weak var view: ModuleTransitionable?
    
    // MARK: - UserListRouterInput
    
    func showAlbumDetail(with album: Album) { }
    
}
