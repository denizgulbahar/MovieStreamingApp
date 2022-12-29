//
//  MovieModel.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import Foundation

public struct Movie: Decodable,Equatable {
    
    public enum CodingKeys: String, CodingKey {
    
        case title
        case detail = "overview"
        case score = "vote_average"
        case releaseDate = "release_date"
        case posterImage = "poster_path"
        case backdropImage = "backdrop_path"
    }
    
    public let title:String
    public let detail:String
    public let score:Double
    public let releaseDate:String
    public let posterImage:String
    public let backdropImage:String
}


