//
//  DetailsBuilder.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 21.10.2022.
//

import UIKit

final class DetailsBuilder {
    
    static func make(with movie: Movie) -> DetailsViewController {
        
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        viewController.movie = movie
        return viewController
    }
}
