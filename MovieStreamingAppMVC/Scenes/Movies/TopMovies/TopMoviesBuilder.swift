//
//  TopMoviesBuilder.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import UIKit

final class TopMoviesBuilder {
    
    static func make() -> TopMoviesViewController {
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TopMoviesViewController") as! TopMoviesViewController
        viewController.service = app.service
        return viewController
    }
}
