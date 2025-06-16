//
//  ContentView.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI

struct ContentView: View {
    private var font: Font {
        let fontName: String = "MonaspiceNe Nerd Font Mono"
        let fontSize: CGFloat = 16
        if NSFont(name: fontName, size: fontSize) != nil {
            return .custom(fontName, size: fontSize) // Use the custom font if it exists
        } else {
            return .system(size: fontSize, weight: .regular, design: .monospaced) // Fallback to monospaced system font
        }
    }
    
    @State private var model = TextModel()
    var body: some View {
        TextEditor(text: $model.text)
        .padding()
        .font(font)
    }
}

#Preview {
    ContentView()
}
