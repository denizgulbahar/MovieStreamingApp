//
//  PopularContracts.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 20.10.2022.
//

import Foundation

@objc protocol PopularViewProtocol: AnyObject {
    var delegate: PopularViewDelegate? { get set }
    var searching:Bool {get set}
    func updateMovies(_ movies: [MoviePresentation])
}

@objc protocol PopularViewDelegate: AnyObject {
    func didSelectMovie(at index: Int)
    func filterMovie(searchText:String)
}

