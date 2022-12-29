//
//  PlayingViewController.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 20.10.2022.
//

import UIKit

class PlayingViewController: UIViewController {

    var service: MovieServiceProtocol =  app.service

    private var movies: [Movie] = []
    private var filteredmovies: [Movie] = []
    
    @IBOutlet var playingView: PlayingMoviesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playingView.delegate = self
        
        service.fetchPlayingMovies { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.movies = response.results
                let moviePresentation = response.results.map({ MoviePresentation(movie: $0) })
                self.playingView.updateMovies(moviePresentation)
            case .failure(let error):
                print(error)
            }
    
        }
    }
    
}

extension PlayingViewController:PlayingViewDelegate {
    func didSelectMovie(at index: Int) {
        let movie:Movie!
        if playingView.searching {
        movie = filteredmovies[index]
        }
        else {
        movie = movies[index]
        }
        let DetailsViewController = DetailsBuilder.make(with: movie)
        show(DetailsViewController, sender: nil)
    }
    
    func filterMovie(searchText:String) {
        filteredmovies = searchText.isEmpty ? movies :  movies.filter ({$0.title.lowercased().contains(searchText.lowercased())})
    }
    
    
}
