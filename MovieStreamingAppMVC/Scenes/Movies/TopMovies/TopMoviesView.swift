//
//  TopMoviesView.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import UIKit

final class TopMoviesView: UIView {
    
    weak var delegate: TopMoviesViewDelegate?
    private var movies = [MoviePresentation]()
    private var filteredmovies = [MoviePresentation]()
    var searching = false
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var topMoviesTableView: UITableView!
    
}

extension TopMoviesView:TopMoviesViewProtocol {
    func updateMovies(_ movies: [MoviePresentation]) {
        self.movies = movies
        DispatchQueue.main.sync {
            topMoviesTableView.reloadData()
        }
       
    }
    
    
    
    
}

extension TopMoviesView:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredmovies.count
        }else {
            return movies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topMoviesTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if searching {
            let movies = filteredmovies[indexPath.row]
            cell.showMovies(movies)
        }
        else {
            let movies = movies[indexPath.row]
            cell.showMovies(movies)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMovie(at: indexPath.row)
    }
    
}

extension TopMoviesView:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searching = true
        delegate?.filterMovie(searchText: searchText)
        filteredmovies = searchText.isEmpty ? movies :  movies.filter ({$0.title.lowercased().contains(searchText.lowercased())})
        topMoviesTableView.reloadData()
    }
}
