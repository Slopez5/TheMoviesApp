//
//  MessageRequest.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 16/11/22.
//

import Foundation

struct PopularMoviesRequest:Encodable {
    let api_key = Settings.shared.apiKey
    
    func getParams() -> NSDictionary{
        return [
            "api_key":api_key
        ] as NSDictionary
    }
}
