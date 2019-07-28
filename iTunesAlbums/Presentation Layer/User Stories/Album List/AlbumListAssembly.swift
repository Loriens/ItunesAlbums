//
//  AlbumListAssembly.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

enum AlbumListAssembly {
    
    // Create and return controller
    static func create() -> AlbumListViewController {
        return AlbumListViewController(nibName: AlbumListViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: AlbumListViewController) -> AlbumListPresenterInput {
        let presenter = AlbumListPresenter()
        
        let interactor = AlbumListInteractor()
        interactor._output = presenter
        
        let router = AlbumListRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
