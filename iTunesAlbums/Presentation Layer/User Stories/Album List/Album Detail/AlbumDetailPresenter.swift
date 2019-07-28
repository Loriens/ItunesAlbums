//
//  AlbumDetailPresenter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol AlbumDetailPresenterInput: ViperPresenterInput { }

class AlbumDetailPresenter: ViperPresenter, AlbumDetailPresenterInput, AlbumDetailViewOutput, AlbumDetailInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: AlbumDetailViewInput? {
        guard let view = self._view as? AlbumDetailViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: AlbumDetailInteractorInput? {
        guard let interactor = self._interactor as? AlbumDetailInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: AlbumDetailRouterInput? {
        guard let router = self._router as? AlbumDetailRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: AlbumDetailViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = AlbumDetailViewModel()
    }
    
    // MARK: - AlbumDetailPresenterInput
    override func configure(with data: Any?) {
        if let album = data as? Album {
            self.viewModel.album = album
        }
    }
    
    // MARK: - AlbumDetailViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        
        self.interactor?.loadSongs(albumId: self.viewModel.album.collectionId)
    }
    
    // MARK: - AlbumDetailInteractorOutput
    func loadSongsSuccess(_ songResponses: [SongResponse]) {
        self.viewModel.songs = songResponses.map({ $0.defaultMapping() }).filter({ $0.trackId >= 0 })
        self.view?.updateViewState(with: self.viewModel, animated: true)
    }
    
    func loadSongsError() { }
    
    // MARK: - Module functions
}
