//
//  TextLoadingIndicator.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/17/25.
//

import SwiftUI

struct TextLoadingIndicator: View {
    @ObservedObject var model: TextModel
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            HStack {
                Group {
                    switch model.loadState {
                    case .idle:
                        Image(systemName: "clock")
                    case .loading:
                        Image(systemName: "arrow.down.doc")
                    case .loaded:
                        Image(systemName: "text.document")
                    case .failed:
                        Image(systemName: "exclamationmark.triangle")
                    }
                }
                Text(String(describing: model.loadState))
            }.font(.largeTitle)
        }
    }
}

#Preview {
    @Previewable @StateObject var model = TextModel()
    TextLoadingIndicator(model: model)
}
