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
    var newsModel: NewsModel = NewsModel(data: [])
    var isLoading = false
    var errorMessage: String?
    
    private var apiKey: String {
        guard
            let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let dict = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any],
            let key = dict["API_KEY"] as? String
        else { return "" }
        
        return key
    }
    
    init() {
        Task {
            await fetchHeadlines()
        }
    }
    
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
            
            let decode = try JSONDecoder().decode(NewsModel.self, from: data)
            
            newsModel = decode
        } catch {
            errorMessage = "Failed to load news: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
