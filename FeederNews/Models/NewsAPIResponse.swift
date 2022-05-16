//
//  NewsAPIResponse.swift
//  FeederNews
//
//  Created by Ahmed Elgarhy on 5/14/22.
//

import Foundation

struct NewsAPIResponse: Codable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
