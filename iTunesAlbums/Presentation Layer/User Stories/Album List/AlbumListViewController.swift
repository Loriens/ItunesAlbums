//
//  AlbumListViewController.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper
import NVActivityIndicatorView

protocol AlbumListViewInput: ViperViewInput { }

protocol AlbumListViewOutput: ViperViewOutput {
    func loadAlbums(text: String)
    func select(album: Album)
}

class AlbumListViewController: ViperViewController, AlbumListViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var activityIndicatorView: NVActivityIndicatorView!
    
    // MARK: - Props
    fileprivate var output: AlbumListViewOutput? {
        guard let output = self._output as? AlbumListViewOutput else { return nil }
        return output
    }
    
    var albumCellModels: [AlbumCollectionCellModel] = []
    
    // MARK: - Collection view props
    private var interItemSpacing: CGFloat = 0
    private var lineSpacing: CGFloat = 16
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.AlbumList.title.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.searchBar.placeholder = AppLocalization.AlbumList.searchBarPlaceholder.localized
        self.searchBar.delegate = self
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCellNib(AlbumCollectionViewCell.self)
        
        self.activityIndicatorView.type = .ballClipRotatePulse
        self.activityIndicatorView.color = AppTheme.backgroundBar
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - AlbumListViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    override func updateViewState(with viewModel: ViperViewModel, animated: Bool) {
        guard let model = viewModel as? AlbumListViewModel else { return }
        self.albumCellModels = model.albums.map({ AlbumCollectionCellModel(album: $0) })
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    override func beginLoading() {
        super.beginLoading()
        self.activityIndicatorView.startAnimating()
    }
    
    override func finishLoading(with error: Error?) {
        super.finishLoading(with: error)
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
        }
    }
    
}

// MARK: - Actions
extension AlbumListViewController { }

// MARK: - Module functions
extension AlbumListViewController { }

// MARK: - UISearchBarDelegate
extension AlbumListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text,
            !text.isEmpty else {
                self.show(title: "Строка поиска пуста", message: nil, animated: true)
                return
        }
        
        self.view.endEditing(true)
        self.output?.loadAlbums(text: text)
        searchBar.text = ""
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AlbumListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: albumCellModels[indexPath.row].cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.output?.select(album: self.albumCellModels[indexPath.row].album)
    }
    
}

// MARK: - UICollectionViewDataSource
extension AlbumListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumCellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath) as? AlbumCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.model = self.albumCellModels[indexPath.row]
        return cell
    }
    
}
