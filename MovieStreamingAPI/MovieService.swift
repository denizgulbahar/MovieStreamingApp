//
//  MovieService.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import Foundation

public protocol MovieServiceProtocol {
    func fetchTopMovies(completion: @escaping (Result<MovieResponse>) -> Void)
    func fetchPlayingMovies(completion: @escaping (Result<MovieResponse>) -> Void)
    func fetchPopularMovies(completion: @escaping (Result<MovieResponse>) -> Void)
}

public class MovieService: MovieServiceProtocol {
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    
    let apiKey:String = "2b643c1d6283f863eb41ab72877a3da4"
    
    public func fetchTopMovies(completion: @escaping (Result<MovieResponse>) -> Void) {
        
       let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)")
        guard let url = url else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            if error != nil || data == nil {
                completion(.failure(Error.networkError(internal: error!)))
                return
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(MovieResponse.self, from: data!)
                completion(.success(response))
            } catch {
                completion(.failure(Error.serializationError(internal: error)))
            }
            
        } .resume()
    }
    
    public func fetchPlayingMovies(completion: @escaping (Result<MovieResponse>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
         guard let url = url else {
             return
         }
         URLSession.shared.dataTask(with: url) { (data,response,error) in
             if error != nil || data == nil {
                 completion(.failure(Error.networkError(internal: error!)))
                 return
             }
             let decoder = JSONDecoder()
             do {
                 let response = try decoder.decode(MovieResponse.self, from: data!)
                 completion(.success(response))
             } catch {
                 completion(.failure(Error.serializationError(internal: error)))
             }
             
         } .resume()
        
    }
    public func fetchPopularMovies(completion: @escaping (Result<MovieResponse>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)")
         guard let url = url else {
             return
         }
         URLSession.shared.dataTask(with: url) { (data,response,error) in
             if error != nil || data == nil {
                 completion(.failure(Error.networkError(internal: error!)))
                 return
             }
             let decoder = JSONDecoder()
             do {
                 let response = try decoder.decode(MovieResponse.self, from: data!)
                 completion(.success(response))
             } catch {
                 completion(.failure(Error.serializationError(internal: error)))
             }
             
         } .resume()
    }
    
}
