import XCTest
@testable import GameWidget

final class NodeTests: XCTestCase {
    func testModifiers() throws {
        let node = Node {
            Button(.init("test"))
        }
            .position(CGPoint(x: 1, y: 1))
            .scale(2)
            .zRotation(2)
            .node()
            
        XCTAssertEqual(node.position, CGPoint(x: 1, y: 1))
        XCTAssertEqual(node.xScale, 2)
        XCTAssertEqual(node.yScale, 2)
        XCTAssertEqual(node.zRotation, 2)
        XCTAssertEqual(node.children.count, 1)
    }
}
