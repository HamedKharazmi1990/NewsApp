//
//  ContentView.swift
//  News App
//
//  Created by Hamed Kharazmi on 30.12.25.
//

import SwiftUI

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
                        ForEach(vm.article.data) { article in
                            // TODO: Article Row View
                            Text(article.title)
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
