//
//  AppTabView.swift
//  NetflixSwiftUI
//
//  Created by JAYANTA GOGOI on 9/14/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    
    @State private var selectedView: Int = 0
    
    init(){
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().barTintColor = .black
    }
    
    
    var body: some View {
        
        TabView(selection: $selectedView) {
                
            HomeContentView()
            .tabItem({
                Image(uiImage: #imageLiteral(resourceName: "tb_home"))
                Text("Home")
            }).tag(0)
            
            SearchView()
            .tabItem({
                Image(uiImage: #imageLiteral(resourceName: "tb_search"))
                Text("Search")
            }).tag(1)
            
            SearchView()
            .tabItem({
                Image(uiImage: #imageLiteral(resourceName: "tb_coming_soon"))
                Text("Coming Soon")
            }).tag(2)
            
            SearchView()
            .tabItem({
                Image(uiImage: #imageLiteral(resourceName: "tb_download"))
                Text("Downloads")
            }).tag(3)
            
            SearchView()
            .tabItem({
                Image(uiImage: #imageLiteral(resourceName: "tb_more"))
                Text("More")
            }).tag(4)
            
            
            
        }
        
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
