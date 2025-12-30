//
//  Article.swift
//  News App
//
//  Created by Hamed Kharazmi on 30.12.25.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable, Identifiable {
    var id = UUID()
    
    let title: String
    let description: String
    let url: String
    let imageURL: String
    let publishedAt: String
    
    enum CodingKeys: String, CodingKey {
        case title, description, url
        case imageURL = "image_url"
        case publishedAt = "published_at"
    }
}
