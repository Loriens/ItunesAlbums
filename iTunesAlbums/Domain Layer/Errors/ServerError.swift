//
//  ServerError.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct ServerError: LocalizedError {
    var statusCode: Int {
        return self.statusCodeOptional ?? 0
    }
    
    var errorDescription: String? {
        switch statusCode {
        case 400:
            return "Неправильный запрос к серверу"
        case 401:
            return "Требуется авторизация на сервере"
        case 403:
            return "Запрос отклонён сервером"
        case 404:
            return "Адрес не найден"
        case 500...599:
            return "Ошибка сервера"
        default:
            return "Неизвестная ошибк."
        }
    }
    
    private var statusCodeOptional: Int?
    
    init(response: HTTPURLResponse) {
        self.statusCodeOptional = response.statusCode
    }
}
