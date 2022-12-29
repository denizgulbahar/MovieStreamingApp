//
//  TopTableViewCell.swift
//  FilmUygulamasi
//
//  Created by Deniz Gülbahar on 30.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    public var model:Results?
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private let overviewLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 4
        return label
    }()
    
    private let releaseYearLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let averageRatingLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let posterImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.07, green: 0.04, blue: 0.56, alpha: 1)
        contentView.clipsToBounds = true
        contentView.addSubview(titleLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(releaseYearLabel)
        contentView.addSubview(averageRatingLabel)
        contentView.addSubview(posterImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let postersize = (contentView.width/2.6)-10
        posterImageView.frame = CGRect(x: 5, y: 5, width:postersize, height: contentView.height-10)
        titleLabel.frame = CGRect(x: 10+postersize, y: 5, width:postersize*2 , height: 30)
        averageRatingLabel.frame = CGRect(x: 10+postersize, y: 5+titleLabel.bottom, width: postersize/3, height: 30)
        releaseYearLabel.frame = CGRect(x: averageRatingLabel.right+5, y: 5+titleLabel.bottom, width: postersize/3, height: 30)
        overviewLabel.frame = CGRect(x: 10+postersize, y: averageRatingLabel.bottom+10, width: postersize*1.5, height: 100)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        overviewLabel.text = nil
        averageRatingLabel.text = nil
        releaseYearLabel.text = nil
        posterImageView.image = nil
    }
    
    public func configure (with model:Results) {
        self.model = model
        titleLabel.text = model.title
        overviewLabel.text = model.overview
        averageRatingLabel.text = String(model.vote_average!)
        
        let releasedate = model.release_date
        let releasedates = releasedate?.components(separatedBy: "-")
        let releaseyear = releasedates?[0]
        releaseYearLabel.text = releaseyear
        
        
        
        
    }


}
