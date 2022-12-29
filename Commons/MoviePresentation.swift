//
//  MoviePresentation.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import UIKit

final class MoviePresentation: NSObject {
    
    let title: String
    let detail: String
    let score:Double
    let releaseDate:String
    let posterImage:String
    
    init(title: String, detail: String, score:Double, releaseDate:String, posterImage:String) {
        self.title = title
        self.detail = detail
        self.posterImage = posterImage
        self.releaseDate = releaseDate
        self.score = score
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MoviePresentation else { return false }
        return self.title == other.title && self.detail == other.detail && self.posterImage == other.posterImage && self.releaseDate == other.releaseDate && self.score == other.score
    }
}

