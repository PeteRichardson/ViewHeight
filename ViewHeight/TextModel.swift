//
//  TextModel.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI
import Logging

enum LoadState {
    case idle
    case loading
    case loaded
    case failed
}


public final class TextModel: ObservableObject {
    private static let logger = Logger(label: "TextModel")

    @Published var loadState: LoadState = .idle
    @Published var lines: [String] = []
    public var resourceName: String
    
    public init(resourceName: String = "Rapunzel") {
        Self.logger.debug("Creating TextModel from \(resourceName).txt")
        self.resourceName = resourceName
        self.loadState = .loading
    }

    /// Load text from an embedded .txt file
    /// - Parameter resourceName: basename of a bundled .txt file
    @MainActor
    public func load(resourceName: String) async {
        Self.logger.debug("Loading text (with fake 3s delay)")
        do {
            try await Task.sleep(nanoseconds: 750_000_000)  // 0.75s
        } catch {
            self.loadState = .failed
            Self.logger.error( "Failed trying to sleep!  Surprising!")
        }
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "txt"),
              let data = try? Data(contentsOf: url),
              let str  = String(data: data, encoding: .utf8) else {
            self.lines = []
            self.loadState = .failed
            Self.logger.error( "Failed to load text file resource \(resourceName).txt")
            return
        }
        self.lines = str.components(separatedBy: .newlines)
        self.loadState = .loaded
        Self.logger.debug( "Loaded text file resource \(resourceName).txt")
    }
}
