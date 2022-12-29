//
//  DetailsView.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 21.10.2022.
//

import UIKit

final class DetailsView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    let backdropImageBaseUrl = "https://image.tmdb.org/t/p/w500"
}

extension DetailsView:DetailsViewProtocol {
    func updateMovieDetails(_ details: DetailsPresentation) {
        titleLabel.text = details.title
        let url =  URL(string: backdropImageBaseUrl + details.backdropImage)
        backdropImage.sd_setImage(with: url)
        scoreLabel.text = "IMDB : \(String(details.score))"
        let releaseDate = details.releaseDate.components(separatedBy: "-")
        releaseYearLabel.text = releaseDate[0]
    }
    
    
}
