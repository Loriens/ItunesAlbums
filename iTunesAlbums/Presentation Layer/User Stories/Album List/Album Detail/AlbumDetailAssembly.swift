//
//  AlbumDetailAssembly.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

enum AlbumDetailAssembly {
    
    // Create and return controller
    static func create() -> AlbumDetailViewController {
        return AlbumDetailViewController(nibName: AlbumDetailViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: AlbumDetailViewController) -> AlbumDetailPresenterInput {
        let presenter = AlbumDetailPresenter()
        
        let interactor = AlbumDetailInteractor()
        interactor._output = presenter
        
        let router = AlbumDetailRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
