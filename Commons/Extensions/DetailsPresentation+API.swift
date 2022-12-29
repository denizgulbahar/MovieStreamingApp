//
//  DetailsPresentation+API.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 21.10.2022.
//

import Foundation

extension DetailsPresentation {
    
    init(movie: Movie) {
        self.init(title: movie.title, detail: movie.detail, score: movie.score, releaseDate: movie.releaseDate, backdropImage: movie.backdropImage)
    }
}
