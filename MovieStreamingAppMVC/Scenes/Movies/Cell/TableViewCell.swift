//
//  TableViewCell.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 20.10.2022.
//

import UIKit
import SDWebImage


protocol MoviesTableViewCellProtocol {
    var delegate:MoviesTableViewCellDelegate? {get set }
}
protocol MoviesTableViewCellDelegate: AnyObject {
    func  showMovies(_ presentation: MoviePresentation)
}


final class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var relelaseYearLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    let posterImageBaseUrl = "https://image.tmdb.org/t/p/original"
    
}

extension TableViewCell:MoviesTableViewCellDelegate {
    func showMovies(_ presentation: MoviePresentation) {
        let url =  URL(string: posterImageBaseUrl + presentation.posterImage)
        backdropImage.sd_setImage(with: url)
        titleLabel.text = presentation.title
        scoreLabel.text = String(presentation.score)
        let releaseDate = presentation.releaseDate.components(separatedBy: "-")
        relelaseYearLabel.text = releaseDate[0]
    }
    
    
}
