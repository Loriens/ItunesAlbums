//
//  AlbumListRouter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol AlbumListRouterInput: ViperRouterInput { }

class AlbumListRouter: ViperRouter, AlbumListRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: AlbumListViewController? {
        guard let mainController = self._mainController as? AlbumListViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - AlbumListRouterInput
    
    // MARK: - Module functions
}
