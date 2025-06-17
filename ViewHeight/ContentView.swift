//
//  ContentView.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI
import Logging

struct ContentView: View {
    private static let logger = Logger(label: "ContentView")

    @StateObject private var model = TextModel()
    @State var scrollPosition = ScrollPosition(edge: .top)
    
    var body: some View {
        Group {
            switch model.loadState {
            case .idle, .loading, .failed:
                TextLoadingIndicator(model: model)
            case .loaded:
                TextView(model: model, scrollPosition: $scrollPosition)
                .frame(maxWidth: .infinity, alignment: .leading)
           }
                
        }
        .navigationTitle(model.resourceName)
        .onReceive(model.$loadState.removeDuplicates()) { newValue in
            Self.logger.debug("loadState → \(newValue)")
        }
        .task { await model.load(resourceName: model.resourceName) }
    }
}

#Preview {
    ContentView()
}
