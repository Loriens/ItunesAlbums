//
//  AlbumDetailInteractor.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol AlbumDetailInteractorInput: ViperInteractorInput {
    func loadSongs(albumId: Int)
}

protocol AlbumDetailInteractorOutput: ViperInteractorOutput {
    func loadSongsSuccess(_ songRespones: [SongResponse])
    func loadSongsError()
}

open class AlbumDetailInteractor: ViperInteractor, AlbumDetailInteractorInput {

    // MARK: - Props
    private var output: AlbumDetailInteractorOutput? {
        guard let output = self._output as? AlbumDetailInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - AlbumDetailInteractorInput
    func loadSongs(albumId: Int) {
        guard let request = SongRemoteRouter.list(albumId: albumId).request else { return }
        
        self.output?.beginLoading()
        let _: GetSongsResponseModel? = self.execute(request, onSuccess: self.loadSongsSuccess, onError: self.loadSongsError)
    }
    
    // MARK: - Module functions
    func loadSongsSuccess(result: GetSongsResponseModel?, response: URLResponse?) {
        self.output?.loadSongsSuccess(result?.results ?? [])
        self.output?.finishLoading(with: nil)
    }
    
    private func loadSongsError(error: Error?, response: URLResponse?) {
        self.output?.loadSongsError()
        guard let response = response as? HTTPURLResponse else {
            self.output?.finishLoading(with: error)
            return
        }
        self.output?.finishLoading(with: ServerError(response: response))
    }
}
