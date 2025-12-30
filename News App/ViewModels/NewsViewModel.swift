//
//  NewsViewModel.swift
//  News App
//
//  Created by Hamed Kharazmi on 30.12.25.
//

import Foundation

@MainActor
@Observable
class NewsViewModel {
    var article: Article = Article(data: [])
    var isLoading = false
    var errorMessage: String?
    
    private let apiKey = "THE API KEY"
    
    func fetchHeadlines() async {
        isLoading = true
        errorMessage = nil
        
        let urlString = "https://api.thenewsapi.com/v1/news/top?api_token=\(apiKey)&locale=us&limit=10"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decode = try JSONDecoder().decode(Article.self, from: data)
            
            article = decode
        } catch {
            errorMessage = "Failed to load news: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
