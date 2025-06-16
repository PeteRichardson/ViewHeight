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
    
    init(resourceName: String = "Rapunzel") {
        load(resourceName: resourceName)
    }
    
    
    /// Load text from an embedded .txt file
    /// - Parameter resourceName: basename of a bundled .txt file
    private func load(resourceName: String) {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "txt"),
              let data = try? Data(contentsOf: url),
              let str  = String(data: data, encoding: .utf8) else {
            text = "Could not load embedded text from \(resourceName).txt (file may not exist) in bundle."
            return
        }
        text = str
    }
}
