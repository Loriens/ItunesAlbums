//
//  AppLocalization.swift
//  iTunesAlbums
//
//  Created by Vladislav on 27/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AppLocalization {
    
    enum General: String, Localizable {
        case ok = "OK"
        case save = "Save"
        case cancel = "Cancel"
    }
    
    enum Theme: String, Localizable {
        case light = "AppThemeLight"
        case dark = "AppThemeDark"
    }
    
    enum Language: String, Localizable {
        case english = "AppLanguageEnglish"
        case russian = "AppLanguageRussian"
    }
    
    enum AlbumList: String, Localizable {
        case title = "AlbumListTitle"
        case searchBarPlaceholder = "AlbumListSearchBarPlaceholder"
    }
    
    enum AlbumDetail: String, Localizable {
        case title = "AlbumDetailTitle"
    }
    
    enum Errors: String, Localizable {
        case tooManyRequests = "ErrorRequestLimit"
        case internetConnection = "InternetConnectionError"
    }
    
}
