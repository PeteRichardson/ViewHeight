//
//  TextModel.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI
@MainActor
public final class TextModel: ObservableObject {
    @Published var lines: [String] = []
    public var resourceName: String
    
    public init(resourceName: String = "Rapunzel") {
        self.resourceName = resourceName
        load(resourceName: resourceName)
        #if DEBUG
            print("TextModel initialized: \(resourceName).txt, \(lines.count) lines")
        #endif
    }
    
    
    /// Load text from an embedded .txt file
    /// - Parameter resourceName: basename of a bundled .txt file
    private func load(resourceName: String) {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "txt"),
              let data = try? Data(contentsOf: url),
              let str  = String(data: data, encoding: .utf8) else {
            self.lines = ["Could not load embedded text from \(resourceName).txt (file may not exist) in bundle."]
            return
        }
        self.lines = str.components(separatedBy: .newlines)
    }
}
