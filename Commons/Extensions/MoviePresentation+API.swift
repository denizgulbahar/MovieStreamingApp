//
//  MoviePresentation+API.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import Foundation

extension MoviePresentation {
    
    convenience init(movie: Movie) {
        self.init(title: movie.title, detail: movie.detail, score: movie.score, releaseDate: movie.releaseDate, posterImage:movie.posterImage)
    }
}
