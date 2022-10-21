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

final class MemoryTest: XCTestCase {
    func testMemorySize() throws {
        print("int:", MemoryLayout.size(ofValue: 0))
        print("string:", MemoryLayout.size(ofValue: ""))
        
        let button = Button(.init("test"))
            .position(CGPoint(x: 0, y: 0))
            .position(CGPoint(x: 0, y: 0))
            .position(CGPoint(x: 0, y: 0))
        
        print(MemoryLayout.size(ofValue: button))
        
        let barchart = HorizontalSingleBarChart(name: .init("test"))
        
        print(MemoryLayout.size(ofValue: barchart))
    }
}
