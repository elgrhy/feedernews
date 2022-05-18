//
//  Category.swift
//  FeederNews
//
//  Created by Ahmed Elgarhy on 5/17/22.
//

import Foundation
import UIKit

enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case sport
    case science
    case health
    
    var text: String {
        
        if self == .general {
            return "Top Feeds"
        }
        return rawValue.capitalized
    }
    
}

extension Category: Identifiable {
    var id: Self { self }
}
