//
//  ContentView.swift
//  FeederNews
//
//  Created by Ahmed Elgarhy on 5/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("Feeds", systemImage: "globe.europe.africa")
                }
            
        }
        ArticleListView(articles: Article.previewData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
