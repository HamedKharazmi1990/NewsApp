//
//  ArticleRowView.swift
//  News App
//
//  Created by Hamed Kharazmi on 30.12.25.
//

import SwiftUI

struct ArticleRowView: View {
    let datum: Datum
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: datum.imageURL)) { phase in
                switch phase {
                case .empty:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.thinMaterial)
                        .frame(width: 80, height: 80)
                        .overlay {
                            ProgressView()
                        }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                case .failure:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.thinMaterial)
                        .frame(width: 80, height: 80)
                        .overlay {
                            Image(systemName: "photo")
                                .foregroundStyle(.secondary)
                        }
                @unknown default:
                    EmptyView()
                }
                
            }
            
            VStack(alignment: .leading) {
                Text(datum.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(datum.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                
                Text(datum.publishedAt)
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
        }
    }
}

#Preview {
    ArticleRowView(
        datum: .init(
            title: "Some title",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            url: "",
            imageURL: "",
            publishedAt: "publish date"
        )
    )
    .padding()
}
