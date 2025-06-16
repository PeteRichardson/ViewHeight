//
//  TextModelTests.swift
//  ViewHeightTests
//
//  Created by Peter Richardson on 6/16/25.
//

import Testing

struct TextModelTests {

    @MainActor
    @Test func test_load_existing_resource() throws {
        let textModel = TextModel(resourceName: "Rapunzel")
        #expect(textModel.text.count == 7267)
    }
    
    @MainActor
    @Test func test_load_non_existing_resource() throws {
        let textModel = TextModel(resourceName: "NoSuchFile")
        #expect(textModel.text.starts(with: "Could not load embedded text"))
    }
    
    @MainActor
    @Test func test_default_resource() throws {
        let textModel = TextModel()
        #expect(textModel.text.count == 7267)
    }

}
