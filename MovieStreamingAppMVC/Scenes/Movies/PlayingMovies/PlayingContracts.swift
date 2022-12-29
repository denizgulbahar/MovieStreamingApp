//
//  PlayingContracts.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 20.10.2022.
//

import Foundation

@objc protocol PlayingViewProtocol: AnyObject {
    var delegate: PlayingViewDelegate? { get set }
    var searching:Bool {get set}
    func updateMovies(_ movies: [MoviePresentation])
}

@objc protocol PlayingViewDelegate: AnyObject {
    func didSelectMovie(at index: Int)
    func filterMovie(searchText:String)
}

