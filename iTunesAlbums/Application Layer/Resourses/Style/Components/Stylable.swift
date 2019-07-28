//
//  Stylable.swift
//  iTunesAlbums
//
//  Created by Vladislav on 27/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

protocol Stylable { }

extension NSObject: Stylable { }

extension Stylable {
    
    static func style(style: @escaping Style<Self>) -> Style<Self> { return style }
    
    func apply(_ style: StyleWrapper<Self>) {
        switch style {
        case let .wrap(style):
            style(self)
        }
    }
}
