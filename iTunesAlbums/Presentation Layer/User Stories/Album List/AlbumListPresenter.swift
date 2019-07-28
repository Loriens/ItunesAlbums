//
//  AlbumListPresenter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol AlbumListPresenterInput: ViperPresenterInput { }

class AlbumListPresenter: ViperPresenter, AlbumListPresenterInput, AlbumListViewOutput, AlbumListInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: AlbumListViewInput? {
        guard let view = self._view as? AlbumListViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: AlbumListInteractorInput? {
        guard let interactor = self._interactor as? AlbumListInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: AlbumListRouterInput? {
        guard let router = self._router as? AlbumListRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: AlbumListViewModel
    
    var timer: Timer?
    
    // MARK: - Initialization
    override init() {
        self.viewModel = AlbumListViewModel()
    }
    
    // MARK: - AlbumListPresenterInput
    
    // MARK: - AlbumListViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        
        self.timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(self.clearRequestCount), userInfo: nil, repeats: true)
    }
    
    func loadAlbums(text: String) {
        guard !text.isEmpty else { return }
        
        if self.viewModel.requestCount < self.viewModel.requestLimit {
            self.interactor?.loadAlbums(text: text)
            self.viewModel.requestCount += 1
        } else {
            self.finishLoading(with: TooManyRequestsError())
        }
    }
    
    func select(album: Album) {
        _ = self.router?.pushAlbumDetailViewController(album: album)
    }
    
    // MARK: - AlbumListInteractorOutput
    func loadAlbumsSuccess(_ albumResponses: [AlbumResponse]) {
        self.viewModel.albums = albumResponses.map({ $0.defaultMapping() })
            .sorted(by: { $0.collectionName.localizedCaseInsensitiveCompare($1.collectionName) == ComparisonResult.orderedAscending })
        self.view?.updateViewState(with: self.viewModel, animated: true)
    }
    
    func loadAlbumsError() { }
    
    // MARK: - Module functions
    @objc
    func clearRequestCount() {
        self.viewModel.requestCount = 0
    }
}
