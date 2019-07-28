//
//  CollectionDisplayable.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol CollectionDisplayable {}

extension UITableView: CollectionDisplayable {}
extension UICollectionView: CollectionDisplayable {}
