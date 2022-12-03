//
//  DisplayTests.swift
//  
//
//  Created by rrbox on 2022/12/03.
//

import XCTest
import GameWidget

final class DisplayTests: XCTestCase {
    func testDisplayGenerate() {
        let displayNode = Display()
            .place {
                TextNode(value: "0")
                TextNode(value: "1")
            }
            .place {
                TextNode(value: "2")
                TextNode(value: "3")
            }
            .node()
        
        XCTAssertEqual(displayNode.children.count, 4)
        XCTAssertEqual(displayNode.children.reduce(into: "", { partialResult, node in
            partialResult += node.name!
        }), "0123")
    }
}
