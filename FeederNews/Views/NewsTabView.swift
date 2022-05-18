//
//  NewsTabView.swift
//  FeederNews
//
//  Created by Ahmed Elgarhy on 5/18/22.
//

import SwiftUI

struct NewsTabView: View {

    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    
    var body: some View {
        NavigationView {
            
        ArticleListView(articles: articles)
                .navigationTitle(articleNewsVM.selectedCategory.text)
            
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
    }
}
