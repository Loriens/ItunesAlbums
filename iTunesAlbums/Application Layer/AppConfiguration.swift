//
//  AppConfiguration.swift
//  iTunesAlbums
//
//  Created by Vladislav on 27/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AppConfiguration {
    
    static var serverURL: String {
        #if DEBUG
        return ""
        #else
        return ""
        #endif
    }
    
}
