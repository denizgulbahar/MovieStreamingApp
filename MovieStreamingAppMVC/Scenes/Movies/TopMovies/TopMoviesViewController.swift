//
//  TopMoviesViewController.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import UIKit

class TopMoviesViewController: UIViewController {

    var service: MovieServiceProtocol =  app.service

    private var movies: [Movie] = []
    private var filteredmovies: [Movie] = []
    
    
    @IBOutlet weak var customView: TopMoviesViewProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
        
        service.fetchTopMovies { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.movies = response.results
                let moviePresentation = response.results.map({ MoviePresentation(movie: $0) })
                self.customView.updateMovies(moviePresentation)
            case .failure(let error):
                print(error)
            }
        
        }
        
    }
    
}

extension TopMoviesViewController:TopMoviesViewDelegate {
    func didSelectMovie(at index: Int) {
        let movie:Movie!
        if customView.searching {
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
