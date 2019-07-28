//
//  CollectionCell.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

public protocol CollectionCellRepresentable {
    var model: CollectionCellIdentifiable? { get set }
}

class CollectionCell: UICollectionViewCell, CollectionCellRepresentable {
    // MARK: - Identifier
    class public var identifier: String {
        return String.className(self)
    }
    
    // MARK: - Props
    public var model: CollectionCellIdentifiable? {
        didSet {
            self.updateViews()
        }
    }
    
    // MARK: - Initialization
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - Setup functions
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }
    
    open func setupView() { }
    
    open func updateViews() { }
}
