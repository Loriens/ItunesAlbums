//
//  AlbumListConfigurator.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

class AlbumListConfigurator {
    
    // MARK: - Public functions
    public func configure(output: AlbumListPresenterOutput? = nil) -> AlbumListViewController {
        let view = AlbumListViewController()
        let presenter = AlbumListPresenter()
        let router = AlbumListRouter()
        let interactor = AlbumListInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.output = output
        presenter.interactor = interactor
        
        router.view = view
        
        view.output = presenter
        view.adapter = AlbumListCollectionViewAdapter()
        
        return view
    }
    
}
