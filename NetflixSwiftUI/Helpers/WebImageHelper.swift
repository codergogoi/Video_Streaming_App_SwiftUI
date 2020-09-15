//
//  WebImageHelper.swift
//  NetflixSwiftUI
//
//  Created by JAYANTA GOGOI on 9/14/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import Foundation
import SwiftUI


class WebImageHelper: ObservableObject {
    
    @Published var imageData: Data?
    
    init(url: String?){
        if let url = url{
            fetchImage(url: url)
        }
        
    }
    
    
    private func fetchImage(url: String){
        
        guard let imgUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imgUrl) { (data, response, error) in
            
            if let imageData = data{
                DispatchQueue.main.async {
                    self.imageData = imageData
                }
            }
        }.resume()
        
    }
    
}


struct  WebImage: View {
    
    @ObservedObject private var imageHelper: WebImageHelper
    
    init(imageUrl: String?) {
        imageHelper = WebImageHelper(url: imageUrl)
    }
    
    
    var body: some View {
        Image(uiImage: getImage(data: self.imageHelper.imageData))
        .resizable()
            .aspectRatio(contentMode: .fill)
    }
    
    
    
    private func getImage(data: Data?)-> UIImage{
    
        if let imageData = data{
            return UIImage(data: imageData) ?? UIImage(imageLiteralResourceName: "not_found")
        }
        
        return UIImage(imageLiteralResourceName: "not_found")
        
    }
    
    
    
}
