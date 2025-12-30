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
                
                if vm.isLoading {
                    ProgressView("Loading...")
                } else {
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
                }
            }
            .alert("Error", isPresented: .constant(vm.errorMessage != nil)) {
                Button("OK") {
                    vm.errorMessage = nil
                }
            }
            .navigationTitle("Top Headlines")
            .task {
                await vm.fetchHeadlines()
            }
        }
    }
}

#Preview {
    NewsHeadlinesView()
}
