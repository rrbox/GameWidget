//
//  GroupTests.swift
//  
//
//  Created by rrbox on 2022/12/02.
//

import XCTest
import SpriteKit
import GameWidget

final class GroupTest: XCTestCase {
    func generateNodesNameReduced<T: WidgetListProtocol>(@GroupBuilder _ list: () -> T) -> String {
        list().widgetNodes(center: WidgetNotificationSystem()).reduce(into: "") { partialResult, node in
            guard let name = node.name else {
                XCTFail()
                return
            }
            partialResult += name
        }
    }
    
    // group に widget が正しい順番で追加されているかチェックします.
    func testNodeArrayGenerate() {
        XCTAssertEqual("0", self.generateNodesNameReduced {
            TextNode(value: "0")
        })
        XCTAssertEqual("01", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
        })
        XCTAssertEqual("012", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
            TextNode(value: "2")
        })
        XCTAssertEqual("0123", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
            TextNode(value: "2")
            TextNode(value: "3")
        })
        XCTAssertEqual("01234", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
            TextNode(value: "2")
            TextNode(value: "3")
            TextNode(value: "4")
        })
        XCTAssertEqual("012345", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
            TextNode(value: "2")
            TextNode(value: "3")
            TextNode(value: "4")
            TextNode(value: "5")
        })
        XCTAssertEqual("0123456", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
            TextNode(value: "2")
            TextNode(value: "3")
            TextNode(value: "4")
            TextNode(value: "5")
            TextNode(value: "6")
        })
        XCTAssertEqual("01234567", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
            TextNode(value: "2")
            TextNode(value: "3")
            TextNode(value: "4")
            TextNode(value: "5")
            TextNode(value: "6")
            TextNode(value: "7")
        })
        XCTAssertEqual("012345678", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
            TextNode(value: "2")
            TextNode(value: "3")
            TextNode(value: "4")
            TextNode(value: "5")
            TextNode(value: "6")
            TextNode(value: "7")
            TextNode(value: "8")
        })
        XCTAssertEqual("0123456789", self.generateNodesNameReduced {
            TextNode(value: "0")
            TextNode(value: "1")
            TextNode(value: "2")
            TextNode(value: "3")
            TextNode(value: "4")
            TextNode(value: "5")
            TextNode(value: "6")
            TextNode(value: "7")
            TextNode(value: "8")
            TextNode(value: "9")
        })
    }
}
