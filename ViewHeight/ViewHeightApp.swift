//
//  ViewHeightApp.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI

final class TitleModel: ObservableObject {
    @Published var title: String = "View Height"
}

@main
struct ViewHeightApp: App {
    @StateObject private var titleModel = TitleModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .navigationTitle(titleModel.title)
        }
    }
}
