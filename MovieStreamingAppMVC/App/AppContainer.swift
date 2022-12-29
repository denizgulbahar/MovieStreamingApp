//
//  AppContainer.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import Foundation
let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = MovieService()
}
