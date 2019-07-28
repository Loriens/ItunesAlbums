//
//  InternetConnectionError.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct InternetConnectionError: LocalizedError {
    public var errorDescription: String? {
        return AppLocalization.Errors.internetConnection.localized
    }
    
    var statusCode: Int {
        return -1009
    }
    
    func createNSError() -> NSError {
        let userInfo: [String: Any] = [
            NSLocalizedDescriptionKey: self.errorDescription as Any
        ]
        return NSError(domain: "", code: self.statusCode, userInfo: userInfo)
    }
}
