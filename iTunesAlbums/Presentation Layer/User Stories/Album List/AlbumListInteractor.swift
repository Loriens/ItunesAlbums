//
//  AlbumListInteractor.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol AlbumListInteractorInput: ViperInteractorInput {
    func loadAlbums(text: String)
}

protocol AlbumListInteractorOutput: ViperInteractorOutput {
    func loadAlbumsSuccess(_ albumResponses: [AlbumResponse])
    func loadAlbumsError()
}

open class AlbumListInteractor: ViperInteractor, AlbumListInteractorInput {

    // MARK: - Props
    private var output: AlbumListInteractorOutput? {
        guard let output = self._output as? AlbumListInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - AlbumListInteractorInput
    func loadAlbums(text: String) {
        guard let request = AlbumRemoteRouter.list(text: text).request else { return }
        
        let _: GetAlbumsResponseModel? = self.execute(request, onSuccess: self.loadAlbumsSuccess, onError: self.loadAlbumsError)
    }
    
    // MARK: - Module functions
    func loadAlbumsSuccess(result: GetAlbumsResponseModel?, response: URLResponse?) {
        self.output?.loadAlbumsSuccess(result?.results ?? [])
    }
    
    private func loadAlbumsError(error: Error?, response: URLResponse?) {
        self.output?.loadAlbumsError()
        self.output?.finishLoading(with: error)
    }
}
