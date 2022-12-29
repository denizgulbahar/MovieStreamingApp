//
//  TopMoviesContracts.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import Foundation

@objc protocol TopMoviesViewProtocol: AnyObject {
    var delegate: TopMoviesViewDelegate? { get set }
    var searching:Bool {get set}
    func updateMovies(_ movies: [MoviePresentation])
}

@objc protocol TopMoviesViewDelegate: AnyObject {
    func didSelectMovie(at index: Int)
    func filterMovie(searchText:String)
}


