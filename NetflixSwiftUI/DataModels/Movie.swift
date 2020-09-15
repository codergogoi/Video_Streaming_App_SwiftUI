//
//  Movie.swift
//  NetflixSwiftUI
//
//  Created by JAYANTA GOGOI on 9/14/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import Foundation


struct Movie: Decodable {
    
    let _id: String
    let title: String
    let plot: String
    let thumbnail: String
    
}

