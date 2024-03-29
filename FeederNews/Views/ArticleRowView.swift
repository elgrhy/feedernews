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
                    HStack{
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                        Spacer()
                    }
                    
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
                
                HStack {
                    Text(article.captionText)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                        .font(.caption)
                    Spacer()
                    
                    Button {

                    } label: {
                        Image(systemName: "heart")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        presentShareSheet(url: article.articleURL)
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right")
                    }
                    .buttonStyle(.bordered)

                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

extension View {
    
    func presentShareSheet(url: URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
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
