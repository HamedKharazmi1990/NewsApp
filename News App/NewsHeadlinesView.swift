//
//  ContentView.swift
//  News App
//
//  Created by Hamed Kharazmi on 30.12.25.
//

import SwiftUI
import WebKit

struct NewsHeadlinesView: View {
    @State private var vm = NewsViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                // MARK: List of Articles
                List {
                    ForEach(vm.newsModel.data) { newsModel in
                        // TODO: Article Row View
                        NavigationLink {
                            WebView(URL(string: newsModel.url)!)
                        } label: {
                            ArticleRowView(datum: newsModel)
                        }
                    }
                }
                
                if vm.isLoading {
                    ProgressView("Loading...")
                        .font(.headline)
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 10)
                }
            }
            .alert("Error", isPresented: .constant(vm.errorMessage != nil)) {
                Button("OK") {
                    vm.errorMessage = nil
                }
            } message: {
                Text(vm.errorMessage ?? "")
            }
            .navigationTitle("Top Headlines")
            .task {
                await vm.fetchHeadlines()
            }
            .refreshable {
                await vm.fetchHeadlines()
            }
        }
    }
}

#Preview {
    NewsHeadlinesView()
}
