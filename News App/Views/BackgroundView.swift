//
//  BackgroundView.swift
//  News App
//
//  Created by Hamed Kharazmi on 30.12.25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [.blue.opacity(0.2), .purple.opacity(0.3)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .blur(radius: 40)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
