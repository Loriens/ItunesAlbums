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
        
        self.output?.beginLoading()
        if Reachability.isConnectedToNetwork() {
            let _: GetAlbumsResponseModel? = self.execute(request, onSuccess: self.loadAlbumsSuccess, onError: self.loadAlbumsError)
        } else {
            self.output?.finishLoading(with: InternetConnectionError())
        }
    }
    
    // MARK: - Module functions
    func loadAlbumsSuccess(result: GetAlbumsResponseModel?, response: URLResponse?) {
        self.output?.loadAlbumsSuccess(result?.results ?? [])
        self.output?.finishLoading(with: nil)
    }
    
    private func loadAlbumsError(error: Error?, response: URLResponse?) {
        self.output?.loadAlbumsError()
        guard let response = response as? HTTPURLResponse else {
            self.output?.finishLoading(with: error)
            return
        }
        self.output?.finishLoading(with: ServerError(response: response))
    }
}
