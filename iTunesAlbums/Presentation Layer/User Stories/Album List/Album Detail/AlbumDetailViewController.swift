//
//  AlbumDetailViewController.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol AlbumDetailViewInput: ViperViewInput { }

protocol AlbumDetailViewOutput: ViperViewOutput { }

class AlbumDetailViewController: ViperViewController, AlbumDetailViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var albumName: UILabel!
    @IBOutlet private weak var albumImage: UIImageView!
    
    // MARK: - Props
    fileprivate var output: AlbumDetailViewOutput? {
        guard let output = self._output as? AlbumDetailViewOutput else { return nil }
        return output
    }
    
    var songCellModels: [SongTableCellModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.AlbumDetail.title.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCellNib(SongTableViewCell.self)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 62.0
        self.tableView.separatorStyle = .none
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - AlbumDetailViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        if let model = viewModel as? AlbumDetailViewModel {
            self.albumName.text = model.album.collectionName
            
            if let url = URL(string: model.album.artworkUrl) {
                self.albumImage.kf.setImage(with: url) { _ in
                    self.albumImage.setNeedsLayout()
                }
            }
        }
        
        self.setupComponents()
        self.setupActions()
    }
    
    override func updateViewState(with viewModel: ViperViewModel, animated: Bool) {
        guard let model = viewModel as? AlbumDetailViewModel else { return }
        
        self.songCellModels = model.songs.map({ SongTableCellModel(song: $0) })
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - Actions
extension AlbumDetailViewController { }

// MARK: - Module functions
extension AlbumDetailViewController { }

// MARK: - UITableViewDelegate
extension AlbumDetailViewController: UITableViewDelegate { }

// MARK: - UITableViewDataSource
extension AlbumDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songCellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.identifier, for: indexPath) as? SongTableViewCell else {
            return UITableViewCell()
        }
        cell.model = self.songCellModels[indexPath.row]
        return cell
    }
}
