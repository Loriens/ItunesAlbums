//
//  StyleWrapper.swift
//  iTunesAlbums
//
//  Created by Vladislav on 27/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

typealias Style<Element> = (Element) -> Void

enum StyleWrapper<Element> {
    case wrap(style: Style<Element>)
}
