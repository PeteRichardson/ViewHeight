//
//  ContentView.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var model = TextModel()
    var body: some View {
        TextEditor(text: $model.text)
        .padding()
    }
}

#Preview {
    ContentView()
}
