//
//  AlbumListPresenter.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

class AlbumListPresenter: AlbumListViewOutput, AlbumListPresenterInput {
    
    // MARK: - Props
    weak var view: AlbumListViewInput?
    var router: AlbumListRouterInput?
    var output: AlbumListPresenterOutput?
    var interactor: AlbumListInteractorInput?
    
    // MARK: - UserListViewOutput
    func loadData() { }
    
    func select(album: Album) { }
    
}
