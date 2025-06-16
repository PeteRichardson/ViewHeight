//
//  ContentView.swift
//  ViewHeight
//
//  Created by Peter Richardson on 6/16/25.
//

import SwiftUI

struct ContentView: View {

    @State private var model = TextModel()
    @State var scrollPosition = ScrollPosition(edge: .top)
    
    var body: some View {
            TextView(model: $model, scrollPosition: $scrollPosition)
                .navigationTitle($model.resourceName)
                .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    ContentView()
}
