//
//  AlbumDetailRouter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol AlbumDetailRouterInput: ViperRouterInput { }

class AlbumDetailRouter: ViperRouter, AlbumDetailRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: AlbumDetailViewController? {
        guard let mainController = self._mainController as? AlbumDetailViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - AlbumDetailRouterInput
    
    // MARK: - Module functions
}
