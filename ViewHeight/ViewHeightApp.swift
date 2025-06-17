//
//  ViewHeightApp.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI
import Logging

final class TitleModel: ObservableObject {
    var title: String = "View Height"
}

@main
struct ViewHeightApp: App {
    
    @StateObject private var titleModel = TitleModel()
    
    init() {
        LoggingSystem.bootstrap { label in
            var handler = StreamLogHandler.standardOutput(label: label)
            #if DEBUG
            handler.logLevel = .debug
            #endif
            return handler
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .navigationTitle(titleModel.title)
        }
    }
}
