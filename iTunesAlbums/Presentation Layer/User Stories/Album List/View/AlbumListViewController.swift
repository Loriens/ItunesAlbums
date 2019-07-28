//
//  AlbumListViewController.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import PinLayout

class AlbumListViewController: UIViewController, AlbumListViewInput, ModuleTransitionable {
    
    // MARK: - Subviews
    private let searchBar = UISearchBar()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let activityIndicator = UIActivityIndicatorView()
    
    // MARK: - Props
    var output: AlbumListViewOutput?
    var adapter: AlbumListViewAdapter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.loadData()
        configureAdapter()
        configureSubviews()
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
        view.addSubview(activityIndicator)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSubviews()
    }
    
    // MARK: - AlbumListViewInput
    func configure(with: AlbumListViewState) { }
    
    // MARK: - Module functions
    private func configureAdapter() {
        adapter?.set(view: collectionView)
        adapter?.didSelectAlbum = { [weak self] album in
            self?.output?.select(album: album)
        }
    }
    
    private func configureSubviews() {
        title = AppLocalization.AlbumList.title.localized
        view.backgroundColor = .white
        activityIndicator.style = .gray
        activityIndicator.hidesWhenStopped = true
    }
    
    private func layoutSubviews() {
        
        collectionView.pin
            .top(view.pin.safeArea)
            .bottom(view.pin.safeArea)
            .start(view.pin.safeArea)
            .end(view.pin.safeArea)
        
        activityIndicator.pin
            .center()
    }
    
}
