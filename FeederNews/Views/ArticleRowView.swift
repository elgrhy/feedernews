//
//  ArticleRowView.swift
//  FeederNews
//
//  Created by Ahmed Elgarhy on 5/14/22.
//

import SwiftUI

struct ArticleRowView: View {
    
    let article: Article
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16){
            
            AsyncImage(url: article.imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    fatalError()
                }
            }
            .frame(minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
            .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(2)
                
                
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ArticleRowView(article: .previewData[0])
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            
        }
        .listStyle(.plain)
        
    }
}
