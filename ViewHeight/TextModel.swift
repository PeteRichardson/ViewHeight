//
//  TextModel.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI
@MainActor
final class TextModel: ObservableObject {
    @Published var text: String = ""
    
    init() {
        load()
    }
    
    private func load() {
        guard let url = Bundle.main.url(forResource: "Rapunzel", withExtension: "txt"),
              let data = try? Data(contentsOf: url),
              let str  = String(data: data, encoding: .utf8) else {
            assertionFailure("Could not load embedded text")
            return
        }
        text = str
    }
}
