//
//  ContentView.swift
//  NetflixSwiftUI
//
//  Created by JAYANTA GOGOI on 9/14/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import SwiftUI
import Combine

struct HomeContentView: View {
    
    @ObservedObject private var viewModel = HomeContentViewModel()
    
    
    let screenSize = UIScreen.main.bounds
 
    var body: some View {
        
        //ScrollView
        ScrollView{
            VStack(spacing: 0){
        //Movie Poster
            VStack{
               
                ZStack{
                    
                    WebImage(imageUrl: self.viewModel.featuredMovie?.thumbnail)
                    
                     VStack{

                        HStack{
                            Spacer()
                            Image(uiImage: #imageLiteral(resourceName: "logo"))
                            .resizable()
                            .frame(width: 32, height: 50)
                            Spacer()
                            Button("TV Shows"){
                                
                            }.foregroundColor(.white)
                            .frame(height: 40)
                            .font(.headline)
                            Spacer()
                            
                            Button("Movies"){
                                
                            }.foregroundColor(.white)
                            .frame(height: 40)
                            .font(.headline)
                            Spacer()
                            
                            Button("My List"){
                                    
                            }.foregroundColor(.white)
                            .frame(height: 40)
                            .font(.headline)
                            Spacer()
                            
                            }.padding(.top, 40).padding(.leading, 20)
                        
                        Spacer()
                        //controls Buttons
                        HStack{
                            Spacer()
                            Button(action: {
                                print("My wish list")
                            },label: {
                                VStack{
                                    Text("＋").foregroundColor(.white)
                                        .font(.system(size: 30))
                                    Text("My List").font(.custom("Helvetica-Bold", size: 16)).foregroundColor(.white)
                                }
                            })
                            .frame(height: 40)
                            .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                print("Play Video")
                            },label: {
                                HStack{
                                    Text("▶︎").foregroundColor(.black)
                                        .font(.system(size: 30))
                                    Text("Play").font(.custom("Helvetica-Bold", size: 16)).foregroundColor(.black)
                                }
                                
                            })
                            .frame(width: 160)
                            .cornerRadius(10)
                            .background(Color.white)
 
                            Spacer()
                            
                            Button(action: {
                               print("Info")
                           },label: {
                               VStack{
                                   Text("ⓘ").foregroundColor(.white)
                                       .font(.system(size: 30))
                                   Text("My List").font(.custom("Helvetica-Bold", size: 16)).foregroundColor(.white)
                               }
                           })
                           .frame(height: 40)
                           .padding()
                            
                            Spacer()
                            
                        }.background(Color.black)
                    }
                }
                
            }.background(Color.red)
            .frame(width: screenSize.width, height: screenSize.height / 1.3, alignment: .top)
            Spacer()
        }
 
        // Scrollable movies list
        VStack{
            HStack{
                Text("Tranding Now").font(.largeTitle).foregroundColor(.white)
                Spacer()
            }.padding(.leading, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(self.viewModel.movies, id: \._id){ movie in
                        VStack{
                           
                            WebImage(imageUrl: movie.thumbnail)
 
                        }.frame(width: 120, height: 180)
                            .background(Color.green)
                        
                    }
                }
                
            }
            
        }.background(Color.black)
            
            
          
        Spacer()
        
        }.edgesIgnoringSafeArea(.all)
        .background(Color.black)
                 
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
