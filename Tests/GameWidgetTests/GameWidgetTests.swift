import XCTest
@testable import GameWidget

final class NodeTests: XCTestCase {
    func testModifiers() throws {
        let node = NodeWidget {
            Button(.init("test"))
        }
            .modifiable
            .position(CGPoint(x: 1, y: 1))
            .scale(2)
            .zRotation(2)
            .zPosition(1)
            .createModels().0
            
        XCTAssertEqual(node.position, CGPoint(x: 1, y: 1))
        XCTAssertEqual(node.xScale, 2)
        XCTAssertEqual(node.yScale, 2)
        XCTAssertEqual(node.zRotation, 2)
        XCTAssertEqual(node.zPosition, 1)
        XCTAssertEqual(node.children.count, 1)
    }
}
