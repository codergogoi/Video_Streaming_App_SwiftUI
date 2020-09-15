//
//  HomeContentViewModel.swift
//  NetflixSwiftUI
//
//  Created by JAYANTA GOGOI on 9/14/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import SwiftUI
import Combine

class HomeContentViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    
    @Published var movies: [Movie] = []
    
    @Published var featuredMovie: Movie?
    
    init() {
        print("working...")
        fetchMovies()
    }
    
    private func fetchMovies(){
        
        self.cancellable = WebService().fetchMovies(endpoint: "watch/movie")
            .sink(receiveCompletion: { (completionResult) in
                print(completionResult)
            }, receiveValue: {(listOfMovies: [Movie]) in
                if listOfMovies.count > 0 {
                        self.featuredMovie = listOfMovies.first
                }
                self.movies = listOfMovies
                print(self.movies)
            })
    }
    
    
}
