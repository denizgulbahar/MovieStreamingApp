//
//  Result.swift
//  MovieStreamingAppMVC
//
//  Created by Deniz Gülbahar on 19.10.2022.
//

import Foundation


public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

