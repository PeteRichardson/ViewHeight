//
//  TextModelTests.swift
//  ViewHeightTests
//
//  Created by Peter Richardson on 6/16/25.
//

import Testing

struct TextModelTests {

    @MainActor
    @Test func test_load_existing_resource() async throws {
        let textModel = TextModel(resourceName: "Rapunzel")
        await textModel.load(resourceName: textModel.resourceName)
        #expect(textModel.lines.count == 125)
    }
    
    @MainActor
    @Test func test_load_non_existing_resource() async throws {
        let textModel = TextModel(resourceName: "NoSuchFile")
        await textModel.load(resourceName: textModel.resourceName)
        #expect(textModel.lines.count == 0)
        #expect(textModel.loadState == .failed)
    }
    
    @MainActor
    @Test func test_default_resource() async throws {
        let textModel = TextModel()
        await textModel.load(resourceName: textModel.resourceName)
        #expect(textModel.lines.count == 125)
    }

}
