//
//  WebServices.swift
//  NetflixSwiftUI
//
//  Created by JAYANTA GOGOI on 9/14/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import Foundation
import Combine

let baseURL = "https://netflix-example.herokuapp.com/"

class WebService{
 
    func fetchMovies<T: Decodable>(endpoint: String) -> AnyPublisher<[T], Error>{
        
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            fatalError("Url is not valid")
        }
 
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map{ $0.data}
            .decode(type: [T].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
 
    }
    
    
}
