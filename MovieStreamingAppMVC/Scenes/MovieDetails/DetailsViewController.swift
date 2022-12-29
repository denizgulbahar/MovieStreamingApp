//
//  DetailsViewController.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 21.10.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet var detailsView: DetailsView!
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.updateMovieDetails(DetailsPresentation(movie: movie))
    }
 

}
