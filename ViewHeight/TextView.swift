//
//  TextView.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI

public struct TextView: View {
    public var font: Font {
        let fontName: String = "MonaspiceNe Nerd Font Mono"
        let fontSize: CGFloat = 16
        if NSFont(name: fontName, size: fontSize) != nil {
            return .custom(fontName, size: fontSize)  // Use the custom font if it exists
        } else {
            return .system(
                size: fontSize,
                weight: .regular,
                design: .monospaced
            )  // Fallback to monospaced system font
        }
    }

    @ObservedObject public var model: TextModel
    @Binding var scrollPosition: ScrollPosition

    public var body: some View {
        ScrollViewReader { proxy in
            ScrollView([.vertical, .horizontal]) {
                    VStack(alignment: .leading, spacing: 3) {
                        ForEach(model.lines.indices, id: \.self) { i in
                            Text(model.lines[i])
                        }
                    }
                    .padding()
                    .font(font)
                    .border(.green)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .scrollPosition($scrollPosition)
                .border(Color.white)
                
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    @Previewable @StateObject var model = TextModel()
    @Previewable @State var scrollPosition: ScrollPosition = .init()
    TextView(model: model, scrollPosition: $scrollPosition)
}
