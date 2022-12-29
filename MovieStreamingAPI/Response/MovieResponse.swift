//
//  ModelResponse.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import Foundation

public struct MovieResponse:Decodable {
    var results:[Movie]
    
    private enum ResultsCodingKeys: String, CodingKey {
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let itemsContainer = try decoder.container(keyedBy: ResultsCodingKeys.self)
        results = try itemsContainer.decode([Movie].self, forKey: .results )
    }
}
